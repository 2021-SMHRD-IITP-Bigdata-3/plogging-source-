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
		System.out.println("===================reportPostServiceCon������]=========================");
		request.setCharacterEncoding("EUC-KR");

		// �̾߱� �� �� �κ�/////////////////////////////////////
		// ������ ����� �־��� ������ ���� ?? ����??
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
		System.out.println("(reportPostServiceCon������) title : " + title);
		System.out.println("(reportPostServiceCon������) lat :" + lat);
		System.out.println("(reportPostServiceCon������) lng :" + lng);
		System.out.println("(reportPostServiceCon������) �ѱ��ּ� : " + addr);
		System.out.println("(reportPostServiceCon������) fileName : " + fileName);

		//// ���� ���̺� ���ε�
		reportTestDTO dto = new reportTestDTO(lat, fileName, lng, addr);
		reportTestDAO dao = new reportTestDAO();
		int upCnt = dao.reportUpload(dto); // ���� �� ������ȣ�� �� �� ����!(�⺻���� 0�� ����־�) -> �ؿ��� ã���ִ� �˰��� �߰�
		
		/////////// ���� -> ����
		
		// ���������� ����
		ArrayList<reportTestDTO> array = new ArrayList<reportTestDTO>();
		ArrayList<reportTestDTO> array2 = new ArrayList<reportTestDTO>();
		array.clear();
		array2.clear();
		int autCnt = 0; 
		int ckCnt = 0; 
		System.out.println("��̻����� �ʱ갪 0 = " + array.size());
		System.out.println("���2������ �ʱ갪 0: " + array2.size());
		System.out.println("�ڵ�ȭcnt �ʱ갪 0 = " + autCnt);
		System.out.println("üũcnt �ʱ갪 0 = " + autCnt);

		if (upCnt > 0) {
			System.out.println("���� ���ε� ����");
			// (check�� 0)��밡���� ���� ����Ʈ
			array = dao.reportShow();
			System.out.println("check�� 0�� ��� ������ ����  = " + array.size());
			// �� ������ dto.������ȣ�� ���ε��� �������� ������ȣ �־��ֱ� 
			for (int i = 0; i < array.size(); i++) {
				if ((array.get(i).getLat() - dto.getLat()) == 0 && (array.get(i).getLng() - dto.getLng()) == 0) {
					System.out.println("��ġ ��ǥ ����");
					dto.setReport_number(array.get(i).getReport_number());
					dto.setReport_date(array.get(i).getReport_date());
					dto.setNotice_check(array.get(i).getNotice_check());
				}
			}
			// �� ������ �����ͺ��̽� ���� ��� ��������(array�ȿ� ���) �Ÿ� �缭 500m ������ �� ���� ���� (�Ÿ��� ���߿� ���� ���)
			double latX = dto.getLat();
			double latY = dto.getLng();
			double inputDistance = 0.5; // �켱 �̷��� �ϰ� ���߿� �� �κ� reportTestDAO�� �޼ҵ� ����� ��
			for (int i = 0; i < array.size(); i++) {
				double latA = array.get(i).getLat();
				double latB = array.get(i).getLng();
				double cos = Math.cos(Math.toRadians(latA))*Math.cos(Math.toRadians(latX))*Math.cos(Math.toRadians(latY-latB));
				double sin = Math.sin(Math.toRadians(latA))*Math.sin(Math.toRadians(latX));
				double result = cos+sin;
				double distance = 6371*Math.acos(result);
				System.out.println((i+1) + "��° Ȯ��==========");
				System.out.println("acos�� �� ��� (-1��1���̾�� ��): " + result);
				System.out.println((i+1) + "��°�� ���� �������� �Ÿ� : " + distance);
				// 500m �̳��� �� ī��Ʈ
				if (distance< 0.5) {
					array2.add(array.get(i));
				}
			}System.out.println("���� �纸���� �Ÿ���  0.5 ������ ������ ���� " + array2.size());
			
			if (array2.size() > 3) { // �������ͷ� �����Ϸ��� 3���� ��
				// �� ������ ����� ���� �����ͺ��̽��� �Է����ִ� �޼ҵ�
				autCnt = dao.automate(dto);
				System.out.println("�ڵ�ȭ �ƴٸ� autCnt = 1 = " + autCnt);
				if (autCnt > 0) {
					System.out.println("���� ���ε� ����");
///////////////////// noticeDAO.upload();///////////////////////////////////??? �����?
					for (int i = 0; i < array2.size(); i++) {
						ckCnt = dao.noticeCheck(array2.get(i));
						if (ckCnt > 0) {
							System.out.println(i + "��° ���� check�� 1�� ���� ����");
						}else {
							System.out.println(i + "��° ����check�� 1�� ���� ����");
						}
					}
				} else {
					System.out.println("���� ���ε� ����");
				}
			}
		} else {
			System.out.println("���� ���ε� ����");
		}

		System.out.println("[=============================]");
		// ������ ������ ������ �ٽ� ������������ ��. ����ڰ� ��? ������ �Ȱǰ�? ���� ������?
		// �ƴϸ� ������ �ϷεǾ����ϴ� ������ �߰�?? - ��� �� �ϼ��Ǹ� �߰��ϴ� ������� �ص� �� ��
		response.sendRedirect("reportPostWrite.jsp");
	}


// ������ �����ϸ� �� ����!!!!!!   
//   // �� ������ 1km �ٹ濡 �ִ� �������� ����Ʈ�� ��ȯ�ϴ� �޼ҵ�
//   list = dao.reportSearch(lat, lng, 1);
//   System.out.println("����Ʈ ä�������� Ȯ��. ����Ʈ ������ : " + list.size());
//   for (int i = 0; i < list.size(); i++) {
//      if ((list.get(i).getLat() - dto.getLat()) == 0 && (list.get(i).getLng() - dto.getLng()) == 0) {
//         System.out.println("��ġ ��ǥ ����");
//         dto.setReport_number(list.get(i).getReport_number());
//         dto.setReport_date(list.get(i).getReport_date());
//         dto.setNotice_check(list.get(i).getNotice_check());
//      }
//   }
//   if (list.size() > 2) { // �������ͷ� �����Ϸ��� 2�� ��
//      // �� ������ ����� ���� �����ͺ��̽��� �Է����ִ� �޼ҵ�
//      autCnt = dao.automate(dto);
//      System.out.println("�ڵ�ȭ �ƴٸ� autCnt = 1 = " + autCnt);
//      if (autCnt > 0) {
//         System.out.println("���� ���ε� ����");
/////////////////////// noticeDAO.upload();///////////////////////////////////
//         for (int i = 0; i < list.size(); i++) {
//            ckCnt = dao.noticeCheck(list.get(i));
//            if (ckCnt > 0) {
//               System.out.println(i + "��° ���� update ����");
//            }else {
//               System.out.println(i + "��° ���� update ����");
//            }
//         }
//      } else {
//         System.out.println("���� ���ε� ����");
//      }
//   }
//} else {
//   System.out.println("���� ���ε� ����");
//}
//
//System.out.println("[=============================]");
//// ������ ������ ������ �ٽ� ������������ ��. ����ڰ� ��? ������ �Ȱǰ�? ���� ������?
//// �ƴϸ� ������ �ϷεǾ����ϴ� ������ �߰�?? - ��� �� �ϼ��Ǹ� �߰��ϴ� ������� �ص� �� ��
//response.sendRedirect("reportPostWrite.jsp");
//}

}