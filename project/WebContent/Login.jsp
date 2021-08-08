<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href = "css/login.css?after" rel = "stylesheet">
</head>
<body>
<div>
     <table align="center">
         <tr>
            <td><h2>Plogging</h2></td>
         </tr>
     </table>
   </div>
<form action="loginServiceCon" method = "post">
<table  align="center">
   <tr>
      <td align="center" ><h1>Login</h1><td>
   </tr>
</table>
   <table align="center">
   <tr>
   <td>
      <div align="center">
       	 <img src = "id.png" id ="inputid">
         <input type="text" class="tex" name="id"><br>
      </div>
      </td>
   </tr>
   <tr>
      <td><div align="center">
         <img src = "password.png" id ="inputid">
         <input type="password" class="tex" name="pw"><br>
      </div></td>
   </tr>
   </table>
   <table align="center">
      <tr>
 <td align="center"><div><input class="button" type = "submit" value = "로그인"></div></td>
      </tr>
      <tr>
         <td align="center"><div><input class="button" type = "button" value = "회원가입" onClick="location.href='Join.jsp'"></div></td>
      </tr>
      <tr>
         <td align="center"><div><input class="button" type = "button" value = "아이디찾기 / 비밀번호 찾기"></div></td>
      </tr>
   </table>
</form>
<br><br><br><br>

</body>
</html>