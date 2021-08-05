package Model;

public class reportTestDTO {
   private int report_number;
   private String report_date;
   private Double lat;
   private String img;
   private Double lng;
   private String addr;
   
   public reportTestDTO(Double lat, Double lng) {
      super();
      this.lat = lat;
      this.lng = lng;
   }


   public reportTestDTO(Double lat, String img, Double lng, String addr) {
      super();
      this.lat = lat;
      this.img = img;
      this.lng = lng;
      this.addr = addr;
   }


   public reportTestDTO(int report_number, String report_date, Double lat, String img, Double lng, String addr) {
      super();
      this.report_number = report_number;
      this.report_date = report_date;
      this.lat = lat;
      this.img = img;
      this.lng = lng;
      this.addr = addr;
   }



   public int getReport_number() {
      return report_number;
   }

   public void setReport_number(int report_number) {
      this.report_number = report_number;
   }

   public String getReport_date() {
      return report_date;
   }

   public void setReport_date(String report_date) {
      this.report_date = report_date;
   }

   public Double getLat() {
      return lat;
   }

   public void setLat(Double lat) {
      this.lat = lat;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

   public Double getLng() {
      return lng;
   }

   public void setLng(Double lng) {
      this.lng = lng;
   }

   public String getAddr() {
      return addr;
   }

   public void setAddr(String addr) {
      this.addr = addr;
   }
   
   
   
}   