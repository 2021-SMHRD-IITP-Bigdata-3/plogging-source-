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
   }
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
            background: rgba(0, 0, 0, 0.7);
        }

        .hide_sidemenu {
            display: none;
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
 
</table>
</body>
</html>