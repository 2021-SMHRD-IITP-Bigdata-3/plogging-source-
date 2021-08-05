<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.boardDTO"%>
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
    padding: 10px;
   }body{
margin: 0px;
padding: 0px; 
} 


#wrapper{
border: 1px solid #FFBB00;

position: absolute;
top: 10px;
left: 50%;
margin-left: -538px;
}

#contents{
border: 1px solid #487BE1;
float: left;
padding: 10px;
}

#sidebar{
border: 1px solid #487BE1;
width:20px;
float: left;
padding: 10px;
margin-left: 200px;
}
	
</style>
</head>
<body>
<%
   memberDTO info = (memberDTO)session.getAttribute("info");   
   ArrayList<notice_BoardDTO> n_list = new ArrayList<notice_BoardDTO>();
   if (info!=null){
	  double memberLat = info.getMemberLat();
	  double memberLng = info.getMemberLng();
      System.out.println("(������������ ������� ������ �� �Ѿ������) memberLat : "+ memberLat);
      System.out.println("(������������ ������� �浵�� �� �Ѿ������) memberLng : "+ memberLng);
      notice_BoardDAO n_dao = new notice_BoardDAO();
      // �켱 ���ֿ��� ���� 57, �س� 69 ������ - ������ ���� ����ؼ� ��������~ => �ٽ� �켱�� 
      n_list = n_dao.match(memberLat, memberLng, 1000);
         for(int i = 0; i<n_list.size(); i++) {
            System.out.println(n_list.get(i).getNoticeNumber());
            System.out.println(n_list.get(i).getAddr());
         }
   }

%>
<div id="wrapper">
  <div id="contents">
  <td ><input type ="button" value = "ä�ø��" onClick="location.href='chatChoice.jsp'"></td>
<table >
<tr>
   <td>����Ʈ��</td>
   <td ><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
   <td style = "float : right"><input type ="button" value = "�˻�"></td>
</tr>
<tr>
   <% if(info != null) { %>
   <td><%=info.getMemberId() %>��</td>
      <% }else { %>
   <td> �α������ּ��� </td>
      <% } %>
   <% if(info != null) { %>
   <td><input  type ="button" value = "�α׾ƿ�" onClick="location.href='logoutServiceCon'"></td>
      <% }else { %>
   <td> <input  type ="button" value = "�α���" onClick="location.href='Login.jsp'"> </td>
      <% } %>
   <td><input type ="button" value = "ȸ������" onClick="location.href='Join.jsp'"></td>
</tr>
</table>

<br><br><br><br><br>

<!-- ������ ���� ���̺� ���� -->

<br><br><br><br>
<table>
<div id="sidebar">
   <input type="button" value="����" name="main" onClick="location.href='Main.jsp'"><br>
   <input type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"><br>
   <input type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"><br>
   <input type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'"><br>
   <input type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"><br>
</div>
  </div>

</div>
</table>
</body>
</html>