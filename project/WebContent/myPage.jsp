<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.memberDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table{
   width:360px
}
div{
   width:360px
}
</style>
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");

boardDAO dao = new boardDAO();

ArrayList<boardDTO> board_list = dao.showBoard();

reviewBoardDAO dao1 = new reviewBoardDAO();

ArrayList<boardDTO> reviewBoard_list = dao.showBoard();



%>
   <div style='height:50px;'>
   <!-- ����Ʈ �̸� -->
      <table >
      <tr>
            <td>����Ʈ��</td>
            <td style = "float : right"><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
            <td style = "float : right"><input type ="button" value = "�˻�"></td>
      </tr>
      </table>
   </div>
   <div style='height:100px;'>
      <table>
      <tr>
         <td>���� ������</td>
      </tr>
      </table>
   </div>
   <div style='height:100px;'>
      <table>
      <tr>
         <td>����</td>
      </tr>
      </table>
   </div>
   <div>
      <table border='1px' style='height:50px;'>
      <tr>
         <td>���� �÷α���  Ƚ��</td>
         <td><%if(info !=null){%><span><%=info.getMemberPlogCount() %>�� �����ϼ̽��ϴ�.</span><%}else{ %><span>0ȸ �����ϼ̽��ϴ�.</span><%} %></td>
         <!-- �ߴ� �÷α� Ƚ�� -->
      </tr>
      </table>
   </div>
   <br><br>
   <div >
      <table border='1px'>
      <th align="left" style='height:30px;' colspan="2">���� �� ��</th>
      
      <% for(int i = 0; i<reviewBoard_list.size();i++){ %>
      <tr>
            <td>- <span><%=reviewBoard_list.get(i).getBoardTitle()%></span><input type="button" value="���� �� �ı� �Խñ� ��������" onclick="location.href='reviewMain.jsp'"></td>
      </tr>
      <%} %>
      <% for(int i = 0; i<board_list.size();i++){ %>
      <tr>
            <td>-<span><%=board_list.get(i).getBoardTitle()%></span><input type="button" value="���� �� �ı� �Խñ� ��������" onclick="location.href='reviewMain.jsp'"></td>
      </tr>
      <%} %>
      </table>
   </div>   
   <div style='height:100px;'>
      <table>
         <input  type="button" value="ȸ����������" onclick="location.href='update.jsp'">
      </table>
   </div>
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
</body>
</html>