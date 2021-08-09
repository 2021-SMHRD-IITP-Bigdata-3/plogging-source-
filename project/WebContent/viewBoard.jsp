<%@page import="Model.boardReDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.boardReDAO"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>Forty by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="assetsBoard/css/main.css" />
      <link rel="stylesheet" href="assetsBoard/css/board.css" />
      <link rel="stylesheet" href="css/ViewBoard.css?after">
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

<%
	memberDTO info = (memberDTO)session.getAttribute("info");
	System.out.println("info�� id Ȯ�� : " + info.getMemberId());
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));	
	System.out.println("Board���� viewBoard�� board_num�� �� �Ѿ�Դ��� Ȯ�� : "+ boardNum);
	
	boardDAO dao = new boardDAO();

	// �Խù�ȣ�� �´� �Խñ� �������� ��� �޼ҵ�
	boardDTO dto = dao.showOne(boardNum);
	System.out.println("dto�� �Խù�ȣ Ȯ�� : " + dto.getBoardNum());
	System.out.println("dto�� �Խû��id Ȯ�� : " + dto.getMemberId());
	System.out.println("dto�� �Խó�¥ Ȯ�� : " + dto.getBoardDate());
	System.out.println("dto�� �Խó��� Ȯ�� : " + dto.getBoardContent());
	System.out.println("dto�� �Խ����� Ȯ�� : " + dto.getBoardTitle());
	System.out.println("dto�� �Խ��̹��� Ȯ�� : " + dto.getBoardImage());
    
	boardReDAO dao1= new boardReDAO();
	ArrayList<boardReDTO> boardRe_list= dao1.boardRe_li(boardNum);

%>
	<div class = "board">    				<!-- Ȯ�ο� -->
    	<table class="btable" border="1px">
        	<tr class="title">
            	<td>����</td>
				<td><%= dto.getBoardTitle()%></td>
			</tr>
            <tr>
                <td>�ۼ���</td>
                <td><%= dto.getMemberId() %></td>                  
            </tr>
            <tr>
				<td colspan="2">����</td>
            </tr>
            <tr>
            	<td colspan="2">
            		<% if(dto.getBoardImage()!=null) {%>
                		<img src="img/<%=dto.getBoardImage()%>">
                    <% } %>
                    <% if(dto.getBoardContent()!=null) {%>
                        <h1><%= dto.getBoardContent() %></h1>
                    <% } %>
                </td>
            </tr>
            <!-- ���� ��ư ��� �ְ� ������ �����ؼ� �ű�� �� . �켱 ��� Ȯ���� ���� ���� ������ �Űܵ� -->
            <tr>
				<%if(info!=null){ %>
    				<%if(info.getMemberId().equals(dto.getMemberId())) {%> 
						<td colspan="2"><a href="DeleteOneServiceCon?num=<%=dto.getBoardNum()%>">���� </a></td>
                	<%}else{%>
                		<td colspan="2">������ �� �����ϴ�.</td>
                	<%} %>
                <%} %>
			</tr>
            <tr>
            	<td colspan="2"><a href="Board.jsp"><button>�ڷΰ���</button></a></td>
            </tr>
    	</table>
	</div>
	<div> 					   <!-- Ȯ�ο� -->
		<table id = "reboard" border="1px">
		 		<th>
		 			<td>���</td>
		 		</th>
			<% for(int i = 0; i<boardRe_list.size();i++){ %>
	    	    <tr>
					<td><%=boardRe_list.get(i).getMemberID()%>-><%=boardRe_list.get(i).getCommentsContents()%></td>
		    	</tr>
			<%} %>
	    </table>
    </div>
<br><br><br>
	<form action="ReBoardServiceCon" method="post">
		<input type="hidden" value="<%=boardNum%>" name="boardNum">
    	<table>
        	<th>
        		<td colspan="4">���</td>
        	</th>
			<tr>
         		<td width="100">�̸�</td>
		        <td>
	        	 	<%if(info!=null){ %>
	         			<span><%=info.getMemberId() %></span>
	        	 	<%}else{ %>
	         			<input type="text" name="name">
	         		<% } %>
         		</td>
				<td width="100">��й�ȣ</td>
				<td width="150"><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>����</td>
				<td colspan="3">
					<textarea cols="60" name="content"></textarea>
				</td>
         	</tr>
         	<tr>
         		<td colspan="4">
					<input type="submit" value="����" name="cmd">
					<input type="reset" value="�ٽþ���">
				</td>
			</tr>
		</table>
	</form>
<table>
<div id="class="down""></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>

</table>	
<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>