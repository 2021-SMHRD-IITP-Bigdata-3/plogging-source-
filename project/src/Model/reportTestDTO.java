package Model;

public class reportTestDTO {
<<<<<<< HEAD
	private int report_number;
	private String report_date;
	private double lat;
	private String img;
	private double lng;
	private String addr;
	private int notice_check;
	private double distance;
=======
   private int report_number;
   private String report_date;
   private double lat;
   private String img;
   private double lng;
   private String addr;
   private int notice_check;
   private double distance;

   public reportTestDTO(double lat, double lng) {
      super();
      this.lat = lat;
      this.lng = lng;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
	public reportTestDTO(double lat, double lng) {
		super();
		this.lat = lat;
		this.lng = lng;
	}

	public reportTestDTO(double lat, String img, double lng, String addr) {
		super();
		this.lat = lat;
		this.img = img;
		this.lng = lng;
		this.addr = addr;
	}
=======
   public reportTestDTO(double lat, String img, double lng, String addr) {
      super();
      this.lat = lat;
      this.img = img;
      this.lng = lng;
      this.addr = addr;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
	public reportTestDTO(int report_number, String report_date, double lat, String img, double lng, String addr,
			int notice_check) {
		super();
		this.report_number = report_number;
		this.report_date = report_date;
		this.lat = lat;
		this.img = img;
		this.lng = lng;
		this.addr = addr;
		this.notice_check = notice_check;
	}

	public int getReport_number() {
		return report_number;
	}
=======
   public reportTestDTO(int report_number, String report_date, double lat, String img, double lng, String addr,
         int notice_check) {
      super();
      this.report_number = report_number;
      this.report_date = report_date;
      this.lat = lat;
      this.img = img;
      this.lng = lng;
      this.addr = addr;
      this.notice_check = notice_check;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
	public void setReport_number(int report_number) {
		this.report_number = report_number;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
=======
   public int getReport_number() {
      return report_number;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public String getImg() {
		return img;
	}

<<<<<<< HEAD
	public void setImg(String img) {
		this.img = img;
	}
=======
   public double getLat() {
      return lat;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
	public double getLng() {
		return lng;
	}
=======
   public void setLat(double lat) {
      this.lat = lat;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getAddr() {
		return addr;
	}

<<<<<<< HEAD
	public void setAddr(String addr) {
		this.addr = addr;
	}
=======
   public double getLng() {
      return lng;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

<<<<<<< HEAD
	public int getNotice_check() {
		return notice_check;
	}
=======
   public void setLng(double lng) {
      this.lng = lng;
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git

	public void setNotice_check(int notice_check) {
		this.notice_check = notice_check;
	}

<<<<<<< HEAD
	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	
=======
   public void setAddr(String addr) {
      this.addr = addr;
   }

   public int getNotice_check() {
      return notice_check;
   }

   public void setNotice_check(int notice_check) {
      this.notice_check = notice_check;
   }

   public double getDistance() {
      return distance;
   }

   public void setDistance(double distance) {
      this.distance = distance;
   }

   
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
}