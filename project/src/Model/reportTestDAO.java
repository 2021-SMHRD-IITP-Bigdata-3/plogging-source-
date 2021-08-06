package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class reportTestDAO {
<<<<<<< HEAD
	Connection conn = null;
	int cnt = 0;
	int num = 0;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	reportTestDTO dto = null;
=======
   Connection conn = null;
   int cnt = 0;
   int num = 0;
   PreparedStatement psmt = null;
   ResultSet rs = null;
   reportTestDTO dto = null;

   public void conn() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
=======
         // 테스트용 url
//         String url = "jdbc:oracle:thin:@localhost:1521:xe";
//         String dbid = "hr";
//         String dbpw = "hr";
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
			// 테스트용 url
//			String url = "jdbc:oracle:thin:@localhost:1521:xe";
//			String dbid = "hr";
//			String dbpw = "hr";
=======
         String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
         String dbid = "campus_f6";
         String dbpw = "smhrd6";
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_f6";
			String dbpw = "smhrd6";
=======
         conn = DriverManager.getConnection(url, dbid, dbpw);
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
=======
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
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
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
=======
         psmt = conn.prepareStatement(sql);
         psmt.setDouble(1, dto.getLat());
         psmt.setString(2, dto.getImg());
         psmt.setDouble(3, dto.getLng());
         psmt.setString(4, dto.getAddr());
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

	// 제보를 제보테이블에 업로드 하는 메소드
	public int reportUpload(reportTestDTO dto) {
		try {
			conn();
			String sql = "insert into tip_off values(num_tip_off.nextval, sysdate, ?,?,?,?,0)";

<<<<<<< HEAD
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, dto.getLat());
			psmt.setString(2, dto.getImg());
			psmt.setDouble(3, dto.getLng());
			psmt.setString(4, dto.getAddr());
=======
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return cnt;

   }

   // 모든 사용가능한 (notice_check=0)제보를 리스트로 반환하는 메소드
   public ArrayList<reportTestDTO> reportShow() {
      ArrayList<reportTestDTO> list = new ArrayList<reportTestDTO>();

      try {
         conn();
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
			cnt = psmt.executeUpdate();
=======
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
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
=======
            reportTestDTO dto = new reportTestDTO(report_number, report_date, lat, img, lng, addr, notice_check);
            list.add(dto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return list;
   }

   // 제보를 공고로 만들어주는 메소드
   public int automate(reportTestDTO dto) {
      // cnt= 0;
      try {
         conn();
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

	}

<<<<<<< HEAD
	// 모든 사용가능한 (notice_check=0)제보를 리스트로 반환하는 메소드
	public ArrayList<reportTestDTO> reportShow() {
		ArrayList<reportTestDTO> list = new ArrayList<reportTestDTO>();
=======
         psmt = conn.prepareStatement(sql);

         psmt.setInt(1, dto.getReport_number());
         psmt.setString(2, dto.getImg());
         psmt.setString(3, dto.getAddr());
         psmt.setDouble(4, dto.getLat());
         psmt.setDouble(5, dto.getLng());
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

		try {
			conn();

<<<<<<< HEAD
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
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 제보를 공고로 만들어주는 메소드
	public int automate(reportTestDTO dto) {
		// cnt= 0;
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

	// noticeCheck를 1로 수정해주는 메소드
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
=======
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return cnt;
   }

   // noticeCheck를 1로 수정해주는 메소드
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
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

}