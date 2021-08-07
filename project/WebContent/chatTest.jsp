<%@page import="Model.memberDTO"%>
<%@page import="Model.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.notice_BoardDTO"%>
    <%@page import="Model.notice_BoardDAO"%>
    <%@page import="Model.ChatDAO"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

	#chat, #chatmain{
		overflow: auto !important;
	}
	/* �ٽý����غ�����? */
</style>


<link rel="stylesheet" href="chatroom.css?after">
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
	System.out.println("(chatTest1������) ���� ��ȣ  : " + noticeNumber);
	System.out.println("(chatTest1������) �÷α� ��� : " + addr);
	System.out.println("(chatTest1������) �÷α� ���� : " + login_id);
	System.out.println("(chatTest1������) ���� �ο� : " + login_id);

	// ������ ����, �浵
	notice_BoardDAO dao = new notice_BoardDAO();
	notice_BoardDTO dto = dao.lating(noticeNumber);
	System.out.println("(chatTest1������) ������ ���� : " + dto.getLat());
	System.out.println("(chatTest1������) ������ �浵 : " + dto.getLng());

	// �α����� ���̵� �� ���� �����ߴ��� ���� �ľ�
	ArrayList<notice_BoardDTO> array = dao.showMyNotice(login_id);
	int check = 0;
	for (int i=0; i<array.size();i++){
		if (array.get(i).getNoticeNumber()==noticeNumber){
			check = 1;
		}
	}
	
%>	


	<div id="map"  align="center" ></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	<div> �������� </div>
	
	<input type="button" value="ä�ù���" name="main" onClick="location.href='chatChoice.jsp'">
	<div id="chatmain">
		<div id="chat">
		</div>
	</div>

	<div>
		<% if (info!=null){%>
			�� ���̵� : <%=login_id%>
		<% }else{ %>
			<input type="text" id="id" name="id" placeholder="���̵� �Է�">
		<% } %>
		<input type="text" id="content" name="content" placeholder="���� �Է�">
		<button id="send">�Է�</button><br>
		<% if (check==0){%>
			<input type='button' value="����" name="attend" 
				onClick="location.href='inquiryServiceCon?noticeNumber=<%=noticeNumber%>&login_id=<%=login_id%>'"><br>
		<% }else{ %>
			�����Ͻ� ä�ù��Դϴ�.
		<% } %>
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
			         var divdiv = document.getElementById("chat");
			         
			         var divdiv2 = document.getElementById("chatmain"); 
			         divdiv.scrollTop = divdiv.scrollHeight;
			         divdiv2.scrollTop = divdiv.scrollHeight;
			       },error: function (xhr) {
			         //alert(xhr);
			       } 
			    });
		}, 500);
 // ä�� �ӵ��� ���Ⲳ��
		
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
				        	var divdiv = document.getElementById("chat");
					         divdiv.scrollTop = divdiv.scrollHeight;
				       },error: function (xhr) {
				         //alert(xhr);
				       } 
				    });
				  //document.getElementById("send").value='';
			});

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
</body>
</html>