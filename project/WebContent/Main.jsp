<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>\
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
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="Main.css?after">
</head>
<body>
<%
   memberDTO info = (memberDTO)session.getAttribute("info");   
   if (info!=null){
	  double memberLat = info.getMemberLat();
	  double memberLng = info.getMemberLng();
      System.out.println("(������������ ������� ������ �� �Ѿ������) memberLat : "+ memberLat);
      System.out.println("(������������ ������� �浵�� �� �Ѿ������) memberLng : "+ memberLng);
   }


%>

<td ><input type ="button" value = "ä�ø��" onClick="location.href='chatChoice.jsp'"></td>
<table>
	<tr>
	   <td id ="title" style = "width:124px;">plogging</td>
	      <% if(info != null) { %>
	   <td><input  type ="button" value = "�α׾ƿ�" onClick="location.href='logoutServiceCon'"></td>
	   <td><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
	      <% }else { %>
	   <td > <a id = "login" onClick="location.href='Login.jsp'" >�α���</a> </td>
      <% } %>
	   
	</tr>
</table>
<br>
<table>
<tr>
<td><iframe src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</td>
</tr>
</table>
<br>
<ul>
	<div id ="cafe" style ="padding: 15px 1px 5px 58px width:1012px margin-left:-50px"><th>�÷α��̶�?</th></div>
	<li id = "ae"><a href="https://blog.naver.com/happyhouse2u/222359846153">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı�</a></li>
	<li id = "ae"><a href="https://post.naver.com/viewer/postView.naver?volumeNo=31743685&memberNo=25324157&vType=VERTICAL">���� � Ʈ����� '�÷α�' �ǰ��� ȯ�� ��� ��Ű��!</a></li>
	<li id = "ae"><a href="https://blog.naver.com/sku-cast/222439716410">�÷α����� ���������� ���� ���������?</a></li>
	<li id = "ae"><a href="https://blog.naver.com/baekjeun/222452172788">���� �������� �ϴ� ���� ���� �̻��� ��õ�ϴ� ����� ������</a></li>
</ul>
<table>
<div id="class="down""></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>

</table>
</body>
</html>