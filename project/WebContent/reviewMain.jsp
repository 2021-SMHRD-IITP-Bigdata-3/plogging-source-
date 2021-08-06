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
   <td style = "float : right"><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
</tr>
</table>
<div id="map" style="width:340px;height:340px;" align ='center'></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	
   <div><!-- 123 -->
   <table border='1px' style='height:100px;'>
   <tr>
     <td>�ı�Խ���</td>
     <td><input type="button" value="�۾���" style='float: right;' onClick="location.href='reviewNum.jsp'"></tr>
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
	<td><input type="button" value="����" name="main" onClick="location.href='Main.jsp'"></td>
	<td><input type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
	<td><input type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"></td>
	<td><input type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'"></td>
	<td><input type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
</tr>
<tr>
   <td>����</td>
   <td>��ȸ</td>
   <td>�ı�</td>
   <td>�Խ���</td>
   <td>����</td>
</tr>
</table>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };
// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

if (navigator.geolocation) {
    
    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // ����
            lon = position.coords.longitude; // �浵
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
            message = '<div style="padding:5px;">���⿡ ��Ű���?!</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
        
        // ��Ŀ�� ���������츦 ǥ���մϴ�
        displayMarker(locPosition, message);
         
      });
    
} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation�� ����Ҽ� �����..'
        
    displayMarker(locPosition, message);
}

// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
function displayMarker(locPosition, message) {
    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
    map.setCenter(locPosition);      
}


	<%for(int i=0; i<array.size();i++){%>

	    // ��Ŀ�� �����մϴ�
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=array.get(i).getLat()%>, <%=array.get(i).getLng()%>)
	    	// ��Ŀ�� ��ġ

	    });
		
	    marker.setMap(map);
	    
	<%}%>

</script>
</body>
</html>