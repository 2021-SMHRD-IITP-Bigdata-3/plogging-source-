<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.notice_BoardDTO"%>
    <%@page import="Model.ChatDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#chatmain{
		text-align:center;
		width: 100%;
		height: 500px;
		background-color: #B2C7D9;
		padding: 20px;
		overflow-y: scroll;
	}
	
	.my{
		text-align: right;
		font-color:black;		
	}
	.others{
		text-align: left;
		font-color:black;
	}
	#content{
	  width:200px;
	  height:100px;
	  font-size:20px;
	}

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%
	// �α��� �� �ʿ�

	memberDTO info = (memberDTO) session.getAttribute("info");
	String login_id = info.getMemberId();
	System.out.println("(chatTest1������) �α��� ���̵� login_id : " + login_id);
	

	// ��ȸ, ����� ��Ͽ��� �Ѿ�� ��
	request.setCharacterEncoding("EUC-KR");	
	int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
	String addr = request.getParameter("addr");
	String plogDate = request.getParameter("plogDate");
	String limitedNumber = request.getParameter("limitedNumber");
	System.out.println("(chatTest1������) ���� ��ȣ noticeNumber : " + noticeNumber);
	System.out.println("(chatTest1������) �÷α� ��� : " + addr);
	System.out.println("(chatTest1������) �÷α� ���� : " + login_id);
	System.out.println("(chatTest1������) ���� �ο� : " + login_id);
	
	// ������ ����, �浵
	ChatDAO dao = new ChatDAO();
	notice_BoardDTO dto = dao.lating(noticeNumber);
	System.out.println("(chatTest1������) ������ ���� : " + dto.getLat());
	System.out.println("(chatTest1������) ������ �浵 : " + dto.getLng());
	
%>	
	<div id="map" style="width:500px;height:340px;" align ='center'></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	<div> �������� </div>
	
<!-- �ڹٽ�ũ��Ʈ�� id�� content�����͸� ���� <div>�� ��� �߰��ϴ� �Ŷ� ���±״� �������� �� => ���꽺Ʈ��������� ���� -->
	<input type="button" value="ä�ù���" name="main" onClick="location.href='chatChoice.jsp'">
	<div id="chatmain">
		<div id="chat">
		</div>
	</div>

	<div>
	  <% if (info!=null){%>
			�� ���̵� : <%=login_id%>
	  <%}else{ %>
			<input type="text" id="id" name="id" placeholder="���̵� �Է�">
	  <% } %>
			<input type="text" id="content" name="content" placeholder="���� �Է�">
			<button id="send">�Է�</button>
			<input type='button' value="����" name="attend" 
				onClick="location.href='inquiryServiceCon?noticeNumber=<%=noticeNumber%>&login_id=<%=login_id%>'"><br>
	</div>


	<!-- ä�� ���  -->
	<script type="text/javascript">
	
		// �����ͺ��̽��� ����� ä�� ������ ���� �ѷ��ִ� �ѷ��ִ� �κ�
		// setInterval�� �ֱ����� ���� �Լ��� 0.2�ʸ��� ����Ʈ�ؼ� �ѷ��ְڴٴ� �ǹ�
		setInterval(function(){
			var chatRoomNum = <%=noticeNumber%>;
			$.ajax({
			       url: "ChatSelectCon", //��Ʈ�ѷ� URL
			       dataType: 'json',
			       type: 'POST',
			       data:{"chatRoomNum":chatRoomNum},
			       // �ѱ۵� �����ϵ��� ���ڵ�. jquery�� utf-8 ���
			       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			       success: function (res) {
			    	   // �ѷ��ְ� ���� ����ֱ� (�� �׷��� ��� ����Ʈ�� ���鼭 ��ȭ�� ��� �ݺ��ؼ� �Ѹ��� ��)
			    	   	$("#chat").empty();
			    	   	var chatContainer = $("#chat");
			    	   	// �Է����� res�� ChatSelectCon���� ������ ����Ʈ ���(����Ʈ)�� ��� �ְ� �� �߿� member_id�� content�� �����ͼ�
			    	   	// for�� ����ؼ� �ѷ��ֱ�
			    		for(var i = 0; i < res.length; i++){
			    			var id = res[i].member_id;
			    			var content = res[i].content;
			    			if(id=="<%=login_id%>"){
			    				chatContainer.append("<div class='my'>" + id + " : " + content + "</div>")	
			    			}else{
				    			chatContainer.append("<div class='others'>" + id + " : " + content + "</div>")
			    			};
			    		}
			         console.log(res);
			       },error: function (xhr) {
			         //alert(xhr);
			       } 
			    });
		}, 200);

		
			// ���̵�� ä�ó��� �Է¹޴� �κ�
			// �Է¹��� ���� ChatInsertCon���� ������ �����ͺ��̽��� ������ ��
			$("#send").on('click',function(){
				var chatRoomNum = <%=noticeNumber %>;
				var id = "<%=login_id%>";
				var content = $('#content').val();
				
				  $.ajax({
				       url: "ChatInsertCon", //��Ʈ�ѷ� URL
				       dataType: 'text',
				       type: 'POST',
				       data:{"chatRoomNum":chatRoomNum,"id":id,"content":content},
				       contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				       success: function (res) {
				        	console.log(res);
				       },error: function (xhr) {
				         //alert(xhr);
				       } 
				    });
				  document.getElementById("send").value='';
			});

	</script>
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
<script>

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
mapOption = {
    center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // ������ �߽���ǥ
    level: 3 // ������ Ȯ�� ����
};
//������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 




    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
    	
    	position: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>)
    	// ��Ŀ�� ��ġ

    });
	
    marker.setMap(map);
</script>
</table>
</body>
</html>