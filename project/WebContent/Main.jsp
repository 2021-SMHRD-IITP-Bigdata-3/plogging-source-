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
    width: 100%;
    border: 1px solid #444444;
         }
    tr , td{
    border: 1px solid #444444;
	padding: 10px;
	}
	body{
	margin: 0px;
	padding: 0px; 
	}
	
	
	#wrapper{
	border: 1px solid #FFBB00;
	
	position: absolute;
	top: 10px;
	left: 50%;
	margin-left: -538px;
	width : 100%
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
<table>\
<tr>
   <td>����Ʈ��</td>
   <td ><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
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
   <td><input style = "float : right" type ="button" value = "ȸ������" onClick="location.href='Join.jsp'"></td>
      <% } %>

</tr>
</table>
<br><br>
<table>
<tr><td><a href="https://terms.naver.com/entry.naver?docId=5138665&cid=43667&categoryId=43667">�÷α�</a></td></tr>
</table>
<br>
<table>
<tr>
<td><iframe width="600" height="300" src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</td>
</tr>
</table>
<br>
<table>
<th>������� �� Į��</th>
<tr>
<td><a href="https://www.news1.kr/articles/?4391799">LG��κ���, #�������ƻ�å ķ���� ���ࡦ"�÷α� �Բ��ؿ�"</a></td>
</tr>
<tr>
<td><a href="https://www.etoday.co.kr/news/view/2050450">GS�Ŀ�, ���� '�÷α�' ķ���� ����</a></td>
</tr>
<tr>
<td><a href="http://www.kbsm.net/default/index_view_page.php?idx=319697&part_idx=320">��õ�� ����, �����ü�� ȯ����ȭ �÷α� Ȱ��</a></td>
</tr>
</table>
<br>
<table>
<th>�÷α� �����ڵ��� ��α� & ī��</th>
<tr>
<td><a href="https://blog.naver.com/happyhouse2u/222359846153">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı� (���� ���� A-7 & ���� û�� �ູ����)</a></td>
</tr>
<tr>
<td><a href="https://post.naver.com/viewer/postView.naver?volumeNo=31743685&memberNo=25324157&vType=VERTICAL">���� � Ʈ����� '�÷α�'?, '�÷�ŷ'? �ǰ��� ȯ�� ��� ��Ű��!</a></td>
</tr>
<tr>
<td><a href="https://blog.naver.com/sku-cast/222439716410">�÷α����� ���������� ���� ���������?</a></td>
</tr>
<tr>
<td><a href="https://blog.naver.com/baekjeun/222452172788">���� �������� �ϴ� ���� ���� �̻��� ��õ�ϴ� ����� ������</a></td>
</tr>

</table>
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