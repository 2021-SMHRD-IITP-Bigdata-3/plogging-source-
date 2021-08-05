<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table {
	width: 360px;
}

textarea {
	width: 360px;
	height: 300px;
}

tr td a {
	width:
}
</style>
</head>
<body>

	<div>
		<table>
			<tr>
				<td>싸이트명</td>
				<!-- ㄴㅇㅁㄴㅇ-->
				<td style="float: right"><input type="button" value="내정보 검색"
					onClick="location.href='myPage.jsp'"></td>
				<td style="float: right"><input type="button" value="검색"></td>
			</tr>
		</table>
		<form action="reportPostServiceCon" method="post" enctype = "multipart/form-data">
			<table border="1px">
				<tr>
					<td colspan="4"><input type="text" placeholder="제목을 입력하세요."
						name="title"></td>
				</tr>
				<tr>
					<td colspan="3">업로드 <input type="file" name="fileName">
					</td>
					<td><a href="inputAddress.jsp" target="_blank"><img
							src="Map.png" width="50" height="50"></a>
<%
	// 포스트 방식
     request.setCharacterEncoding("EUC-KR");
	 String title = request.getParameter("title");
	 String lat = request.getParameter("lat");
	 String lng = request.getParameter("lng");
	 String addr = request.getParameter("addr");
	 if(lat!=null){
	 System.out.println("(reportPostWrite.jsp페이지)latdd : " + lat);
	 System.out.println("(reportPostWrite.jsp페이지)lngdd :" + lng);
	 System.out.println("(reportPostWrite.jsp페이지)addrdd :" + addr);
	 } 
	 
 %>
			  <input type="hidden" name="lat" id="lat">
			  <input type="hidden" name="lng" id="lng">
			  <input type="hidden" name="addr" id="addr">
			   </td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="content"></textarea></td>
				</tr>
			</table>
			<table border='1px'>
				<tr>
					<td align="center"><input type="submit" value="제보하기 완료"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><input type="button" value="메인" name="main"
						onClick="location.href='Main.jsp'"></td>
					<td><input type="button" value="조회" name="inquiry"
						onClick="location.href='inquiryMain.jsp'"></td>
					<td><input type="button" value="후기" name="review"
						onClick="location.href='reviewMain.jsp'"></td>
					<td><input type="button" value="게시판" name="board"
						onClick="location.href='Board.jsp'"></td>
					<td><input type="button" value="제보" name="report"
						onClick="location.href='reportPostWrite.jsp'"></td>
				</tr>
				<tr>
					<td>메인</td>
					<td>조회</td>
					<td>후기</td>
					<td>게시판</td>
					<td>제보</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
	<%if(lat!=null){%>
		document.getElementById('lat').value = "<%=lat%>";
		document.getElementById('lng').value = "<%=lng%>";
		document.getElementById('addr').value = "<%=addr%>";
	<%}%>
	</script>
</body>
</html>