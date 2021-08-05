<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.reviewBoardDTO"%>
	<%@page import="Model.reviewBoardDAO"%>
	<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table {
		width : 360px;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	int reviewNumber = Integer.parseInt(request.getParameter("reviewNumber"));
	
	System.out.println("reviewNumber : "+reviewNumber);

    reviewBoardDAO dao = new reviewBoardDAO();
    reviewBoardDTO dto = dao.showOne(reviewNumber);
%>
<div>
	<table>
	<tr>
	   <td>싸이트명</td>
	   <td style = "float : right"><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
	   <td style = "float : right"><input type ="button" value = "검색"></td>
	</tr>
	</table>
	<form action = "" method = "post">
		<table border = "1px" >
			<tr>
				<td colspan = "4">
					<%=dto.getTitle() %>
				</td>
			</tr>
			<tr>
				<td> <%=dto.getReviewDate() %> </td>
				<td> <%=dto.getMemberId() %> </td>
			</tr>
			<tr> <td colspan = "4" height = "300"><%=dto.getContents() %> </td></tr>
			<tr> <td colspan = "2"> 쓰레기 양 </td><td colspan = "3"> <%=dto.getTrash() %> </td></tr>
			<tr> <td colspan = "2"> 플로깅 거리 </td><td colspan = "3"> <%=dto.getRun()%> </td></tr>
			<tr>
				<td colspan = "3" id="map" style="width:340px;height:340px;" align ='center'></td>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	
			</tr>
			<tr>
				<td colspan = ""></td>
				<td> <input type = "submit" value = "수정"> </td>
				<td> <input type = "submit" value = "삭제"> </td>
			</tr>			
		</table>
				<table  border = "1px">
		<tr>
		   <td colspan = "4"> 댓글 </td>
		</tr>
		<tr>
		   <td colspan = "4"> 닉네임 </td>
		</tr>		
		<tr>
		   <td colspan = "4"> 댓글내용 </td>
		</tr>
		<tr>
		   <td colspan = "4"> 댓글시간 </td>
		</tr>
		<tr>
		   <td colspan = "4"><input type="text"  placeholder = "댓글 쓰기"></td>
		</tr>
		<tr>
		   <td colspan = "2"> prev</td>
		   <td colspan = "2"> next</td>
		</tr>
		</table>
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
	</form>
</div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 




	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>)
	    	// 마커의 위치

	    });
		
	    marker.setMap(map);
	    
</script>
</body>
</html>