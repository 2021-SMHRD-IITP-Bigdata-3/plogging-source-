package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class notice_BoardDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int cnt = 0;
	notice_BoardDTO dto = null;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			// @localhost -> @121.147.52.216
			// 소연 ip : 121.147.52.216
			// 준오 ip : 121.147.52.104
			// 유종 ip : 121.147.52.230
			// 진영 ip : 210.223.239.240
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
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 공고 참여자 목록테이블에 삽입 (notice_member) -- ????????????//////////얘기해보기
	public int upload() {
		try {
			conn();

			String sql = "insert into notice_member(notice_number) select distinct notice_number from notice";
			psmt = conn.prepareStatement(sql);

			psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 사용자 주소 중심 매칭 기능 사라져서 주석처리 해둠
//	public ArrayList<notice_BoardDTO> match(double inputLat, double inputLng, double inputDistance) {
//		ArrayList<notice_BoardDTO> list = new ArrayList<notice_BoardDTO>();
//
//		try {
//			conn();
//			String sql = "select * "
//					+ "from (select notice_number, tip_off_number, notice_date, limited_number, plog_date, notice_image, address, lat, lng, "
//					+ "6371*acos(Round(cos(?*0.017453)*cos(lat*0.017453)*cos(lng*0.017453-?*0.017453)"
//					+ "+sin(?*0.017453)*sin(lat*0.017453))) as distance from notice ORDER BY distance) n "
//					+ "WHERE n.distance<?";
//
//			psmt = conn.prepareStatement(sql);
//
//			psmt.setDouble(1, inputLat); // a
//			psmt.setDouble(2, inputLng); // b
//			psmt.setDouble(3, inputLat);
//			psmt.setDouble(4, inputDistance);
//
//			rs = psmt.executeQuery();
//
//			while (rs.next()) {
//				int noticeNumber = rs.getInt(1);
//				int tip_off_number = rs.getInt(2);
//				String noticeDate = rs.getString(3);
//				String limitedNumber = rs.getString(4);
//				String plogDate = rs.getString(5);
//				String noticeImage = rs.getString(6);
//				String addr = rs.getString(7);
//				double lat = rs.getDouble(8);
//				double lng = rs.getDouble(9);
//
//				notice_BoardDTO dto = new notice_BoardDTO(noticeNumber, tip_off_number, noticeDate, limitedNumber,
//						plogDate, noticeImage, addr, lat, lng);
//				list.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return list;
//	}

	public ArrayList<notice_BoardDTO> showOne(String id) {
		ArrayList<notice_BoardDTO> noticelist = new ArrayList<notice_BoardDTO>();
		try {
			conn();

			String sql = "select notice_number ,address ,lat,lng from notice \r\n"
					+ "where notice_number in(select notice_number \r\n"
					+ "							from notice_member \r\n"
					+ "							where member_id in(?) and review_check is null) order by plog_date desc";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int notice_number = rs.getInt("notice_number");
				String addr = rs.getNString("address");
				double lat = rs.getDouble("lat");
				double lng = rs.getDouble("lng");
				notice_BoardDTO noticelist2 = new notice_BoardDTO(notice_number, addr, lat, lng);
				noticelist.add(noticelist2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return noticelist;
	}

	// 전체게시글 보여주기 메소드 (조회에서 사용)
	public ArrayList<notice_BoardDTO> showBoard(String id) {
		ArrayList<notice_BoardDTO> notic_BoardDTO_list = new ArrayList<notice_BoardDTO>();
		try {
			conn();
			String sql = "select * from notice \r\n" + "where notice_number not in(select notice_number \r\n"
					+ "							from notice_member \r\n"
					+ "							where member_id in(?)) "
					+ "							and limited_number<30"
					+ "							order by plog_date desc ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int noticeNumber = rs.getInt("notice_number");
				String noticeImage = rs.getString("notice_image");
				String limitedNumber = rs.getString("limited_number");
				String addr = rs.getNString("address");
				String plogDate = rs.getString("plog_date");

				notice_BoardDTO dto = new notice_BoardDTO(noticeNumber, limitedNumber, plogDate, noticeImage, addr);
				notic_BoardDTO_list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return notic_BoardDTO_list;

	}

	// 누나 이거 누나가 알아서 넣어주세요! ======> 우선 참가시 1포인트 받을 수 있게 해뒀음
	// 사용자가 신청을 하고 난다면 포인트가 올라가는 메소드 
	//    ===> 참가버튼 누르면 사용되는 거라서 noticeJoinDAO로 이동 ---- 진영아 읽었으면 지워도 돼
//	public int upPoint(String id) {
//		try {
//			conn();
//			String sql = "insert into member(point) value (numPoint.nextval) where member_id = ?";
//
//			psmt.setString(1, id);
//			psmt = conn.prepareStatement(sql);
//
//			psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return cnt;
//	}

	// 이건 수정해야할 사항
	// 참가버튼을 누르면 사용되는 거라서  noticeJoinDAO로 이동했음 -- 진영아 읽었으면 지워도 돼
//	public int upMember(int noticeNumber) {
//		try {
//			conn();
//			String sql = "update notice set limited_number = limit_number.nextval  where notice_number = ?";
//			psmt.setInt(1, noticeNumber);
//			psmt = conn.prepareStatement(sql);
//
//			psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return cnt;
//	}
//
}
