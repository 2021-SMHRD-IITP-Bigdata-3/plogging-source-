<%@page import="java.io.PrintWriter"%>
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
<<<<<<< HEAD
<style>
		table {
			width: 360px;
		}
		.side-menu {
            top: 50px;
            width: 45px;
            z-index: 10;
            background: #ff5858;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 70px;
            position: fixed;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
        }

        .sidebar-inner {
            height: 100%;
            padding-top: 30px;
        }

        #sidebar-menu,
        #sidebar-menu ul,
        #sidebar-menu li,
        #sidebar-menu a {
            border: 0;
            font-weight: normal;
            line-height: 1;
            list-style: none;
            margin: 0;
            padding: 0;
            position: relative;
            text-decoration: none;
        }

        #sidebar-menu>ul>li a {
            color: #fff;
            font-size: 20px;
            display: block;
            padding: 14px 0px;
            margin: 0px 0px 0px 8px;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            width: 28px;
            cursor: pointer;
        }

        #sidebar-menu .fas {
            padding-left: 6px;
        }

        /* 사이드 메뉴 */
        input[type="search"] {
            width: 180px;
            margin: 0 auto;
            margin-left: 9px;
            border: 2px solid #797979;
            font-size: 14px;
            margin-top: 10px;
            padding: 4px 0 4px 14px;
            border-radius: 50px;
        }

        .left_sub_menu {
            position: fixed;
            top: 50px;
            width: 200px;
            z-index: 10;
            left: 45px;
            background: white;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 0px;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
            color: black;
        }

        .sub_menu {
            margin-top: 50px;
        }

        .left_sub_menu>.sub_menu li:hover {
            color: ff5858;
            background-color: #e1e1e1;
        }

        .left_sub_menu>.sub_menu li {
            color: #333;
            font-size: 17px;
            font-weight: 600;
            padding: 20px 0px 8px 14px;
            border-bottom: 1px solid #e1e1e1;
        }

        .sub_menu>h2 {
            padding-bottom: 4px;
            border-bottom: 3px solid #797979;
            margin-top: 30px;
            font-size: 21px;
            font-weight: 600;
            color: #333;
            margin-left: 10px;
            margin-right: 10px;
            font-family: 'NotoKrB';
            line-height: 35px;
        }

        .sub_menu .fas {
            color: #ff5858;
            font-size: 20px;
            line-height: 20px;
            float: right;
            margin-right: 20px;
        }

        .sub_menu>.big_menu>.small_menu li {
            color: #333;
            font-size: 14px;
            font-weight: 600;
            border-bottom: 0px solid #e1e1e1;
            margin-left: 14px;
            padding-top: 8px;
        }

        .big_menu {
            cursor: pointer;
        }

        ul {
            padding-inline-start: 0px;
        }

        a {
            color: #797979;
            text-decoration: none;
            background-color: transparent;
        }

        ul {
            list-style: none;
        }

        ol,
        ul {
            margin-top: 0;
            margin-bottom: 10px;
        }

        .has_sub {
            width: 100%;
        }

        .overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            /* background: rgba(0, 0, 0, 0.7); */
        }

        .hide_sidemenu {
            display: none;
        }
=======
<style>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
   body{
    background-color: #efefef;
   /* scrollbar-width: none;
    -ms-overflow-style: none; */
  
   }
   table {
    
	}
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
textarea {
<<<<<<< HEAD
	width: 360px;
	height: 300px;
=======
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
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
=======

>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
}

<<<<<<< HEAD
tr td a {
	width:
=======
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

   
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
}
<<<<<<< HEAD
=======
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

>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
</style>
</head>
<<<<<<< HEAD
<body>
<<<<<<< HEAD

	<div>
		<table>
			<tr>
				<td>싸이트명</td>
				<!-- ㄴㅇㅁㄴㅇ-->
				<td style="float: right"><input type="button" value="내정보 검색"
					onClick="location.href='myPage.jsp'"></td>
				<td style="float: right"><input type="button" value="검색"></td>
			</tr>
		</table>
=======
<<<<<<< HEAD
=======
<body>
<div >


>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
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
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
		<form action="reportPostServiceCon" method="post" enctype = "multipart/form-data">
<<<<<<< HEAD
<<<<<<< HEAD
			<table border="1px">
=======
			<table class="mtable2" style="padding:0 0 0 50px;">
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
=======
			<table class="mtable2">
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
				<tr>
					<td colspan="4"><input type="text" placeholder="제목을 입력하세요."
						name="title"></td>
				</tr>
				<tr>
					<td colspan="3">업로드 <input type="file" name="fileName">
					</td>
					<td><a href="inputAddress.jsp" target="_blank"><img
							src="Map.png" width="50" height="50"></a>
							
<%
	// 포스트 방식
     request.setCharacterEncoding("EUC-KR");
	 String title = request.getParameter("title");
	 String lat = request.getParameter("lat");
	 String lng = request.getParameter("lng");
	 String addr = request.getParameter("addr");

	 if(lat!=null){
	 System.out.println("(reportPostWrite.jsp페이지)latdd : " + lat);
	 System.out.println("(reportPostWrite.jsp페이지)lngdd :" + lng);
	 System.out.println("(reportPostWrite.jsp페이지)addrdd :" + addr);
	 } 
	 
 %>
			  <input type="hidden" name="lat" id="lat">
			  <input type="hidden" name="lng" id="lng">
			  <input type="hidden" name="addr" id="addr">
			   </td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="content"></textarea></td>
				</tr>
<<<<<<< HEAD
			</table>
			<table border='1px'>
=======
			</table >
			<br>
<<<<<<< HEAD
			<table align="center" style="padding:0 0 0 50px;">
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
=======
			<table align="center" >
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
				<tr>
					<td align="center"><input type="submit" value="제보하기 완료"></td>
				</tr>
			</table>
<<<<<<< HEAD
			<table>
				<tr>
					<td><input type="button" value="메인" name="main"
						onClick="location.href='Main.jsp'"></td>
					<td><input type="button" value="조회" name="inquiry"
						onClick="location.href='inquiryMain.jsp'"></td>
					<td><input type="button" value="후기" name="review"
						onClick="location.href='reviewMain.jsp'"></td>
					<td><input type="button" value="게시판" name="board"
						onClick="location.href='Board.jsp'"></td>
					<td><input type="button" value="제보" name="report"
						onClick="location.href='reportPostWrite.jsp'"></td>
				</tr>
				<tr>
					<td>메인</td>
					<td>조회</td>
					<td>후기</td>
					<td>게시판</td>
					<td>제보</td>
				</tr>
			</table>
=======
			<br><br><br><br>			
		</form>
<<<<<<< HEAD
	</div>
=======
		<div class="down">
			<div class="dbutton1">메인</div>
			<div class="dbutton2">조회</div>
			<div class="dbutton3">후기</div>
			<div class="dbutton4">게시판</div>
			<div class="dbutton5">제보</div>
			</div>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
	<script>
	<%if(lat!=null){%>
		document.getElementById('lat').value = "<%=lat%>";
		document.getElementById('lng').value = "<%=lng%>";
		document.getElementById('addr').value = "<%=addr%>";
	<%}%>
	</script>
</body>
</html>