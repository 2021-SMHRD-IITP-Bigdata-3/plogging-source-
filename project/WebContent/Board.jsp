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
<style>
table{
    width: 360px;
    border: 1px solid #444444;
         }
   tr , td{
    border: 1px solid #444444;
    padding: 5px;
   }

</style>
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");

boardDAO dao = new boardDAO();
ArrayList<boardDTO> board_list = dao.showBoard();
%>
   <div style='height:200px;'>
   <!-- ����Ʈ �̸� -->
      <table>
      <tr>
            <td>����Ʈ��</td>
            <td style = "float : right"><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
         <td style = "float : right"><input type ="button" value = "�˻�"></td>
      </tr>
      </table>
   </div>
   <div>
            ���� �Խ���<input type="button" value="�۾���" style='float: relative;' onClick="location.href='BoardWrite9.jsp'"><br><br>
      
      <table border='1px' style='height:100px;'>
      <tr>
                  <td>��ȣ</td>
                  <td>����</td>
                  <td>�ۼ���</td>
                  <td>����</td>
                  <td>�ۼ�����</td>
               </tr>
         <% for(int i = 0; i<board_list.size();i++){ %>
      <tr>
         <td><%=i+1 %></td>
             <td><a href="viewBoard.jsp?board_num=<%=board_list.get(i).getBoardNum()%>"><%=board_list.get(i).getBoardTitle()%></a></td>
             <td><%=board_list.get(i).getMemberId() %>
             <td><%=board_list.get(i).getBoardImage() %></td>
             <td><%=board_list.get(i).getBoardDate() %></td>
         </tr>
         <%} %>
      </table>
   </div>
   <br><br><br>
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