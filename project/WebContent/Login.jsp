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
      <td style = "float : right"><input  type ="button" class="topicon" value = "������" onClick="location.href='myPage.jsp'"></td>
      <td style = "float : right"><input type ="button" class="topicon" value = "�˻�"></td>
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
      <a> ���̵� </a>
   </tr>
   <tr>
      <div>
         <input type="text" class="tex" name="id"><br>
      </div>
   </tr>
   <tr>
   <tr>
      <a> ��й�ȣ </a>
   </tr>
      <div>
         <input type="password" class="tex" name="pw"><br>
      </div>   
   </tr>
   </table>
   <table>
      <tr>
 <td><div><input class="button" type = "submit" value = "�α���"></div></td>
      </tr>
      <tr>
         <td><div><input class="button" type = "button" value = "ȸ������" onClick="location.href='Join.jsp'"></div></td>
      </tr>
      <tr>
         <td><div><input class="button" type = "button" value = "���̵�ã�� / ��й�ȣ ã��"></div></td>
      </tr>
   </table>
</form>
<br><br><br><br>
   <table>
   <tr>
 <td><input type="button" class="dbutton" value="����" name="main" onClick="location.href='Main.jsp'"></td>
      <td><input type="button" class="dbutton" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
      <td><input type="button" class="dbutton" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"></td>
      <td><input type="button" class="dbutton" value="�Խ���" name="board" onClick="location.href='Board.jsp'"></td>
      <td><input type="button" class="dbutton" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
   </tr>

<tr>
   <td>����</td>
   <td>��ȸ</td>
   <td>�ı�</td>
   <td>�Խ���</td>
   <td>����</td>
</tr>
</table>
</body>
</html>