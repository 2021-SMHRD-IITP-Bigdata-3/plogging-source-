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
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("===================reportPostServiceCon페이지]=========================");
		request.setCharacterEncoding("EUC-KR");

		// 이야기 해 볼 부분/////////////////////////////////////
		// 참여자 목록을 넣어줄 생성자 생성 ?? 뭘까??
//      notice_BoardDAO noticeDAO = new notice_BoardDAO();
		
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		int maxSize = 5 * 1024 * 1024;
		String encoding = "EUC-KR";
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
				new DefaultFileRenamePolicy());
		String title = multi.getParameter("title");
		Double lat = Double.parseDouble(multi.getParameter("lat"));
		Double lng = Double.parseDouble(multi.getParameter("lng"));
		String addr = multi.getParameter("addr");
		String fileName = null;
		if (multi.getFilesystemName("fileName") != null) {
			fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "EUC-KR");
		}
		System.out.println("(reportPostServiceCon페이지) title : " + title);
		System.out.println("(reportPostServiceCon페이지) lat :" + lat);
		System.out.println("(reportPostServiceCon페이지) lng :" + lng);
		System.out.println("(reportPostServiceCon페이지) 한글주소 : " + addr);
		System.out.println("(reportPostServiceCon페이지) fileName : " + fileName);

		//// 제보 테이블에 업로드
		reportTestDTO dto = new reportTestDTO(lat, fileName, lng, addr);
		reportTestDAO dao = new reportTestDAO();
		int upCnt = dao.reportUpload(dto); // 넣을 때 제보번호를 알 수 없다!(기본값인 0이 들어있어) -> 밑에서 찾아주는 알고리즘 추가
		
		/////////// 제보 -> 공고
		
		// 전역변수들 선언
		ArrayList<reportTestDTO> array = new ArrayList<reportTestDTO>();
		ArrayList<reportTestDTO> array2 = new ArrayList<reportTestDTO>();
		array.clear();
		array2.clear();
		int autCnt = 0; 
		int ckCnt = 0; 
		System.out.println("어레이사이즈 초깃값 0 = " + array.size());
		System.out.println("어레이2사이즈 초깃값 0: " + array2.size());
		System.out.println("자동화cnt 초깃값 0 = " + autCnt);
		System.out.println("체크cnt 초깃값 0 = " + autCnt);

		if (upCnt > 0) {
			System.out.println("제보 업로드 성공");
			// (check가 0)사용가능한 제보 리스트
			array = dao.reportShow();
			System.out.println("check가 0인 모든 제보들 개수  = " + array.size());
			// 새 제보의 dto.제보번호에 업로드한 데이터의 제보번호 넣어주기 
			for (int i = 0; i < array.size(); i++) {
				if ((array.get(i).getLat() - dto.getLat()) == 0 && (array.get(i).getLng() - dto.getLng()) == 0) {
					System.out.println("일치 좌표 있음");
					dto.setReport_number(array.get(i).getReport_number());
					dto.setReport_date(array.get(i).getReport_date());
					dto.setNotice_check(array.get(i).getNotice_check());
				}
			}
			// 새 제보와 데이터베이스 안의 모든 제보들의(array안에 담긴) 거리 재서 500m 이하일 때 갯수 세기 (거리는 나중에 수정 고고)
			double latX = dto.getLat();
			double latY = dto.getLng();
			double inputDistance = 0.5; // 우선 이렇게 하고 나중에 이 부분 reportTestDAO로 메소드 만들면 돼
			for (int i = 0; i < array.size(); i++) {
				double latA = array.get(i).getLat();
				double latB = array.get(i).getLng();
				double cos = Math.cos(Math.toRadians(latA))*Math.cos(Math.toRadians(latX))*Math.cos(Math.toRadians(latY-latB));
				double sin = Math.sin(Math.toRadians(latA))*Math.sin(Math.toRadians(latX));
				double result = cos+sin;
				double distance = 6371*Math.acos(result);
				System.out.println((i+1) + "번째 확인==========");
				System.out.println("acos에 들어갈 결과 (-1과1사이어야 함): " + result);
				System.out.println((i+1) + "번째와 현재 제보지의 거리 : " + distance);
				// 500m 이내일 때 카운트
				if (distance< 0.5) {
					array2.add(array.get(i));
				}
			}System.out.println("현재 재보지와 거리가  0.5 이하인 제보들 개수 " + array2.size());
			
			if (array2.size() > 3) { // 가데이터로 연습하려고 3으로 둠
				// 그 제보를 공고로 만들어서 데이터베이스에 입력해주는 메소드
				autCnt = dao.automate(dto);
				System.out.println("자동화 됐다면 autCnt = 1 = " + autCnt);
				if (autCnt > 0) {
					System.out.println("공고 업로드 성공");
///////////////////// noticeDAO.upload();///////////////////////////////////??? 뭘까용?
					for (int i = 0; i < array2.size(); i++) {
						ckCnt = dao.noticeCheck(array2.get(i));
						if (ckCnt > 0) {
							System.out.println(i + "번째 제보 check를 1로 수정 성공");
						}else {
							System.out.println(i + "번째 제보check를 1로 수정 실패");
						}
					}
				} else {
					System.out.println("공고 업로드 실패");
				}
			}
		} else {
			System.out.println("제보 업로드 실패");
		}

		System.out.println("[=============================]");
		// 지금은 제보가 끝나면 다시 제보페이지로 와. 사용자가 어? 제보가 된건가? 싶지 않을까?
		// 아니면 제보가 완로되었습니다 페이지 추가?? - 얘는 다 완성되면 추가하는 기능으로 해도 될 듯
		response.sendRedirect("reportPostWrite.jsp");
	}


