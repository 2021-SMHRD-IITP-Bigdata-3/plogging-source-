<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="Model.notice_BoardDTO"%>
    <%@page import="Model.ChatDAO"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script>
    $(function () {
        $(".left_sub_menu").hide();
        $(".has_sub").click(function () {
            $(".left_sub_menu").fadeToggle(300);
        });
        // 왼쪽메뉴 드롭다운
        $(".sub_menu ul.small_menu").hide();
        $(".sub_menu ul.big_menu").click(function () {
            $("ul", this).slideToggle(300);
        });
        // 외부 클릭 시 좌측 사이드 메뉴 숨기기
        $('.overlay').on('click', function () {
            $('.left_sub_menu').fadeOut();
            $('.hide_sidemenu').fadeIn();
        });
    });
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.side-menu {
            top: 10px;
            width: 5%;
            z-index: 10;
            background: #69f0ae;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 70px;
            position: fixed;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
        }

        .sidebar-inner {
            height: 100%;
            padding-top: 30px;
        }

        #sidebar-menu,
        #sidebar-menu ul,
        #sidebar-menu li,
        #sidebar-menu a {
            border: 0;
            font-weight: normal;
            line-height: 1;
            list-style: none;
            margin: 0;
            padding: 0;
            position: relative;
            text-decoration: none;
        }

        #sidebar-menu>ul>li a {
            color: #fff;
            font-size: 20px;
            display: block;
            padding: 14px 0px;
            margin: 0px 0px 0px 23%;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            width: 28px;
            cursor: pointer;
        }

        #sidebar-menu .fas {
            padding-left: 6px;
        }

        /* 사이드 메뉴 */
        input[type="search"] {
            width: 180px;
            margin: 0 auto;
            margin-left: 9px;
            border: 2px solid #797979;
            font-size: 14px;
            margin-top: 10px;
            padding: 4px 0 4px 14px;
            border-radius: 50px;
        }

        .left_sub_menu {
            position: fixed;
            top: 50px;
            width: 12%;
            z-index: 10;
            left: 45px;
            background: white;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 0px;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
            color: black;
        }

        .sub_menu {
            margin-top: 50px;
        }

        .left_sub_menu>.sub_menu li:hover {
            color: ff5858;
            background-color: #e1e1e1;
        }

        .left_sub_menu>.sub_menu li {
            color: #333;
            font-size: 17px;
            font-weight: 600;
            padding: 20px 0px 8px 14px;
            border-bottom: 1px solid #e1e1e1;
        }

        .sub_menu>h2 {
            padding-bottom: 4px;
            border-bottom: 3px solid #797979;
            margin-top: 30px;
            font-size: 21px;
            font-weight: 600;
            color: #333;
            margin-left: 10px;
            margin-right: 10px;
            font-family: 'NotoKrB';
            line-height: 35px;
        }

        .sub_menu .fas {
            color: #ff5858;
            font-size: 20px;
            line-height: 20px;
            float: right;
            margin-right: 20px;
        }

        .sub_menu>.big_menu>.small_menu li {
            color: #333;
            font-size: 14px;
            font-weight: 600;
            border-bottom: 0px solid #e1e1e1;
            margin-left: 14px;
            padding-top: 8px;
        }

        .big_menu {
            cursor: pointer;
        }

        ul {
            padding-inline-start: 0px;
        }

        a {
            color: #797979;
            text-decoration: none;
            background-color: transparent;
        }

        ul {
            list-style: none;
        }

        ol,
        ul {
            margin-top: 0;
            margin-bottom: 10px;
        }

        .has_sub {
            width: 100%;
        }

        .overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            /* background: rgba(0, 0, 0, 0.7); */
        }

        .hide_sidemenu {
            display: none;
        }
   body{
    background-color: #efefef;
   scrollbar-width: none;
    -ms-overflow-style: none;
   }
	#chatmain{
		margin:0px 0px 0px 5%;
		width: 95%;
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
	
	  width:85%;
	  margin-left:5%;
	  height:100px;
	  font-size:20px;
	  float:left
	}
	#send{
		width:10%;
		height:106px;
		float:left;
	}
	#map{
		margin:0px 0px 0px 3%;
		width:97%;
		height:300px;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%
	// 로그인 시 필요
	memberDTO info = (memberDTO) session.getAttribute("info");
	
	// 채팅 목록에서 넘어올 때 
	request.setCharacterEncoding("EUC-KR");
	int chatRoomNum = Integer.parseInt(request.getParameter("chatRoomNum"));
	System.out.println("(chatTest1페이지)chatRoomNum : " + chatRoomNum);
	
	ChatDAO dao = new ChatDAO();
	notice_BoardDTO dto = dao.lating(chatRoomNum);
	
	System.out.println("(chatTest1페이지)chatRoomNum : " + dto.getLat());
	System.out.println("(chatTest1페이지)chatRoomNum : " + dto.getLng());
