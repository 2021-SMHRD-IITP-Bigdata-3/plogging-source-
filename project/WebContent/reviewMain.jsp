<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.reviewBoardDTO"%>
	<%@page import="Model.reviewBoardDAO"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table{
width : 360px;
align : center;
}
</style>
</head>
<body>
<%
ArrayList<reviewBoardDTO> array = new ArrayList<reviewBoardDTO>();
reviewBoardDAO dao = new reviewBoardDAO();
array = dao.showBoard();
%>
<table>
<tr>
   <td float ="left">Plogging</td>
   <td style = "float : right"><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
</tr>
</table>
<div id="map" style="width:340px;height:340px;" align ='center'></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	
   <div><!-- 123 -->
   <table border='1px' style='height:100px;'>
   <tr>
     <td>후기게시판</td>
     <td><input type="button" value="글쓰기" style='float: right;' onClick="location.href='reviewNum.jsp'"></tr>
      </table>
      <form action = "Review8.jsp" method = "post">
      <table border='1px' style='height:100px;'>
      <%for(int i = 0; i<array.size();i++){%>
         <tr>
             <td> <a href = "Review8.jsp?reviewNumber=<%=array.get(i).getReviewNumber()%>"> <%=array.get(i).getTitle()%></a></td>
         </tr>
         <%} %>
      </table>
      </form>
   </div>

   <table>
   <tr>
      <td><input type = "button" value = "<<"></td>
      <td><input type = "button" value = "1"></td>
      <td><input type = "button" value = "2"></td>
      <td><input type = "button" value = "3"></td>
      <td><input type = "button" value = "4"></td>
      <td><input type = "button" value = "5"></td>
      <td><input type = "button" value = ">>"></td>
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
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
         
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}


	<%for(int i=0; i<array.size();i++){%>

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=array.get(i).getLat()%>, <%=array.get(i).getLng()%>)
	    	// 마커의 위치

	    });
		
	    marker.setMap(map);
	    
	<%}%>

</script>
</body>
</html>