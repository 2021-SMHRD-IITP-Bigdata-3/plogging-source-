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
   <!-- 사이트 이름 -->
      <table>
      <tr>
            <td>싸이트명</td>
            <td style = "float : right"><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
         <td style = "float : right"><input type ="button" value = "검색"></td>
      </tr>
      </table>
   </div>
   <div>
            자유 게시판<input type="button" value="글쓰기" style='float: relative;' onClick="location.href='BoardWrite9.jsp'"><br><br>
      
      <table border='1px' style='height:100px;'>
      <tr>
                  <td>번호</td>
                  <td>제목</td>
                  <td>작성자</td>
                  <td>사진</td>
                  <td>작성일자</td>
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