<%@page import="Model.memberDTO"%>
<%@page import="Model.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'netmarbleB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<link rel = "stylesheet" href="css/Board.css?after">
</head>
<body  style = "background-color: #ffffff">


<%
	
	memberDTO info = (memberDTO)session.getAttribute("info");	

	boardDAO dao = new boardDAO();
	// ��� �Խñ��� �ֽż����� ���� �޼ҵ�
	ArrayList<boardDTO> board_list = dao.board_li();
	
%>
	<div class="header">
      <table>
         <tr>
            <td><h2>Plogging</h2></td>
            <td align="right">
            <input  type="button" class="topicon" value="ȸ����������"
            onclick="location.href='update.jsp'"></td>
            <td align="center"><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
         </tr>
      </table>
  	</div>
  	<div align="right">
  	<input type="button" value="�۾���"  onClick="location.href='BoardWrite9.jsp'" class="topicon">
	</div>
	<div><h2>���� �Խ���</h2>
		
		<table border='1px' style='height:100px;' align="center">
			<tr align="center" style="font-size:25px;">
				<td>��ȣ</td>
				<!-- �Խù�ȣ�� �� �Ѿ���� Ȯ�� �� ���� .���߿� ����� -->
				
				<td>����</td>
				<td>�ۼ���</td>
				<td>����</td>
				<td>�ۼ�����</td>
			</tr>
		<% for(int i = 0; i<board_list.size();i++){ %>
      		<tr align="center" style="font-size:25px;">
         		<td><%=i+1 %></td>
          		<td ><a style="font-size:25px;" href="viewBoard.jsp?boardNum=<%=board_list.get(i).getBoardNum()%>"><%=board_list.get(i).getBoardTitle()%></a></td>
				<td><%=board_list.get(i).getMemberId() %></td>
				<td><%=board_list.get(i).getBoardImage() %></td>
				<td><%=board_list.get(i).getBoardDate() %></td>
			</tr>
		<% } %>
		</table>
	</div>
<br><br><br>
	<table>
	<tr>
	
    	<div id="class="down""></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>

		</tr>
	</table>
</body>
</html>