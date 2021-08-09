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
	System.out.println("info의 id 확인 : " + info.getMemberId());
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));	
	System.out.println("Board에서 viewBoard로 board_num가 잘 넘어왔는지 확인 : "+ boardNum);
	
	boardDAO dao = new boardDAO();

	// 게시번호에 맞는 게시글 정보들을 담는 메소드
	boardDTO dto = dao.showOne(boardNum);
	System.out.println("dto의 게시번호 확인 : " + dto.getBoardNum());
	System.out.println("dto의 게시사람id 확인 : " + dto.getMemberId());
	System.out.println("dto의 게시날짜 확인 : " + dto.getBoardDate());
	System.out.println("dto의 게시내용 확인 : " + dto.getBoardContent());
	System.out.println("dto의 게시제목 확인 : " + dto.getBoardTitle());
	System.out.println("dto의 게시이미지 확인 : " + dto.getBoardImage());
    
	boardReDAO dao1= new boardReDAO();
	ArrayList<boardReDTO> boardRe_list= dao1.boardRe_li(boardNum);

%>
	<div class = "board">    				<!-- 확인용 -->
    	<table class="btable" border="1px">
        	<tr class="title">
            	<td>제목</td>
				<td><%= dto.getBoardTitle()%></td>
			</tr>
            <tr>
                <td>작성자</td>
                <td><%= dto.getMemberId() %></td>                  
            </tr>
            <tr>
				<td colspan="2">내용</td>
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
            <!-- 삭제 버튼 어디에 넣고 싶은지 정리해서 옮기면 돼 . 우선 기능 확인을 위해 밑의 행으로 옮겨둠 -->
            <tr>
				<%if(info!=null){ %>
    				<%if(info.getMemberId().equals(dto.getMemberId())) {%> 
						<td colspan="2"><a href="DeleteOneServiceCon?num=<%=dto.getBoardNum()%>">삭제 </a></td>
                	<%}else{%>
                		<td colspan="2">삭제할 수 없습니다.</td>
                	<%} %>
                <%} %>
			</tr>
            <tr>
            	<td colspan="2"><a href="Board.jsp"><button>뒤로가기</button></a></td>
            </tr>
    	</table>
	</div>
	<div> 					   <!-- 확인용 -->
		<table id = "reboard" border="1px">
		 		<th>
		 			<td>댓글</td>
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
        		<td colspan="4">댓글</td>
        	</th>
			<tr>
         		<td width="100">이름</td>
		        <td>
	        	 	<%if(info!=null){ %>
	         			<span><%=info.getMemberId() %></span>
	        	 	<%}else{ %>
	         			<input type="text" name="name">
	         		<% } %>
         		</td>
				<td width="100">비밀번호</td>
				<td width="150"><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">
					<textarea cols="60" name="content"></textarea>
				</td>
         	</tr>
         	<tr>
         		<td colspan="4">
					<input type="submit" value="저장" name="cmd">
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
<table>
<div id="class="down""></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>

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