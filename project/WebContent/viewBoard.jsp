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
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

<%
memberDTO info = (memberDTO)session.getAttribute("info");
int num = Integer.parseInt(request.getParameter("board_num"));

System.out.println(num);

   boardDAO dao = new boardDAO();
   boardDTO dto = dao.showOne(num);
   boardReDAO dao1= new boardReDAO();
   ArrayList<boardReDTO> boardRe_list= dao1.boardRe_li();
%>
   
         <div id = "board">
            <table id="list">
               <tr>
                  <td>제목</td>
                  <td><%= dto.getBoardTitle()%></td>
               </tr>
               <tr>
                  <td>작성자</td>
                  <td><%= dto.getMemberId() %></td>                  
               </tr>
                        
               <tr>
                  <td colspan="2">내용</td>
                  <td><%=dto.getBoardContent() %></td>
               </tr>
               <tr>
                  <td colspan="2">
                     <% if(dto.getBoardImage() != null) {%>
                        <img src = "img/<%= dto.getBoardImage() %>">
                     <% } %>
                     <% if(dto.getBoardContent() != null) {%>
                        <h1><%= dto.getBoardContent() %></h1>
                     <% } %>
                  </td>
                  <%if(info!=null){ %>
                  <%if(info.getMemberId().equals(dto.getMemberId())) {%> 
             <td> <a href = "DeleteOneServiceCon?num=<%=dto.getBoardNum() %>">삭제 </a></td>
                <%}} %>
               </tr>
               <tr>
                  <td colspan="2"><a href="Board.jsp"><button>뒤로가기</button></a></td>
               </tr>
            </table>
         </div>
         
         <table>
         <th>댓글</th>
         <% for(int i = 0; i<boardRe_list.size();i++){ %>
         	<tr>
         		<td><%=boardRe_list.get(i).getMemberID()%>->
         		 <%=boardRe_list.get(i).getCommentsContents()%></td></tr>
    		 <%} %>
         </table>
         <br>
         
         <form action="ReBoardServiceCon" method="post">
         <table>
         <tr><th colspan="4">댓글</th></tr>
         <tr>
         <td width="100">이름</td>
         <td><%if(info!=null){ %>
         <span><%=info.getMemberId() %></span>
         <%}else{ %>
         <input type="text" name="name">
         <%} %>
         </td>
         <td width="100">비밀번호</td>
         <td width="150"><input type="password" name="password"></td>
         </tr>
         <tr>
         <td>내용</td>
         <td colspan="3"><textarea cols="60" name="content"></textarea></td>
         <input type = "hidden" value = "<%=num%>" name = "number">
         </tr>
         <tr>
         <td colspan="4">
         <input type="submit" value="저장" name="cmd">
         <input type="reset" value="다시쓰기">
         </tr>
         </table>
         </form>
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