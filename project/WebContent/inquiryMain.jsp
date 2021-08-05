<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
    width: 360px;
    border: 1px solid #444444;
	}
	tr , td{
    border: 1px solid #444444;
    padding: 10px;
	}
	textarea {
    width: 200px;
    height: 25px;
    }
</style>
</head>
<body>
<%
	memberDTO info = (memberDTO)session.getAttribute("info");
	ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
	notice_BoardDAO dao = new notice_BoardDAO();
	array = dao.showBoard(info.getMemberId());
%>
<table>
<tr>
	<td>싸이트명</td>
	<td style = "float : right"><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
	<td style = "float : right"><input type ="button" value = "검색"></td>
</tr>
</table>
<br><br><br><br><br>
<table>
	<form action="chatTest.jsp" method ="post">
       <div class="searchbox">
           <div class="header">
             <div>Search</div>
             <input onkeyup="filter()" type="text" id="value" placeholder="간략한 주소지를 입력해주세요">
           </div>
           <div class="container">
           	<%for(int i=0; i<array.size(); i++){ %>
           	<%if(info != null){%>
				<div class = "item"><span style="color: green;"><br>
				<span><%=array.get(i).getNoticeImage()%></span><br>
				<span class = "name">주소지 :<%=array.get(i).getAddr() %></span><br>
				<span>플로깅 기한 :<%=array.get(i).getPlogDate()%></span><br>
				<span><input type= "hidden" name = "noticeNumber" value = "<%=array.get(i).getNoticeNumber()%>"></span>
				<span>플로깅 제한 인원  :<%=array.get(i).getLimitedNumber() %></span><br>
				<span><%=array.get(i).getNoticeNumber()%>번 공고방</span>
				<span><input type = "submit" value = "들어가시겠습니까?"></span></div>
			  </div>
			  <%}else{%>
			   	<div>회원님께서는 이 공고를 신청할 수 없습니다!</div> 
			  </div>
			  	<%} %>
			  <%}%>	
           </div>
         </div>
</form>
</table>
<br><br>
<!-- <table>
	<tr>
		<td><input type = "button" value = "<<"></td>
		<td><input type = "button" value = "1"></td>
		<td><input type = "button" value = "2"></td>
		<td><input type = "button" value = "3"></td>
		<td><input type = "button" value = "4"></td>
		<td><input type = "button" value = "5"></td>
		<td><input type = "button" value = ">>"></td>
		<!-- 인원수 -->
	</tr>
</table> -->
<br><br><br><br>
<table>
<tr>
	<td><input type="button" value="메인" name="main" onClick="location.href='Main.jsp'"></td>
	<td><input type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
	<td><input type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'"></td>
	<td><input type="button" value="게시판" name="board" onClick="location.href='Board.jsp'"></td>
	<td><input type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
</tr>
<tr>
	<td>메인</td>
	<td>조회</td>
	<td>후기</td>
	<td>게시판</td>
	<td>제보</td>
</tr>
</table>
<!-- 자바스크립트 잠시 지움 -->
</body>
</html>