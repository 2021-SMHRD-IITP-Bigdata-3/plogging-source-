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
      //������ ����� �־��� ������ ����
      notice_BoardDAO noticeDAO = new notice_BoardDAO();
      // 1. �̹��� ���
      // getServletContext : ������ ����
      // getRealPath : ���� ���
      // �̹����� ������ ��θ� ���� (�����)
      String savePath = request.getServletContext().getRealPath("img");
      System.out.println(savePath);
      
      // 2. �̹��� ũ��
      // �̹��� ũ�⸦ ���� : �̹��� ȭ���� ���Ƽ� �뷮�� ũ�ϱ� ������ ������ �ʹ� ���� �����ؼ� �̹��� ũ�� ����
      // 5MB
      // 1kb = 1024byte
      // 1mb = 1024kb
      int maxSize = 5*1024*1024;
      
      // 3. �̹����� ���ڵ� ���
      String encoding = "EUC-KR";
      // request ��ü �̹��� ���� ���, ������ �̹��� ũ��, ���ڵ����, �ߺ�����
      MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
      
      String title = multi.getParameter("title");
      Double lat = Double.parseDouble(multi.getParameter("lat"));
      Double lng = Double.parseDouble(multi.getParameter("lng"));
      String addr = multi.getParameter("addr");
      
      // �̹��� �±׿� ��� �ۼ� �� 16������ ������� �ؼ� ���ڵ� ����
      // �׳� ���ڵ� �ϸ� ������ ���� �� ������ ���ϱ� if������
      String fileName = null;
      if (multi.getFilesystemName("fileName") != null) {         
         fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
      }
      System.out.println("(reportPostServiceCon������) title : " + title);
      System.out.println("(reportPostServiceCon������) lat :" + lat);
      System.out.println("(reportPostServiceCon������) lng :" + lng);
      System.out.println("(reportPostServiceCon������) �ѱ��ּ� : " + addr);
      System.out.println("(reportPostServiceCon������) fileName : " + fileName);
      
      
      // ���� ���̺� ���ε�
      reportTestDTO dto = new reportTestDTO(lat, fileName, lng, addr);
      reportTestDAO dao = new reportTestDAO();
      int cnt = dao.upload(dto); // ���� �� ������ȣ�� �� �� ����! -> �ؿ��� ã���ִ� �˰��� �߰�

      
      // ���� -> ����
      ArrayList<reportTestDTO> list = new ArrayList<reportTestDTO>();
      int cnt2 = 0; // ��������
      if(cnt>0) {
         System.out.println("���� ���ε� ����");
         // �� ������ 900m �ٹ濡 �ִ� �������� ����Ʈ�� ��ȯ�ϴ� �޼ҵ�
         list = dao.reportSearch(lat, lng, 2);
         for(int i =0; i<list.size(); i++) {
            System.out.print(list.get(i).getLat());
            System.out.println(":"+dto.getLat());
            System.out.print(list.get(i).getLng());
            System.out.println(":"+dto.getLng());
            if((list.get(i).getLat()-dto.getLat())==0 && (list.get(i).getLng()-dto.getLng())==0) {
               dto.setReport_number(list.get(i).getReport_number());
               System.out.println("��ġ ��ǥ ����");
            }
         }
         if (list.size()>3) { // �������ͷ� �����Ϸ��� 3���� ��
            // �� ������ ����� ���� �����ͺ��̽��� �Է����ִ� �޼ҵ�
             cnt2 = dao.automate(dto);
             System.out.println(cnt2);
             if(cnt2>0) {
                System.out.println("���� ���ε� ����");
                noticeDAO.upload();
             }
             else {
                System.out.println("���� ���ε� ����");
             }
         }
      }else {
         System.out.println("���� ���ε� ����");
      }
      // ������ ������ ������ �ٽ� ������������ ��. ����ڰ� ��? ������ �Ȱǰ�? ���� ������?
      // �ƴϸ� ������ �ϷεǾ����ϴ� ������ �߰�?? - ��� �� �ϼ��Ǹ� �߰��ϴ� ������� �ص� �� ��
      response.sendRedirect("reportPostWrite.jsp");
   }

}