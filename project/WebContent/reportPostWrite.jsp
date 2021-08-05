<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   body{
    background-color: #efefef;
   scrollbar-width: none;
    -ms-overflow-style: none;
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
   height: 25px;
   border: none;
   padding: 10px;
   /* text-align: center; */
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   /* border-radius: 12px; */
}
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

.dbutton {
   background-color: #2DB400;
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


</style>
</head>
<body>
   <div>
      <table class="mtable1">
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="text-align:right;">
            <input type="button" class="topicon" value="검색">
            <input type="button" class="topicon" value="내정보"
               onClick="location.href='myPage.jsp'"></td>
         </tr>
      </table>
   </div>
		<form action="reportPostServiceCon" method="post" enctype = "multipart/form-data">
			<table class="mtable2" >
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
	
	 System.out.println("latdd : " + lat);
	 System.out.println("lngdd :" + lng);
 %>
			  <input type="hidden" name="lat" id="lat">
			  <input type="hidden" name="lng" id="lng">
			   </td>
				</tr>
				<tr>
					<td align="center" colspan="4"><textarea  name="content"></textarea></td>
				</tr>
			</table>
			<br>
			<table align="center">
				<tr>
					<td align="center"><div>
					<input type="submit" class="button" value="제보하기 완료"></div></td>
				</tr>
			</table>
			<br><br><br><br>
			<table align="center">
				<tr>
					<td><input type="button" class="dbutton" value="메인" name="main"
						onClick="location.href='Main.jsp'"></td>
					<td><input type="button" class="dbutton" value="조회" name="inquiry"
						onClick="location.href='inquiryMain.jsp'"></td>
					<td><input type="button" class="dbutton" value="후기" name="review"
						onClick="location.href='reviewMain.jsp'"></td>
					<td><input type="button" class="dbutton" value="게시판" name="board"
						onClick="location.href='Board.jsp'"></td>
					<td><input type="button" class="dbutton" value="제보" name="report"
						onClick="location.href='reportPostWrite.jsp'"></td>
				</tr>
			</table>
			
		</form>
		
	<script>
		document.getElementById('lat').value = <%=lat%>;
		document.getElementById('lng').value = <%=lng%>;
	</script>
</body>
</html>