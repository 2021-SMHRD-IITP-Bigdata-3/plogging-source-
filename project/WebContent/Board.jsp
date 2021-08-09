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
<link rel = "stylesheet" href="css/Board.css?after">
</head>
<body  style = "background-color: #dadbdb">


<%
	
	memberDTO info = (memberDTO)session.getAttribute("info");	

	boardDAO dao = new boardDAO();
	// 모든 게시글을 최신순으로 담은 메소드
	ArrayList<boardDTO> board_list = dao.board_li();
	
%>
	<div class="header">
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
  	<div align="right">
  	<input type="button" value="글쓰기"  onClick="location.href='BoardWrite9.jsp'" class="topicon">
	</div>
	<div>자유 게시판
		
		<table border='1px' style='height:100px;' class="table">
			<tr>
				<td>번호</td>
				<!-- 게시번호가 잘 넘어가는지 확인 차 넣음 .나중에 지우기 -->
				
				<td>제목</td>
				<td>작성자</td>
				<td>사진</td>
				<td>작성일자</td>
			</tr>
		<% for(int i = 0; i<board_list.size();i++){ %>
      		<tr>
         		<td><%=i+1 %></td>
          		<td><a href="viewBoard.jsp?boardNum=<%=board_list.get(i).getBoardNum()%>"><%=board_list.get(i).getBoardTitle()%></a></td>
				<td><%=board_list.get(i).getMemberId() %></td>
				<td><%=board_list.get(i).getBoardImage() %></td>
				<td><%=board_list.get(i).getBoardDate() %></td>
			</tr>
		<% } %>
		</table>
	</div>
<br><br><br>
	<table>
    	<div id="class="down""></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>

		</tr>
	</table>
</body>
</html>