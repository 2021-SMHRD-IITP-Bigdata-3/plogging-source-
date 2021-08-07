<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.boardDTO"%>
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
<link rel="stylesheet" href="Main.css">
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


%>

<td ><input type ="button" value = "채팅목록" onClick="location.href='chatChoice.jsp'"></td>
<table>
	<tr>
	   <td id ="title" style = "width:124px;">plogging</td>
	      <% if(info != null) { %>
	   <td><input  type ="button" value = "로그아웃" onClick="location.href='logoutServiceCon'"></td>
	   <td ><i class="far fa-address-book"  type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
	      <% }else { %>
	   <td> <input  type ="button" value = "로그인" onClick="location.href='Login.jsp'"> </td>
	   <td><input style = "float : right" type ="button" value = "회원가입" onClick="location.href='Join.jsp'"></td>
      <% } %>
	   
	</tr>
</table>
<table style="float: right" >
	<tr>
		<td>
    <ul style="list-style: none; ">
        <li class="menu" >
            <a><div class="topicon" >채팅방</div></a>
            <ul class="hide" style="list-style: none; padding-left:0px;">
                <li><div class="topicon">채팅방1</div></li>
                <li><div class="topicon">채팅방2</div></li>
                <li><div class="topicon">채팅방3</div></li>
            </ul>
        </li>
    </ul>
    	</td>
    </tr>
</table>
<br><br>
<table>
<tr><td><a href="https://terms.naver.com/entry.naver?docId=5138665&cid=43667&categoryId=43667">플로깅</a></td></tr>
</table>
<br>
<table>
<tr>
<td><iframe src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</td>
</tr>
</table>
<br>
<ul>
<div id = "news"><th>요즘 뜨고 있는 핫 뉴스</th></div>

<li id = "ae"><a href="https://www.news1.kr/articles/?4391799">LG헬로비전, #지구좋아산책 캠페인 진행…"플로깅 함께해요"</a></li>


<li id = "ae"><a href="https://www.etoday.co.kr/news/view/2050450">GS파워, 비대면 '플로깅' 캠페인 전개</a></li>


<li id = "ae"><a href="http://www.kbsm.net/default/index_view_page.php?idx=319697&part_idx=320">예천군 축산과, 기관단체와 환경정화 플로깅 활동</a></li>

</ul>
<br>
<ul>
	<div id ="cafe"><th>플로깅 경험자들의 블로그 & 카페</th></div>

	<li id = "ae"><a href="https://blog.naver.com/happyhouse2u/222359846153">대세는 조깅말고 줍깅! 오산천 플로깅 후기</a></li>
	<li id = "ae"><a href="https://post.naver.com/viewer/postView.naver?volumeNo=31743685&memberNo=25324157&vType=VERTICAL">요즘 운동 트렌드는 '플로깅' 건강과 환경 모두 지키자!</a></li>
	<li id = "ae"><a href="https://blog.naver.com/sku-cast/222439716410">플로깅으로 여름방학을 뜻깊게 보내볼까요?</a></li>
	<li id = "ae"><a href="https://blog.naver.com/baekjeun/222452172788">나를 웃음짓게 하는 것은 같은 이상을 실천하는 사람이 있을때</a></li>
</ul>
<table>
<div class="down"></div>
   <div  class="dbutton1" type="button" value="메인" name="main" onClick="location.href='Main.jsp'">메인</div>
   <div class="dbutton2" type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'">조회</div>
   <div class="dbutton3" type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'">후기</div>
   <div class="dbutton4" type="button" value="게시판" name="board" onClick="location.href='Board.jsp'">게시판</div>
   <div class="dbutton5" type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'">제보</div>

</table>
</body>
</html>