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
	<td>����Ʈ��</td>
	<td style = "float : right"><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
	<td style = "float : right"><input type ="button" value = "�˻�"></td>
</tr>
</table>
<br><br><br><br><br>
<table>
	<form action="chatTest.jsp" method ="post">
       <div class="searchbox">
           <div class="header">
             <div>Search</div>
             <input onkeyup="filter()" type="text" id="value" placeholder="������ �ּ����� �Է����ּ���">
           </div>
           <div class="container">
           	<%for(int i=0; i<array.size(); i++){ %>
           	<%if(info != null){%>
				<div class = "item"><span style="color: green;"><br>
				<span><%=array.get(i).getNoticeImage()%></span><br>
				<span class = "name">�ּ��� :<%=array.get(i).getAddr() %></span><br>
				<span>�÷α� ���� :<%=array.get(i).getPlogDate()%></span><br>
				<span><input type= "hidden" name = "noticeNumber" value = "<%=array.get(i).getNoticeNumber()%>"></span>
				<span>�÷α� ���� �ο�  :<%=array.get(i).getLimitedNumber() %></span><br>
				<span><%=array.get(i).getNoticeNumber()%>�� �����</span>
				<span><input type = "submit" value = "���ðڽ��ϱ�?"></span></div>
			  </div>
			  <%}else{%>
			   	<div>ȸ���Բ����� �� ���� ��û�� �� �����ϴ�!</div> 
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
		<!-- �ο��� -->
	</tr>
</table> -->
<br><br><br><br>
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
<!-- �ڹٽ�ũ��Ʈ ��� ���� -->
</body>
</html>