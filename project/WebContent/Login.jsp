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
   table{
    width: 360px;

         }
   tr , td{
    padding: 5px;
   }
   .topicon{
   background-color: #2DB400;
  width: 70px;
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
   padding: 100px 130px;
   }
   h2{
      
   }
   a{
  width: 330px;
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
   margin-left: auto; margin-right: auto;
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
<table>
   <tr>
      <td><h2>Plogging</h2></td>
      <td style = "float : right"><input  type ="button" class="topicon" value = "내정보" onClick="location.href='myPage.jsp'"></td>
      <td style = "float : right"><input type ="button" class="topicon" value = "검색"></td>
   </tr>
   </table>
<form action="loginServiceCon" method = "post">
<table>
   <tr>
      <h1>Login</h1>
   </tr>
</table>

   <table>
   <tr>
      <a> 아이디 </a>
   </tr>
   <tr>
      <div>
         <input type="text" class="tex" name="id"><br>
      </div>
   </tr>
   <tr>
   <tr>
      <a> 비밀번호 </a>
   </tr>
      <div>
         <input type="password" class="tex" name="pw"><br>
      </div>   
   </tr>
   </table>
   <table>
      <tr>
 <td><div><input class="button" type = "submit" value = "로그인"></div></td>
      </tr>
      <tr>
         <td><div><input class="button" type = "button" value = "회원가입" onClick="location.href='Join.jsp'"></div></td>
      </tr>
      <tr>
         <td><div><input class="button" type = "button" value = "아이디찾기 / 비밀번호 찾기"></div></td>
      </tr>
   </table>
</form>
<br><br><br><br>
   <table>
   <tr>
 <td><input type="button" class="dbutton" value="메인" name="main" onClick="location.href='Main.jsp'"></td>
      <td><input type="button" class="dbutton" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
      <td><input type="button" class="dbutton" value="후기" name="review" onClick="location.href='reviewMain.jsp'"></td>
      <td><input type="button" class="dbutton" value="게시판" name="board" onClick="location.href='Board.jsp'"></td>
      <td><input type="button" class="dbutton" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
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