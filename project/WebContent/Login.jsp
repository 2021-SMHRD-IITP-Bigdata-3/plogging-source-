<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   body{
    background-color: #efefef;
   scrollbar-width: none;
    -ms-overflow-style: none;
   }
   table {
   width: 380px;
  /* border:2px solid #444444; */
}
   tr , td{
   /* padding: 5px; */
   /* border:2px solid #444444; */
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
   h1{
   padding: 50px;
   }
   h2{
   }
   a{
  border: none;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 12px;
   }
   div{
   padding: 10px
   }
   .tex{
    width: 330px;
    height: 25px;
    margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
    }
  .button {
  background-color: #2DB400;
  width: 330px;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 12px;
}
   .dbutton{
  background-color: #2DB400;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 12px;
   }

</style>
</head>
<body>
<div>
     <table align="center">
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="float: right"><input type="button" class="topicon" value="검색"></td>
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
      <td align="center"><a> 아이디 </a></td>
   </tr>
   <tr>
   <td>
      <div align="center">
         <input type="text" class="tex" name="id"><br>
      </div>
      </td>
   </tr>
   <tr>
   <tr>
      <td align="center"><a> 비밀번호 </a></td>
   </tr>
      <td><div align="center">
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