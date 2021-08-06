<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   body{
    background-color: #efefef;
   /* scrollbar-width: none;
    -ms-overflow-style: none; */
  
   }
   table {
    
	}
textarea {
	 border: 0;
	margin: 0 auto;
	width:100%;
	height: 500px;
	outline: none;
	resize: none;
	font-size: 14px;

	
	}
   .mtable1{
   width: 100%;

        }
      .mtable2{
   width: 100%;

         }
   tr , td{
      /* padding: 5px; */
     
   }
   .htd{

   }
.topicon {
   background-color: #2DB400;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 15px;

   
}
   h1{
   padding: 100px 130px;
   
   }
   div {
   /* padding: 10px */
   margin-left: auto;
   margin-right: auto;

}

.tex {
   width: 310px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;

   
}
.ltex{
    width: 100%;
   box-sizing : border-box;
   height: 50px;
   border: none;
   padding: 10px;
   /* text-align: center; */
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   /* border-radius: 12px; */

}

.stex1 {
   width: 270px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.stex2 {
   width: 220px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.button {
   background-color: #2DB400;
   width: 330px;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 12px;

   
}

.dbutton1{
  position: fixed;
  bottom: 20px;
  right: 20px;

  border: none;
  border-radius: 16px;
  background: #69f0ae;
  color: white;
  padding: 12px;
  font-weight: bold;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton2{
  position: fixed;
  bottom: 20px;
  right: 120px;

  border: none;
  border-radius: 16px;
  background: #69f0ae;
  color: white;
  padding: 12px;
  font-weight: bold;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton3{
  position: fixed;
  bottom: 20px;
  right: 220px;

  border: none;
  border-radius: 16px;
  background: #69f0ae;
  color: white;
  padding: 12px;
  font-weight: bold;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton4{
  position: fixed;
  bottom: 20px;
  right: 320px;

  border: none;
  border-radius: 16px;
  background: #69f0ae;
  color: white;
  padding: 12px;
  font-weight: bold;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton5{
  position: fixed;
  bottom: 20px;
  right: 420px;

  border: none;
  border-radius: 16px;
  background: #69f0ae;
  color: white;
  padding: 12px;
  font-weight: bold;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.down{
position: fixed;
bottom: 0px;
width:100%;
height:60px;
border: none;
  background: #efefef;
  color: white;
  padding: 12px;
  font-weight: bold;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}

</style>
</head>
<body>
<div >


<%
	memberDTO info = (memberDTO)session.getAttribute("info");   
%>

   <div >
      <table  class="mtable1">


   <div>
      <table class="mtable1" >
         <tr>
            <td style="text-align:left;"><h2 >Plogging</h2></td>
         </tr>
      </table>
   </div>
		<form action="reportPostServiceCon" method="post" enctype = "multipart/form-data">
			<table class="mtable2">
				<tr>
					<td colspan="4"><input type="text" class="ltex" placeholder="제목"
						name="title"></td>
				</tr>
				<tr>
					<td style="text-align:right;" class="htd">
					<input type="file" name="fileName" >
					<a href="inputAddress.jsp" target="_blank"><img
							src="Map.png"  height="50"></a>
<%
 	request.setCharacterEncoding("EUC-KR");

	 String lat = request.getParameter("lat");
	 String lng = request.getParameter("lng");
	 String addr = request.getParameter("addr");
	 System.out.println("latdd : " + lat);
	 System.out.println("lngdd :" + lng);
 %>
			  <input type="hidden" name="lat" id="lat">
			  <input type="hidden" name="lng" id="lng">
			  <input type="hidden" name="addr" id="addr">
			   </td>
				</tr>
				<tr>
					<td align="center" colspan="4"><textarea  name="content"></textarea></td>
				</tr>
			</table >
			<br>
			<table align="center" >
				<tr>
					<td align="center"><div>
					<input type="submit" class="button" value="제보하기 완료"></div></td>
				</tr>
			</table>
			<br><br><br><br>			
		</form>
		<div class="down">
			<div class="dbutton1">메인</div>
			<div class="dbutton2">조회</div>
			<div class="dbutton3">후기</div>
			<div class="dbutton4">게시판</div>
			<div class="dbutton5">제보</div>
			</div>
	<script>
	 <%if(lat!=null){%>
     document.getElementById('lat').value = "<%=lat%>";
     document.getElementById('lng').value = "<%=lng%>";
     document.getElementById('addr').value = "<%=addr%>";
  <%}%>	</script>
</body>
</html>