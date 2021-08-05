package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.notice_BoardDAO;
import Model.notice_BoardDTO;
import Model.reportTestDAO;
import Model.reportTestDTO;


@WebServlet("/reportPostServiceCon")
public class reportPostServiceCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.setCharacterEncoding("EUC-KR");
      //참여자 목롟을 넣어줄 생성자 생성
      notice_BoardDAO noticeDAO = new notice_BoardDAO();
      // 1. 이미지 경로
      // getServletContext : 서블릿의 정보
      // getRealPath : 실제 경로
      // 이미지를 저장할 경로를 지정 (상대경로)
      String savePath = request.getServletContext().getRealPath("img");
      System.out.println(savePath);
      
      // 2. 이미지 크기
      // 이미지 크기를 제한 : 이미지 화질이 좋아서 용량이 크니까 서버에 공간을 너무 많이 차지해서 이미지 크기 제한
      // 5MB
      // 1kb = 1024byte
      // 1mb = 1024kb
      int maxSize = 5*1024*1024;
      
      // 3. 이미지명 인코딩 방식
      String encoding = "EUC-KR";
      // request 객체 이미지 저장 경로, 제한할 이미지 크기, 인코딩방식, 중복제거
      MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
      
      String title = multi.getParameter("title");
      Double lat = Double.parseDouble(multi.getParameter("lat"));
      Double lng = Double.parseDouble(multi.getParameter("lng"));
      String addr = multi.getParameter("addr");
      
      // 이미지 태그에 경로 작성 시 16진수로 적어줘야 해서 인코딩 진행
      // 그냥 인코딩 하면 파일이 없을 때 오류가 나니까 if문으로
      String fileName = null;
      if (multi.getFilesystemName("fileName") != null) {         
         fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
      }
      System.out.println("(reportPostServiceCon페이지) title : " + title);
      System.out.println("(reportPostServiceCon페이지) lat :" + lat);
      System.out.println("(reportPostServiceCon페이지) lng :" + lng);
      System.out.println("(reportPostServiceCon페이지) 한글주소 : " + addr);
      System.out.println("(reportPostServiceCon페이지) fileName : " + fileName);
      
      
      // 제보 테이블에 업로드
      reportTestDTO dto = new reportTestDTO(lat, fileName, lng, addr);
      reportTestDAO dao = new reportTestDAO();
      int cnt = dao.upload(dto); // 넣을 때 제보번호를 알 수 없다! -> 밑에서 찾아주는 알고리즘 추가

      
      // 제보 -> 공고
      ArrayList<reportTestDTO> list = new ArrayList<reportTestDTO>();
      int cnt2 = 0; // 전역변수
      if(cnt>0) {
         System.out.println("제보 업로드 성공");
         // 새 제보의 900m 근방에 있는 제보들을 리스트로 반환하는 메소드
         list = dao.reportSearch(lat, lng, 2);
         for(int i =0; i<list.size(); i++) {
            System.out.print(list.get(i).getLat());
            System.out.println(":"+dto.getLat());
            System.out.print(list.get(i).getLng());
            System.out.println(":"+dto.getLng());
            if((list.get(i).getLat()-dto.getLat())==0 && (list.get(i).getLng()-dto.getLng())==0) {
               dto.setReport_number(list.get(i).getReport_number());
               System.out.println("일치 좌표 있음");
            }
         }
         if (list.size()>3) { // 가데이터로 연습하려고 3으로 둠
            // 그 제보를 공고로 만들어서 데이터베이스에 입력해주는 메소드
             cnt2 = dao.automate(dto);
             System.out.println(cnt2);
             if(cnt2>0) {
                System.out.println("공고 업로드 성공");
                noticeDAO.upload();
             }
             else {
                System.out.println("공고 업로드 실패");
             }
         }
      }else {
         System.out.println("제보 업로드 실패");
      }
      // 지금은 제보가 끝나면 다시 제보페이지로 와. 사용자가 어? 제보가 된건가? 싶지 않을까?
      // 아니면 제보가 완로되었습니다 페이지 추가?? - 얘는 다 완성되면 추가하는 기능으로 해도 될 듯
      response.sendRedirect("reportPostWrite.jsp");
   }

}