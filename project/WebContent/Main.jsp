<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.reportTestDAO"%>
<%@page import="Model.reportTestDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'netmarbleB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<link rel="stylesheet" href="css/Main.css?after">
</head>
<body>
<%
   memberDTO info = (memberDTO)session.getAttribute("info");   
   if (info!=null){
      double memberLat = info.getMemberLat();
      double memberLng = info.getMemberLng();
      System.out.println("(메인페이지에 사용자의 위도가 잘 넘어오는지) memberLat : "+ memberLat);
      System.out.println("(메인페이지에 사용자의 경도가 잘 넘어오는지) memberLng : "+ memberLng);
   }
   // 젼역변수 선언
   notice_BoardDAO dao = new notice_BoardDAO();
   
      // 메인 들어오면 - 플로깅 기한 지난 공고들 연장
   int cnt = dao.plogDateUpdate();
   if(cnt>0) {
      System.out.println("플로깅 기한 연장 성공");
   }else {System.out.println("플로깅 기한 연장 실패");
   }
   
   // 나의 채팅방 목록 (조회에서 '참가' 클릭한 목록)
   ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
   if (info!=null){
      array = dao.showMyChatroom(info.getMemberId());
      for(int i=0; i<array.size(); i++){
         System.out.println(" 채팅방 번호  : " + array.get(i).getNoticeNumber() );
      }
   } 
   // (공고로 사용되지 않은) 제보 목록
   ArrayList<reportTestDTO> report_array = new ArrayList<reportTestDTO>();
   reportTestDAO report_dao = new reportTestDAO();
   report_array = report_dao.reportShow();
   for(int i=0; i<report_array.size(); i++){
      System.out.println(" 공고 번호  : " + report_array.get(i).getReport_number());
   }
   
   
   ArrayList<reviewBoardDTO> reviewArray = new ArrayList<reviewBoardDTO>();
   reviewBoardDAO reviewDao = new reviewBoardDAO();
   reviewArray = reviewDao.showBoard();
   %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
  function openCloseToc() {
    if(document.getElementById('hide').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
    } else {
      document.getElementById('toc-content').style.display = 'block';
    }
  }
</script>
<table>
   <tr>
      <td id ="title" style = "width:124px;">plogging</td>
         <% if(info != null) { %>
      <td><input style="margin: 0px 0px 0px 238px;"  type ="button" value = "로그아웃" onClick="location.href='logoutServiceCon'"></td>
      <td>
         <ul style="list-style: none; ">
              <li class="menu" >
                  <a><div class="topicon" onclick="openCloseToc()" >채팅방</div></a>
                  <ul id="hide" style="display:none; list-style: none;">
                     <% if(info != null) { %>
                        <% for(int i=0; i<array.size(); i++){ %>
                        		<%int a = 80*i; %>
                            <li><div style="margin-top:<%=a %>px" value="<%=array.get(i).getNoticeNumber()%>번 공고" name="chat" onClick="location.href='chatTest.jsp?noticeNumber=<%=array.get(i).getNoticeNumber()%>'"><%=array.get(i).getNoticeNumber()%></div></li>
                           <%}%>
                     <%}%>   
                  </ul>
              </li>
          </ul>
      </td>
      <td><i class="far fa-user"  type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
         <% }else { %>
      <td > <a id = "myimport" onClick="location.href='Login.jsp'"><img id='login' src= "login.png" style ="margin:10px 10px 0px 10px; width:30px;" >로그인</a> </td>
      <% } %>
   </tr>
</table>

<br>

<%if(info !=null){ %>
<form action = "reportPostWrite.jsp" method = "post">
   <h2 style = "font-size: 2em;
    text-align: center;
    margin: 70px 0px 10px 0px;
    border-bottom: 3px solid;
}">집에서도 간편하게 플로깅 해보는건 어떨까요?</h2>
   <div id="map" style="width:100%;height:600px;"></div>
</form>

      <div id ="cafe"><th>회원들의 따끈따근 후기</th></div>
      <table border='0px' style='height:100px;'>
            <%for(int i = 0; i<3;i++){%>

            <tr style = "border-bottom:1px">
            <td id = "membertitle"><a href = "Review8.jsp?reviewNumber=<%=reviewArray.get(i).getReviewNumber()%>"><%=reviewArray.get(i).getTitle()%></a></td>
            <td id = "ae">작성자 : <%=reviewArray.get(i).getMemberId() %></td>
           </tr>
      <%} %>
      </table>
