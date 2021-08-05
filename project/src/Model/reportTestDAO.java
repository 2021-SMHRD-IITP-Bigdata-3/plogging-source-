package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class reportTestDAO {
   Connection conn = null;
   int cnt  = 0;
   int num = 0;
   PreparedStatement psmt = null;
   ResultSet rs = null;
   reportTestDTO dto =null;
   
   public void conn() {
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");

	         String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	         // @localhost -> @121.147.52.216
	         // �ҿ� ip : 121.147.52.216
	         // �ؿ� ip : 121.147.52.104
	         // ���� ip : 121.147.52.230
	         // ���� ip : 210.223.239.240
	         String dbid = "campus_f6";
	         String dbpw = "smhrd6";

	         conn = DriverManager.getConnection(url, dbid, dbpw);

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }

   
   public void close() {

      try{
         if(rs != null) {
            rs.close();
         }
         if(psmt != null) {
            psmt.close();
         psmt.close();
         }if(conn != null) {
            conn.close();
         }
      }catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   // ������ �������̺� ���ε� �ϴ� �޼ҵ�
   public int upload(reportTestDTO dto) {
      try {
         conn();
         String sql = "insert into tip_off values(num_tip_off.nextval, sysdate, ?,?,?,?)";


         psmt = conn.prepareStatement(sql);
         psmt.setDouble(1,dto.getLat());
         psmt.setString(2,dto.getImg());
         psmt.setDouble(3,dto.getLng());
         psmt.setString(4,dto.getAddr());

         cnt = psmt.executeUpdate();

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close();
      }return cnt;
      
   }
   
   // �� ������ inputDinstance �ٹ濡 �ִ� �������� ����Ʈ�� ��ȯ�ϴ� �޼ҵ� 
   public ArrayList<reportTestDTO> reportSearch(double inputLat, double inputLng, double inputDistance) {
      ArrayList<reportTestDTO> list = new ArrayList<reportTestDTO>();
      
      try {
         conn();

         String sql = "select * "
                 + "from (select report_number, report_date, lat, img, lng , addr, "
                 + "6371*acos(ROUND(cos(?*0.017453)*cos(lat*0.017453)*cos(lng*0.017453-?*0.017453)"
                 + "+sin(?*0.017453)*sin(lat*0.017453))) as distance from tip_off) t "
                 + "WHERE t.distance<? "
                 + "order by t.distance";
         
         psmt = conn.prepareStatement(sql);
         
         psmt.setDouble(1, inputLat); 
         psmt.setDouble(2, inputLng); 
         psmt.setDouble(3, inputLat);
         psmt.setDouble(4, inputDistance);
      
         rs = psmt.executeQuery();
         
         while(rs.next()) {
            int report_number = rs.getInt(1);
            String report_date = rs.getString(2);
            double lat = rs.getDouble(3);
            String img = rs.getString(4);
            double lng = rs.getDouble(5);
            String addr = rs.getString(6);

            reportTestDTO dto = new reportTestDTO(report_number, report_date, lat, img, lng, addr);
            list.add(dto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return list;   
   }
   
   // ������ ����� ������ִ� �޼ҵ�
   public int automate(reportTestDTO dto) {
      cnt= 0;
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
   
}