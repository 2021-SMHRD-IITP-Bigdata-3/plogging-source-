<%@page import="Model.memberDTO"%>
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
   textarea {
      width: 320px;
      height: 300px;
    }   

</style>
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");
 %>
<div>
   <table>
   <tr>
      <td>����Ʈ��</td>
      <td style = "float : right"><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
      <td style = "float : right"><input type ="button" value = "�˻�"></td>
   </tr>
   </table>
   <form action = "BoardServiceCon" method = "post" >
      <table border = "1px" >
         <tr>
            <td colspan = "8">
               ����<input type = "text" placeholder = "������ �Է��ϼ���." name="title" >
            </td>
         </tr>
         <tr>
         <td><span name="memberId">�ۼ��� : <%if(info!=null){%><%=info.getMemberId() %><%}else{ %>a<%} %></span></td>
         </tr>
         <tr>
            <td colspan = "4">���ε� <input type = "file" name = "fileName"></td>
         </tr>
         <tr>
            <td colspan = "4">
               <textarea rows="5" cols="50" name="textarea"></textarea>   
            </td>
         </tr>
         <tr>
            <td colspan = "4" align = "center" >
                <input type = "submit" value = "�۾��� �Ϸ�">
            </td>
         </tr>
      </table>
      </form>
      
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
   
</div>

</body>
</html>