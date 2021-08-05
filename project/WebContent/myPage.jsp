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
body {
   background-color: #efefef;
   scrollbar-width: none;
   -ms-overflow-style: none;
}

table {

}
.mtable1{
   width: 100%;
	padding: 100px;
        }
   .mtable2{
   width: 700px;
   border : 1px solid black;
  border-collapse : collapse;
  
         }
tr, td {
   /* padding: 5px; */
   
}

.topicon {
   background-color: #2DB400;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 15px;
}
h1{
   padding: 70px;
   }

a {
   width: 330px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

div {
   /* padding: 10px */
   margin-left: auto;
   margin-right: auto;
}

.tex {
   width: 330px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.stex1 {
   width: 270px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.stex2 {
   width: 220px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.button {
   background-color: #2DB400;
   width: 330px;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 12px;
}

.dbutton {
   background-color: #2DB400;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 12px;
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
   <div>
      <table class="mtable1">
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="text-align:right;">
            <input  type="button" class="topicon" value="회원정보수정"
            onclick="location.href='update.jsp'">
            <input type="button" class="topicon" value="검색">
            <input type="button" class="topicon" value="내정보"
               onClick="location.href='myPage.jsp'"></td>
         </tr>
      </table>
   </div>
   <table align="center">
      <tr>
         <td><h3 align="center"><%=info.getMemberId() %>의 마이페이지</h3></td>
      </tr>
      </table>
      <br><br>
   <div>
      <table style='height:50px;' align="center">
      <tr>
         <td><%if(info !=null){%><span><%=info.getMemberPlogCount() %>번 플로깅에 참여하셨습니다!</span><%}else{ %><span>0회 참여하셨습니다.</span><%} %></td>
         <!-- 했던 플로깅 횟수 -->
      </tr>
      </table>
   </div>
   <br><br><br>
   <div >
      <table align="center" border="1px" class="mtable2">
      <th align="left" style='height:30px;' colspan="2">게시글</th>
      
      <% for(int i = 0; i<reviewBoard_list.size();i++){ %>
      <tr>
            <td>- <span onclick="location.href='reviewMain.jsp'"><%=reviewBoard_list.get(i).getBoardTitle()%></span></td>
      </tr>
      <%} %>
      <% for(int i = 0; i<board_list.size();i++){ %>
      <tr>
            <td>-<span onclick="location.href='reviewMain.jsp'"><%=board_list.get(i).getBoardTitle()%></span></td>
      </tr>
      <%} %>
      </table>
   </div>   
   <br><br><br><br>
   <br>

   <div>
      <table align="center">
         <tr>
            <td><input type="button" class="dbutton" value="메인" name="main"
               onClick="location.href='Main.jsp'"></td>
            <td><input type="button" class="dbutton" value="조회" name="inquiry"
               onClick="location.href='inquiryMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="후기" name="review"
               onClick="location.href='reviewMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="게시판" name="board"
               onClick="location.href='Board.jsp'"></td>
            <td><input type="button" class="dbutton" value="제보" name="report"
               onClick="location.href='reportPostWrite.jsp'"></td>
         </tr>
      </table>
   </div>
</body>
</html>