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

		
		/////////////// 제보 -> 공고 /////////////// 
		// 전역변수들 선언
		ArrayList<reportTestDTO> array = new ArrayList<reportTestDTO>(); // 모든 제보 목록
		ArrayList<reportTestDTO> array2 = new ArrayList<reportTestDTO>(); // 반경 안의 제보 목록
		array.clear();
		array2.clear();
		int mCnt = 0;
		int ckCnt = 0;
		System.out.println("어레이사이즈 초깃값 0 = " + array.size());
		System.out.println("어레이2사이즈 초깃값 0: " + array2.size());
		System.out.println("자동화cnt 초깃값 0 = " + mCnt);
		System.out.println("체크cnt 초깃값 0 = " + ckCnt);

		if (upCnt > 0) {
			System.out.println("제보 업로드 성공");
			// (check가 0)사용가능한 제보 리스트
			array = dao.reportShow();
			System.out.println("check가 0인 모든 제보들 개수  = " + array.size());
			// 새 제보의 dto에 업로드한 데이터의 제보번호 넣어주기
			for (int i = 0; i < array.size(); i++) {
				if ((array.get(i).getLat() - dto.getLat()) == 0 && (array.get(i).getLng() - dto.getLng()) == 0) {
					System.out.println("일치 좌표 있음");
					dto.setReport_number(array.get(i).getReport_number());
					dto.setReport_date(array.get(i).getReport_date());
					dto.setNotice_check(array.get(i).getNotice_check());
				}
			}
			
			// 새 제보의 반경 500m 안의 제보들 추출
			// 새 제보의 위도, 경도
			double latX = dto.getLat();
			double lngY = dto.getLng();
			// 반경 500m 안의 제보들 추출 					// 우선 테스트용으로 500m 반경. 나중에 수정
			array2 = dao.reportRradius(latX, lngY, array, 0.5);

			if (array2.size() > 3) { // 가데이터로 연습하려고 3으로 둠
				// 제보 -> 공고
				mCnt = dao.makeNotice(dto);
				System.out.println("공고화 됐다면 mCnt = 1 = " + mCnt);
				if (mCnt > 0) {
					System.out.println("공고 업로드 성공");
					for (int i = 0; i < array2.size(); i++) {
						ckCnt = dao.noticeCheck(array2.get(i));
						if (ckCnt > 0) {
							System.out.println(i + "번째 제보 check를 1로 수정 성공");
						} else {
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
		response.sendRedirect("reportPostWrite.jsp");
	}

}