%>	


	<div id="map"  align="center" ></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
	<div> 공고정보 </div>
	<input type="button" value="채팅방목록" name="main" onClick="location.href='chatChoice.jsp'">
	<div id="chatmain">
		<div id="chat">
		</div>
	</div>
	<div>
		<input type="text" id="content" name="content" placeholder="내용 입력">
		<button id="send">입력</button>
	</div>
	<script type="text/javascript">
	
		// 데이터베이스에 저장된 채팅 정보를 웹에 뿌려주는 뿌려주는 부분
		// setInterval은 주기적인 실행 함수로 0.2초마다 셀렉트해서 뿌려주겠다는 의미
		setInterval(function(){
			var chatRoomNum = <%=chatRoomNum %>;
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
        // 하단 스크롤 이동 버튼

			// 아이디와 채팅내용 입력받는 부분
			// 입력받은 값을 ChatInsertCon으로 보내서 데이터베이스에 넣으려 해
			$("#send").on('click',function(){
				var chatRoomNum = <%=chatRoomNum %>;
				var id = "<%=info.getMemberId()%>";
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
				  //document.getElementById("send").value='';
			});

			
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
<div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub"><a href="javascript:void(0);" class="waves-effect">
                                <i class="fas fa-bars"></i>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
                    <input type="search" name="SEARCH" placeholder="SEARCH">
                    <h2>TITLE</h2>
                    <ul class="big_menu">
                        <li>MENU 1 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="Main.jsp">메인</a></li>
                            <li><a href="inquiryMain.jsp">조회</a></li>
                            <li><a href="reviewMain.jsp">후기</a></li>
                            <li><a href="Board.jsp">게시판</a></li>
                            <li><a href="reportPostWrite.jsp">제보</a></li>
                        </ul>
                    </ul>
                    <!--   <ul class="big_menu">
                        <li>MENU 2 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">소메뉴2-1</a></li>
                            <li><a href="#"></a>소메뉴2-2</a></li>
                        </ul>
                    </ul> -->
                    
                    <ul class="big_menu">
                    <%if(info!=null){ %>
                        <li><a href="myPage.jsp" class="a001">MYPAGE</a></li>
                    <%}else{ %>
                    	<li>회원가입이 시급합니다.</li>
                    <%}%>
                    </ul>

                </div>
            </div>
        </div>
  <div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub"><a href="javascript:void(0);" class="waves-effect">
                                <i class="fas fa-bars"></i>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
                    <h2>TITLE</h2>
                    <ul class="big_menu">
                        <li>MENU 1 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="Main.jsp">메인</a></li>
                            <li><a href="inquiryMain.jsp">조회</a></li>
                            <li><a href="reviewMain.jsp">후기</a></li>
                            <li><a href="Board.jsp">게시판</a></li>
                            <li><a href="reportPostWrite.jsp">제보</a></li>
                        </ul>
                    </ul>
                    <!--   <ul class="big_menu">
                        <li>MENU 2 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">소메뉴2-1</a></li>
                            <li><a href="#"></a>소메뉴2-2</a></li>
                        </ul>
                    </ul> -->
                    
                    <ul class="big_menu">
                    <%if(info!=null){ %>
                        <li><a href="myPage.jsp" class="a001">MYPAGE</a></li>
                    <%}else{ %>
                    	<li>회원가입이 시급합니다.</li>
                    <%}%>
                    </ul>

                </div>
            </div>
        </div>
</body>
</html>