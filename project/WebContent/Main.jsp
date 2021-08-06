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
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   table{
    width: 100%;
    border: 1px solid #444444;
         }
    tr , td{
    border: 1px solid #444444;
	padding: 10px;
	}
	body{
	margin: 0px;
	padding: 0px; 
	}
	
	
	#wrapper{
	border: 1px solid #FFBB00;
	
	position: absolute;
	top: 10px;
	left: 50%;
	margin-left: -538px;
	width : 100%
	}
	
	#contents{
	border: 1px solid #487BE1;
	float: left;
	padding: 10px;
	}
	
	#sidebar{
	border: 1px solid #487BE1;
	width:20px;
	float: left;
	padding: 10px;
	margin-left: 200px;
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
  <div id="contents">
  <td ><input type ="button" value = "채팅목록" onClick="location.href='chatChoice.jsp'"></td>
<table>\
<tr>
   <td>싸이트명</td>
   <td ><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
</tr>
<tr>
   <% if(info != null) { %>
   <td><%=info.getMemberId() %>님</td>
      <% }else { %>
   <td> 로그인해주세요 </td>
      <% } %>
   <% if(info != null) { %>
   <td><input  type ="button" value = "로그아웃" onClick="location.href='logoutServiceCon'"></td>
      <% }else { %>
   <td> <input  type ="button" value = "로그인" onClick="location.href='Login.jsp'"> </td>
   <td><input style = "float : right" type ="button" value = "회원가입" onClick="location.href='Join.jsp'"></td>
      <% } %>

</tr>
</table>
<br><br>
<table>
<tr><td><a href="https://terms.naver.com/entry.naver?docId=5138665&cid=43667&categoryId=43667">플로깅</a></td></tr>
</table>
<br>
<table>
<tr>
<td><iframe width="600" height="300" src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</td>
</tr>
</table>
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
<table>
<div id="sidebar">
   <input type="button" value="메인" name="main" onClick="location.href='Main.jsp'"><br>
   <input type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'"><br>
   <input type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'"><br>
   <input type="button" value="게시판" name="board" onClick="location.href='Board.jsp'"><br>
   <input type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'"><br>
</div>
  </div>

</div>
</table>
</body>
</html>