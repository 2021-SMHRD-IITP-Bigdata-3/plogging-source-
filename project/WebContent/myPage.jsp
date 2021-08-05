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
   <!-- 사이트 이름 -->
      <table >
      <tr>
            <td>싸이트명</td>
            <td style = "float : right"><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
            <td style = "float : right"><input type ="button" value = "검색"></td>
      </tr>
      </table>
   </div>
   <div style='height:100px;'>
      <table>
      <tr>
         <td>메인 디자인</td>
      </tr>
      </table>
   </div>
   <div style='height:100px;'>
      <table>
      <tr>
         <td>지도</td>
      </tr>
      </table>
   </div>
   <div>
      <table border='1px' style='height:50px;'>
      <tr>
         <td>내가 플로깅한  횟수</td>
         <td><%if(info !=null){%><span><%=info.getMemberPlogCount() %>번 참여하셨습니다.</span><%}else{ %><span>0회 참여하셨습니다.</span><%} %></td>
         <!-- 했던 플로깅 횟수 -->
      </tr>
      </table>
   </div>
   <br><br>
   <div >
      <table border='1px'>
      <th align="left" style='height:30px;' colspan="2">내가 쓴 글</th>
      
      <% for(int i = 0; i<reviewBoard_list.size();i++){ %>
      <tr>
            <td>- <span><%=reviewBoard_list.get(i).getBoardTitle()%></span><input type="button" value="내가 쓴 후기 게시글 보러가기" onclick="location.href='reviewMain.jsp'"></td>
      </tr>
      <%} %>
      <% for(int i = 0; i<board_list.size();i++){ %>
      <tr>
            <td>-<span><%=board_list.get(i).getBoardTitle()%></span><input type="button" value="내가 쓴 후기 게시글 보러가기" onclick="location.href='reviewMain.jsp'"></td>
      </tr>
      <%} %>
      </table>
   </div>   
   <div style='height:100px;'>
      <table>
         <input  type="button" value="회원정보수정" onclick="location.href='update.jsp'">
      </table>
   </div>
   <table>
      <tr>
   <td><input type="button" value="메인" name="main" onClick="location.href='Main.jsp'"></td>
   <td><input type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
   <td><input type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'"></td>
   <td><input type="button" value="게시판" name="board" onClick="location.href='Board.jsp'"></td>
   <td><input type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
      </tr>
      <tr>
         <td>메인</td>
         <td>조회</td>
         <td>후기</td>
         <td>게시판</td>
         <td>제보</td>
      </tr>
   </table>
</body>
</html>