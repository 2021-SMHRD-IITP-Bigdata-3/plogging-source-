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
	// 로그인 시 필요

	memberDTO info = (memberDTO) session.getAttribute("info");
	String login_id = info.getMemberId();
	System.out.println("(chatTest1페이지) 로그인 아이디 login_id : " + login_id);
	

	// 조회, 공고방 목록에서 넘어올 때
	request.setCharacterEncoding("EUC-KR");	
	int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
	String addr = request.getParameter("addr");
	String plogDate = request.getParameter("plogDate");
	String limitedNumber = request.getParameter("limitedNumber");
	System.out.println("(chatTest1페이지) 공고 번호 noticeNumber : " + noticeNumber);
	System.out.println("(chatTest1페이지) 플로깅 장소 : " + addr);
	System.out.println("(chatTest1페이지) 플로깅 기한 : " + login_id);
	System.out.println("(chatTest1페이지) 제한 인원 : " + login_id);
	
	// 공고의 위도, 경도
	ChatDAO dao = new ChatDAO();
	notice_BoardDTO dto = dao.lating(noticeNumber);
	System.out.println("(chatTest1페이지) 공고의 위도 : " + dto.getLat());
	System.out.println("(chatTest1페이지) 공고의 경도 : " + dto.getLng());
	
%>	
	<div id="map" style="width:500px;height:340px;" align ='center'></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	<div> 공고정보 </div>
	
<!-- 자바스크립트로 id랑 content데이터를 담은 <div>를 계속 추가하는 거라서 폼태그는 복잡해질 듯 => 서브스트링방식으로 수정 -->
	<input type="button" value="채팅방목록" name="main" onClick="location.href='chatChoice.jsp'">
	<div id="chatmain">
		<div id="chat">
		</div>
	</div>

	<div>
	  <% if (info!=null){%>
			내 아이디 : <%=login_id%>
	  <%}else{ %>
			<input type="text" id="id" name="id" placeholder="아이디 입력">
	  <% } %>
			<input type="text" id="content" name="content" placeholder="내용 입력">
			<button id="send">입력</button>
			<input type='button' value="참가" name="attend" 
				onClick="location.href='inquiryServiceCon?noticeNumber=<%=noticeNumber%>&login_id=<%=login_id%>'"><br>
	</div>


	<!-- 채팅 기능  -->
	<script type="text/javascript">
	
		// 데이터베이스에 저장된 채팅 정보를 웹에 뿌려주는 뿌려주는 부분
		// setInterval은 주기적인 실행 함수로 0.2초마다 셀렉트해서 뿌려주겠다는 의미
		setInterval(function(){
			var chatRoomNum = <%=noticeNumber%>;
			$.ajax({
			       url: "ChatSelectCon", //컨트롤러 URL
			       dataType: 'json',
			       type: 'POST',
			       data:{"chatRoomNum":chatRoomNum},
			       // 한글도 가능하도록 인코딩. jquery는 utf-8 사용
			       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			       success: function (res) {
			    	   // 뿌려주고 나서 비워주기 (안 그러면 계속 셀렉트가 돌면서 대화를 계속 반복해서 뿌리게 돼)
			    	   	$("#chat").empty();
			    	   	var chatContainer = $("#chat");
			    	   	// 입력인자 res에 ChatSelectCon에서 실행한 셀렉트 결과(리스트)가 들어 있고 그 중에 member_id와 content를 가져와서
			    	   	// for문 사용해서 뿌려주기
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

		
			// 아이디와 채팅내용 입력받는 부분
			// 입력받은 값을 ChatInsertCon으로 보내서 데이터베이스에 넣으려 해
			$("#send").on('click',function(){
				var chatRoomNum = <%=noticeNumber %>;
				var id = "<%=login_id%>";
				var content = $('#content').val();
				
				  $.ajax({
				       url: "ChatInsertCon", //컨트롤러 URL
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
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};
//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 




    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
    	
    	position: new kakao.maps.LatLng(<%=dto.getLat()%>, <%=dto.getLng()%>)
    	// 마커의 위치

    });
	
    marker.setMap(map);
</script>
</table>
</body>
</html>