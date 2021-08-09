<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.memberDTO"%>
    <%@page import="Model.reviewBoardDAO"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reviewWrite7.css?after">
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String lat = request.getParameter("lat");
	String lng = request.getParameter("lng");
	memberDTO info = (memberDTO)session.getAttribute("info");
	String get_memberId = info.getMemberId();
	int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
	
	
	System.out.println(lat);
	System.out.println(lng);
	System.out.println(get_memberId);
	System.out.println(noticeNumber);
	
	reviewBoardDAO dao = new reviewBoardDAO();
%>

<div>
	<table style ="width:100%">
	   <td id ="title" style = "width:124px;">plogging</td>
	      <% if(info != null) { %>
	   <td><i class="far fa-user"  type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
	      <% }else { %>
      <% } %>
	</table>
	<form action = "reviewWriteServiceCon" method = "post" enctype = "multipart/form-data">
		<table border = "1px" >
			<tr>
				<td colspan = "4">
					<input type = "text" placeholder = "제목을 입력하세요." name ="title" >
				</td>
			</tr>
			<tr>
				<td colspan = "3">
					업로드 <input type = "file" name ="image">
				</td>
			</tr>
			<tr>
				<td colspan = "4">
					<textarea name ="content"  style="resize: none;"></textarea>	
					<input type = "hidden" name ="lat" value ="<%=lat%>">
					<input type = "hidden" name ="lng" value ="<%=lng%>">
					<input type = "hidden" name ="noticeNumber" value ="<%=noticeNumber%>">
				</td>
			</tr>
			<tr>
				<td colspan = "4">
					<input type = "text" name ="run">
				</td>
			</tr>
			<tr>
				<td colspan = "5">
					  얼마나 많은 쓰레기를 주우셨나요?(종량제 봉투 기준)<br><br>
					  <input type = "radio" name = "Trash" value = "5L">5L
					  <input type = "radio" name = "Trash" value = "10L">10L
					  <input type = "radio" name = "Trash" value = "15L">15L
					  <input type = "radio" name = "Trash" value = "20L">20L  
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="작성완료"></td>
			</tr>
		</table>
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
	</form>
</div>
</body>
</html>