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
    width: 360px;
    border: 1px solid #444444;
         }
   tr , td{
    border: 1px solid #444444;
    padding: 10px;
   }body{
margin: 0px;
padding: 0px; 
} 


#wrapper{
border: 1px solid #FFBB00;

position: absolute;
top: 10px;
left: 50%;
margin-left: -538px;
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
<table >
<tr>
   <td>싸이트명</td>
   <td ><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
   <td style = "float : right"><input type ="button" value = "검색"></td>
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
      <% } %>
   <td><input type ="button" value = "회원가입" onClick="location.href='Join.jsp'"></td>
</tr>
</table>

<br><br><br><br><br>

<!-- 실험을 위해 테이블 빼둠 -->

<br><br><br><br>
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