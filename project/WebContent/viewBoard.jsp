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


boardDTO board_list = (boardDTO) session.getAttribute("board_list");

int num = Integer.parseInt(request.getParameter("board_num"));

   boardDAO dao = new boardDAO();
   boardDTO dto = dao.showOne(num);


   System.out.println(dto.getBoardNum());


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
               </tr>
               <tr>
                  <td colspan="2"><a href="Board.jsp"><button>뒤로가기</button></a></td>
               </tr>
            </table>
         </div>
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