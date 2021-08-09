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
	   <td><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
	      <% }else { %>
      <% } %>
	</table>
	<form action = "reviewWriteServiceCon" method = "post" enctype = "multipart/form-data">
		<table border = "1px" >
			<tr>
				<td colspan = "4">
					<input type = "text" placeholder = "������ �Է��ϼ���." name ="title" >
				</td>
			</tr>
			<tr>
				<td colspan = "3">
					���ε� <input type = "file" name ="image">
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
					  �󸶳� ���� �����⸦ �ֿ�̳���?(������ ���� ����)<br><br>
					  <input type = "radio" name = "Trash" value = "5L">5L
					  <input type = "radio" name = "Trash" value = "10L">10L
					  <input type = "radio" name = "Trash" value = "15L">15L
					  <input type = "radio" name = "Trash" value = "20L">20L  
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="�ۼ��Ϸ�"></td>
			</tr>
		</table>
		<table>
		<tr>
	<td><input type="button" value="����" name="main" onClick="location.href='Main.jsp'"></td>
	<td><input type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
	<td><input type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"></td>
	<td><input type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'"></td>
	<td><input type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
		</tr>
		<tr>
		   <td>����</td>
		   <td>��ȸ</td>
		   <td>�ı�</td>
		   <td>�Խ���</td>
		   <td>����</td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>