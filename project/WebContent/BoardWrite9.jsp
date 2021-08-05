<%@page import="Model.memberDTO"%>
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
    padding: 5px;
   }
   textarea {
      width: 320px;
      height: 300px;
    }   

</style>
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");
 %>
<div>
   <table>
   <tr>
      <td>싸이트명</td>
      <td style = "float : right"><input type ="button" value = "내정보 검색" onClick="location.href='myPage.jsp'"></td>
      <td style = "float : right"><input type ="button" value = "검색"></td>
   </tr>
   </table>
   <form action = "BoardServiceCon" method = "post" >
      <table border = "1px" >
         <tr>
            <td colspan = "8">
               제목<input type = "text" placeholder = "제목을 입력하세요." name="title" >
            </td>
         </tr>
         <tr>
         <td><span name="memberId">작성자 : <%if(info!=null){%><%=info.getMemberId() %><%}else{ %>a<%} %></span></td>
         </tr>
         <tr>
            <td colspan = "4">업로드 <input type = "file" name = "fileName"></td>
         </tr>
         <tr>
            <td colspan = "4">
               <textarea rows="5" cols="50" name="textarea"></textarea>   
            </td>
         </tr>
         <tr>
            <td colspan = "4" align = "center" >
                <input type = "submit" value = "글쓰기 완료">
            </td>
         </tr>
      </table>
      </form>
      
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
   
</div>

</body>
</html>