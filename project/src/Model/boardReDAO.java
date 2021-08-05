package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class boardReDAO {
   Connection conn = null;
   PreparedStatement psmt = null;
   ResultSet rs = null;
   boardReDTO dto = null;
   
   int cnt = 0;
   
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
   public int upload(boardReDTO dto) {
      try {
         conn();
         String sql = "INSERT INTO board_num VALUES(num_board_num.nextval,?,?,?,?,sysdate)";
      
         psmt = conn.prepareStatement(sql);
         
         psmt.setInt(1, dto.getCommentsNumber());
         psmt.setString(2, dto.getBoardNum());
         psmt.setString(3, dto.getMemberID());
         psmt.setString(4, dto.getCommentsPw());
         psmt.setString(5, dto.getCommentsContents());
         
         
         cnt = psmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      } return cnt;
   }
   
   public boardReDTO showOne(int commentsNumber) {
      try {
         conn();
         String sql = "SELECT * FROM board WHERE board_num = ?";
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, commentsNumber);
         rs = psmt.executeQuery();
         
         if(rs.next()) {
            String boardNum = rs.getString(2);
            String memberID = rs.getString(3);
            String commentsPw = rs.getString(4);
            String commentsContents = rs.getString(5);
            String commentsDate=rs.getString(6);
            
            dto = new boardReDTO(commentsNumber, boardNum, memberID, commentsPw, commentsContents, commentsDate);
            
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      } return dto;
   }
   public ArrayList<boardReDTO> showMember() {
      ArrayList<boardReDTO> boardRe_list = new ArrayList<boardReDTO>();
      try {
         conn();
         String sql = "select * from board_num";
         psmt = conn.prepareStatement(sql);
         rs = psmt.executeQuery();
         
         while(rs.next()) {
            int commentsNumber = rs.getInt(1);
            String boardNum = rs.getString(2);
            String memberID = rs.getString(3);
            String commentsPw = rs.getString(4);
            String commentsContents = rs.getString(5);
            String commentsDate=rs.getString(6);
            
            boardReDTO    dto = new boardReDTO(commentsNumber, boardNum, memberID, commentsPw, commentsContents, commentsDate);

            boardRe_list.add(dto);         
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      } return boardRe_list;      
   }
   
}