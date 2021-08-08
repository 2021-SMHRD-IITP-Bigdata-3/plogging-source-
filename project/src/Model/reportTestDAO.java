package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class reportTestDAO {
	Connection conn = null;
	int cnt = 0;
	int num = 0;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ArrayList<reportTestDTO> array = new ArrayList<reportTestDTO>();

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_f6";
			String dbpw = "smhrd6";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 제보를 제보테이블에 업로드 하는 메소드
	public int reportUpload(reportTestDTO dto) {
		try {
			conn();
			String sql = "insert into tip_off values(num_tip_off.nextval, sysdate, ?,?,?,?,0)";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, dto.getLat());
			psmt.setString(2, dto.getImg());
			psmt.setDouble(3, dto.getLng());
			psmt.setString(4, dto.getAddr());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	// 모든 사용가능한 (notice_check=0) 제보들을 어레이리스트로 반환하는 메소드
	public ArrayList<reportTestDTO> reportShow() {
		try {
			conn();

			String sql = "select * from tip_off WHERE notice_check=0 ";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int report_number = rs.getInt(1);
				String report_date = rs.getString(2);
				double lat = rs.getDouble(3);
				String img = rs.getString(4);
				double lng = rs.getDouble(5);
				String addr = rs.getString(6);
				int notice_check = rs.getInt(7);

				reportTestDTO dto = new reportTestDTO(report_number, report_date, lat, img, lng, addr, notice_check);
				array.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return array;
	}

	// 새 제보의 rkm 반경 안의 제보들을 어레이리스트로 반환하는 메소드
	public ArrayList<reportTestDTO> reportRradius(double latX, double lngY, ArrayList<reportTestDTO> inputArray, double r) {
		for (int i = 0; i < inputArray.size(); i++) {
			double latA = inputArray.get(i).getLat();
			double latB = inputArray.get(i).getLng();
			double cos = Math.cos(Math.toRadians(latA)) * Math.cos(Math.toRadians(latX))
					* Math.cos(Math.toRadians(lngY - latB));
			double sin = Math.sin(Math.toRadians(latA)) * Math.sin(Math.toRadians(latX));
			double result = cos + sin;
			double distance = 6371 * Math.acos(result);
			System.out.println((i + 1) + "번째 제보 확인==========");
			System.out.println("acos에 들어갈 결과 (-1과1사이어야 함): " + result);
			System.out.println((i + 1) + "번째 제보와 현재 제보 사이 거리 : " + distance);
			System.out.println("===================");
			// dkm 미만일 때 카운트
			if (distance < r) {
				array.add(inputArray.get(i));
			}
		}
		System.out.println("현재 재보지와 거리가 " + r + " 이하인 제보들 개수 " + array.size());
		return array;
	}

	// 제보를 공고로 만들어주는 메소드
	public int makeNotice(reportTestDTO dto) {
		try {
			conn();

			String sql = "INSERT INTO notice VALUES(num_notice.nextval, ?, sysdate, 0, SYSDATE+7, ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getReport_number());
			psmt.setString(2, dto.getImg());
			psmt.setString(3, dto.getAddr());
			psmt.setDouble(4, dto.getLat());
			psmt.setDouble(5, dto.getLng());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// noticeCheck를 1로 수정해주는 메소드 (공고자동화에 사용된 제보들은 1 처리해서 폐기)
	public int noticeCheck(reportTestDTO dto) {
		try {
			conn();
			String sql = "UPDATE tip_off SET notice_check = 1 WHERE report_number = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getReport_number());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}