<table>
   <tr>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 0px 15px 100px;
         ">쓰담뉴스</div></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 208px 0px 0px;
         ">쓰담뉴스</div></td></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 95px 74px 0px 0px;
         ">쓰담뉴스</div></td></td>
   </tr>
   <tr>
      <td><div style="
                   width: 40%;
                   margin: 0px 0px 0px 70px;
      "><a style="font-size:22px;"href="https://blog.naver.com/purity_k/222459285852">대세는 조깅말고 줍깅! 오산천 플로깅 후기</a></div></td>
      <td><div style="
                   width: 66%;
                   margin: 0px 0px 0px -25px;
      "><a style="font-size:22px;" href="https://blog.naver.com/earthactkgjn/222180131468">요즘 운동 트렌드는 '플로깅' 건강과 환경 모두 지키자!</a></div></td>
      <td><div style="
                   width: 82%;
                   margin: 0px 0px 0px -17px;
      "><a style="font-size:22px;"href="https://blog.naver.com/flydms/222290879041">플로깅으로 여름방학을 뜻깊게 보내볼까요?</a></div></td>
   </tr>
</table>
<%}else { %>
<table>
<tr>
<td><iframe src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</td>
</tr>
</table>
      <div id ="cafe"><th>회원들의 따끈따근 후기</th></div>
      <table border='0px' style='height:100px;'>
            <%for(int i = 0; i<3;i++){%>

            <tr style = "border-bottom:1px">
            <td id = "membertitle"><a href = "Review8.jsp?reviewNumber=<%=reviewArray.get(i).getReviewNumber()%>">-  <%=reviewArray.get(i).getTitle()%></a></td>
            <td id = "ae">작성자 : <%=reviewArray.get(i).getMemberId() %></td>
           </tr>
      <%} %>
      </table>
<br>
<table>
   <tr>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 0px 15px 100px;
         ">쓰담뉴스</div></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 208px 0px 0px;
         ">쓰담뉴스</div></td></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 95px 75px 0px 0px;
         ">쓰담뉴스</div></td></td>
   </tr>
   <tr>
      <td><div style="
                   width: 40%;
                   margin: 0px 0px 0px 70px;
      "><a style="font-size:22px;"href="https://blog.naver.com/purity_k/222459285852">대세는 조깅말고 줍깅! 오산천 플로깅 후기</a></div></td>
      <td><div style="
                   width: 66%;
                   margin: 0px 0px 0px -25px;
      "><a style="font-size:22px;" href="https://blog.naver.com/earthactkgjn/222180131468">요즘 운동 트렌드는 '플로깅' 건강과 환경 모두 지키자!</a></div></td>
      <td><div style="
                   width: 82%;
                   margin: 0px 0px 0px -17px;
      "><a style="font-size:22px;"href="https://blog.naver.com/flydms/222290879041">플로깅으로 여름방학을 뜻깊게 보내볼까요?</a></div></td>
   </tr>
</table>
<%} %>
<br><br><br><br><br><br><br>
<table>
<div class="down"></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>
</table>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
<script><!-- ㄴㅇㅁㄴㅇ-->
   <%if(info !=null){%>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
            center: new kakao.maps.LatLng(<%=info.getMemberLat()%>,<%=info.getMemberLng()%>), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
      };

      //지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
   
      // 전역변수
      let lat;
      let lng;
      
      <%for(int i=0; i<report_array.size();i++){%>
         // 마커를 생성합니다
         // 값이 잘 들어오는지 확인
         lat = <%=report_array.get(i).getLat()%>;
         lng = <%=report_array.get(i).getLng()%>;
         report_number = <%=report_array.get(i).getReport_number()%>;
         console.log('lat, lng: ', lat, lng);
   
         var marker = new kakao.maps.Marker({      
            position: new kakao.maps.LatLng(lat, lng)
         // 마커의 위치
         });
         
         makeMarkerDeletable(report_number, marker);
      
         marker.setMap(map);
      <%}%>
   <%}%>
   
      // '지울 수 있는 마커 만들기' 함수 생성
   function makeMarkerDeletable(targetReportNumber, targetMarker) {

      //href="maingDelete?lat="+latlng.getLat()+"&lng="+latlng.getLng();
      //마커를 지우는 이벤트
      kakao.maps.event.addListener(targetMarker, 'click', function() {
        // 마커 위에 인포윈도우를 표시합니다
        var lat = targetMarker.getPosition().getLat()
        var lng = targetMarker.getPosition().getLng()
        console.log('lat : ', lat);
        console.log('lng : ', lng);
        targetMarker.setMap(null);
        
      $.ajax({
         url: "deleteReportServiceCon",
          type: 'POST',
          data:{"report_number" : targetReportNumber},
          contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
          success: function (res) {
              console.log(res);
          },
          error: function (xhr) {
              alert(xhr);
          } 
      });
      
      });
   }
</script>
</body>
</html>