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
	   <td>����Ʈ��</td>
	   <td style = "float : right"><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
	   <td style = "float : right"><input type ="button" value = "�˻�"></td>
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
			<tr> <td colspan = "2"> ������ �� </td><td colspan = "3"> <%=dto.getTrash() %> </td></tr>
			<tr> <td colspan = "2"> �÷α� �Ÿ� </td><td colspan = "3"> <%=dto.getRun()%> </td></tr>
			<tr>
				<td colspan = "3" id="map" style="width:340px;height:340px;" align ='center'></td>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	
			</tr>
			<tr>
				<td colspan = ""></td>
				<td> <input type = "submit" value = "����"> </td>
				<td> <input type = "submit" value = "����"> </td>
			</tr>			
		</table>
				<table  border = "1px">
		<tr>
		   <td colspan = "4"> ��� </td>
		</tr>
		<tr>
		   <td colspan = "4"> �г��� </td>
		</tr>		
		<tr>
		   <td colspan = "4"> ��۳��� </td>
		</tr>
		<tr>
		   <td colspan = "4"> ��۽ð� </td>
		</tr>
		<tr>
		   <td colspan = "4"><input type="text"  placeholder = "��� ����"></td>
		</tr>
		<tr>
		   <td colspan = "2"> prev</td>
		   <td colspan = "2"> next</td>
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
	</form>
</div>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };
// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 




	    // ��Ŀ�� �����մϴ�
	    var marker = new kakao.maps.Marker({
	    	
	    	position: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>)
	    	// ��Ŀ�� ��ġ

	    });
		
	    marker.setMap(map);
	    
</script>
</body>
</html>