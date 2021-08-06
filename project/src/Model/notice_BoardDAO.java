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
	notice_BoardDTO noticelist2= null;
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

//	// 공고 참여자 목록테이블에 삽입 (notice_member) -- ????????????//////////얘기해보기
//	public int upload() {
//		try {
//			conn();
//
//			String sql = "insert into notice_member(notice_number) select distinct notice_number from notice";
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

	// 사용자 주소 중심 매칭 기능 사라져서 백업해두고 지움
	
	// 리뷰를 아직 작성하지 않았을 때 공고목록
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

	// 전체게시글 보여주기 메소드 
	public ArrayList<notice_BoardDTO> showBoard(String id) {
		ArrayList<notice_BoardDTO> notic_BoardDTO_list = new ArrayList<notice_BoardDTO>();
		try {
			conn();
			String sql = "select * from notice \r\n"
					+ "where notice_number not in(select notice_number \r\n"
					+ "							from notice_member \r\n"
					+ "							where member_id in(?)) "
					+ "and limited_number<=30 "
					+ "order by plog_date desc ";
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

//	         psmt.setDouble(1, inputLat); // a
//	         psmt.setDouble(2, inputLng); // b
//	         psmt.setDouble(3, inputLat);
//	         psmt.setDouble(4, inputDistance);
//
//	         rs = psmt.executeQuery();
//
//	         while (rs.next()) {
//	            int noticeNumber = rs.getInt(1);
//	            int tip_off_number = rs.getInt(2);
//	            String noticeDate = rs.getString(3);
//	            String limitedNumber = rs.getString(4);
//	            String plogDate = rs.getString(5);
//	            String noticeImage = rs.getString(6);
//	            String addr = rs.getString(7);
//	            double lat = rs.getDouble(8);
//	            double lng = rs.getDouble(9);
//
//	            notice_BoardDTO dto = new notice_BoardDTO(noticeNumber, tip_off_number, noticeDate, limitedNumber,
//	                  plogDate, noticeImage, addr, lat, lng);
//	            list.add(dto);
//	         }
//	      } catch (SQLException e) {
//	         e.printStackTrace();
//	      } finally {
//	         close();
//	      }
//	      return list;
//	   }
	 

	
	// 플로깅 날짜가 지나면 다시 +7일 뒤로 수정하는 메소드
//	public int dayUpdate() {
//			try {
//				conn();
//				
//				String sql = "UPDATE notice SET plog_date = (select plog_date+7 from notice WHERE plog_date<sysdate) where ";
//
//				psmt = conn.prepareStatement(sql);
//
//				psmt.setInt(1, dto.getReport_number());
//
//				cnt = psmt.executeUpdate();
//
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				close();
//			}		
//		
//		return cnt;
//				}

			
			
			public notice_BoardDTO lating(int num){
				 ArrayList<notice_BoardDTO> noticelist = new ArrayList<notice_BoardDTO>();
					try {
						conn();
						
						String sql ="select lat lng from notice where notice_number = ?";
						
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1,num);
						rs = psmt.executeQuery();
						if(rs.next()) {
							double lat = rs.getDouble("lat");
							double lng = rs.getDouble("lng");
							noticelist2= new notice_BoardDTO(lat,lng);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						close();
					}return noticelist2;

			}
}
			   
