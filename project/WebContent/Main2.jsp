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
<style>
.side-menu {
            top: 50px;
            width: 45px;
            z-index: 10;
            background: #ff5858;
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
            margin: 0px 0px 0px 8px;
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
            width: 200px;
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
.topicon {
   background-color: #2DB400;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 15px;
}
table{
	width: 100%;

}
td{

}
</style>
</head>
<body>
<%
   memberDTO info = (memberDTO)session.getAttribute("info");   
   ArrayList<notice_BoardDTO> n_list = new ArrayList<notice_BoardDTO>();
   if (info!=null){
	  double memberLat = info.getMemberLat();
	  double memberLng = info.getMemberLng();
      System.out.println("(메인페이지에 사용자의 위도가 잘 넘어오는지) memberLat : "+ memberLat);
      System.out.println("(메인페이지에 사용자의 경도가 잘 넘어오는지) memberLng : "+ memberLng);
      notice_BoardDAO n_dao = new notice_BoardDAO();
      // 우선 광주에서 목포 57, 해남 69 참고함 - 범위는 같이 얘기해서 수정하자~ => 다시 우선은 
      n_list = n_dao.match(memberLat, memberLng, 1000);
         for(int i = 0; i<n_list.size(); i++) {
            System.out.println(n_list.get(i).getNoticeNumber());
            System.out.println(n_list.get(i).getAddr());
         }
   }

%>
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
                        <li><a href="myPage.jsp" class="a001">MYPAGE</a></li>
                    </ul>
                </div>
            </div>
            <div class="overlay"></div>
        </div>
        
<div id="wrapper">
  <div id="contents">
  
<table style="padding:0 0 0 50px;">
	<tr >
   		<td colspan="2" ><h2 style="padding:0 0 0 50px;">Plogging</h2></td>
   		<td style="text-align:right;">
        <input type="button" class="topicon" value="검색">
		<input type ="button" class="topicon" value = "채팅목록" onClick="location.href='chatChoice.jsp'"></td>
	</tr>
<tr>
   <% if(info != null) { %>
   <td><%=info.getMemberId() %>님</td>
      <% }else { %>
   <td style="padding:0 0 0 50px;"> 로그인해주세요 </td>
      <% } %>
   <% if(info != null) { %>
   <td colspan="2" style="text-align:right;"><input  type ="button" class="topicon"  value = "로그아웃" onClick="location.href='logoutServiceCon'">
      <% }else { %>
   <td colspan="2" style="text-align:right;"> <input  type ="button" class="topicon" value = "로그인" onClick="location.href='Login.jsp'"> 
      <% } %>
   <input type ="button" class="topicon" value = "회원가입" onClick="location.href='Join.jsp'"></td>
</tr>
</table>


<br><br><br><br><br>

<br>
<table>
<th>뉴스기사 및 칼럼</th>
<tr>
<td><a href="https://www.news1.kr/articles/?4391799">LG헬로비전, #지구좋아산책 캠페인 진행…"플로깅 함께해요"</a></td>
</tr>
<tr>
<td><a href="https://www.etoday.co.kr/news/view/2050450">GS파워, 비대면 '플로깅' 캠페인 전개</a></td>
</tr>
<tr>
<td><a href="http://www.kbsm.net/default/index_view_page.php?idx=319697&part_idx=320">예천군 축산과, 기관단체와 환경정화 플로깅 활동</a></td>
</tr>
</table>
<br>
<table>
<th>플로깅 경험자들의 블로그 & 카페</th>
<tr>
<td><a href="https://blog.naver.com/happyhouse2u/222359846153">대세는 조깅말고 줍깅! 오산천 플로깅 후기 (오산 세교 A-7 & 오산 청학 행복주택)</a></td>
</tr>
<tr>
<td><a href="https://post.naver.com/viewer/postView.naver?volumeNo=31743685&memberNo=25324157&vType=VERTICAL">요즘 운동 트렌드는 '플로깅'?, '플로킹'? 건강과 환경 모두 지키자!</a></td>
</tr>
<tr>
<td><a href="https://blog.naver.com/sku-cast/222439716410">플로깅으로 여름방학을 뜻깊게 보내볼까요?</a></td>
</tr>
<tr>
<td><a href="https://blog.naver.com/baekjeun/222452172788">나를 웃음짓게 하는 것은 같은 이상을 실천하는 사람이 있을때</a></td>
</tr>

</table>

<!-- 실험을 위해 테이블 빼둠 -->

<br><br><br><br>
</body>
</html>