// 위에꺼 성공하면 다 지워!!!!!!   
//   // 새 제보의 1km 근방에 있는 제보들을 리스트로 반환하는 메소드
//   list = dao.reportSearch(lat, lng, 1);
//   System.out.println("리스트 채워졌는지 확인. 리스트 사이즈 : " + list.size());
//   for (int i = 0; i < list.size(); i++) {
//      if ((list.get(i).getLat() - dto.getLat()) == 0 && (list.get(i).getLng() - dto.getLng()) == 0) {
//         System.out.println("일치 좌표 있음");
//         dto.setReport_number(list.get(i).getReport_number());
//         dto.setReport_date(list.get(i).getReport_date());
//         dto.setNotice_check(list.get(i).getNotice_check());
//      }
//   }
//   if (list.size() > 2) { // 가데이터로 연습하려고 2로 둠
//      // 그 제보를 공고로 만들어서 데이터베이스에 입력해주는 메소드
//      autCnt = dao.automate(dto);
//      System.out.println("자동화 됐다면 autCnt = 1 = " + autCnt);
//      if (autCnt > 0) {
//         System.out.println("공고 업로드 성공");
/////////////////////// noticeDAO.upload();///////////////////////////////////
//         for (int i = 0; i < list.size(); i++) {
//            ckCnt = dao.noticeCheck(list.get(i));
//            if (ckCnt > 0) {
//               System.out.println(i + "번째 제보 update 성공");
//            }else {
//               System.out.println(i + "번째 제보 update 성공");
//            }
//         }
//      } else {
//         System.out.println("공고 업로드 실패");
//      }
//   }
//} else {
//   System.out.println("제보 업로드 실패");
//}
//
//System.out.println("[=============================]");
//// 지금은 제보가 끝나면 다시 제보페이지로 와. 사용자가 어? 제보가 된건가? 싶지 않을까?
//// 아니면 제보가 완로되었습니다 페이지 추가?? - 얘는 다 완성되면 추가하는 기능으로 해도 될 듯
//response.sendRedirect("reportPostWrite.jsp");
//}

}