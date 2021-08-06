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
		margin:auto;
		width: 90%;
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
	  width:88%;
	  margin-left:28px;
	  height:100px;
	  font-size:20px;
	}
	#send{
		width:10%;
		height:100px;
	  	margin:auto;
	}

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%
	// �α��� �� �ʿ�
	memberDTO info = (memberDTO) session.getAttribute("info");
	
	// ä�� ��Ͽ��� �Ѿ�� �� 
	request.setCharacterEncoding("EUC-KR");
	int chatRoomNum = Integer.parseInt(request.getParameter("chatRoomNum"));
	System.out.println("(chatTest1������)chatRoomNum : " + chatRoomNum);
	
	ChatDAO dao = new ChatDAO();
	notice_BoardDTO dto = dao.lating(chatRoomNum);
	
	System.out.println("(chatTest1������)chatRoomNum : " + dto.getLat());
	System.out.println("(chatTest1������)chatRoomNum : " + dto.getLng());
%>	
	<div id="map" style="width:500px;height:340px;" align ='center'></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	<div> �������� </div>
	<input type="button" value="ä�ù���" name="main" onClick="location.href='chatChoice.jsp'">
	<div id="chatmain">
		<div id="chat">
		</div>
	</div>
	<div style ="width:90%">
		<input type="text" id="content" name="content" placeholder="���� �Է�">
		<button id="send">�Է�</button>
	</div>
	<script type="text/javascript">
	
		// �����ͺ��̽��� ����� ä�� ������ ���� �ѷ��ִ� �ѷ��ִ� �κ�
		// setInterval�� �ֱ����� ���� �Լ��� 0.2�ʸ��� ����Ʈ�ؼ� �ѷ��ְڴٴ� �ǹ�
		setInterval(function(){
			var chatRoomNum = <%=chatRoomNum %>;
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
			    			if(id=="<%=info.getMemberId()%>"){
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
        // �ϴ� ��ũ�� �̵� ��ư

			// ���̵�� ä�ó��� �Է¹޴� �κ�
			// �Է¹��� ���� ChatInsertCon���� ������ �����ͺ��̽��� ������ ��
			$("#send").on('click',function(){
				var chatRoomNum = <%=chatRoomNum %>;
				var id = "<%=info.getMemberId()%>";
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