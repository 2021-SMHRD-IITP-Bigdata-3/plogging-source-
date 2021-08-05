<%@page import="Model.memberDAO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
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
.stex3 {
   width: 200px;
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
<table  align="center">
   <tr>
      <td><h1>아이디중복체크</h1><td>
   </tr>
</table>
<table align="center">
<tr>
<td>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("userid");
memberDAO dao = new memberDAO();
int result = dao.checkId(id);

if(result==1){
   out.print("사용가능한 아이디입니다.");

%>
</td>
<td>
<input type="button" class="dbutton" value="아이디 사용하기" onclick="result();">
<%}else if(result==0){
   out.print("중복된아이디입니다.");
   }else{
   out.print("에러 발생!!(-1)");
   }
   %>
   </td>
   </tr>
   </table>
   <form action="check_id.jsp" method="post" name=wfr>
   <table align="center" >
   	<tr>
   		<td>아이디</td>
   	</tr>
   	<tr>
   		<td><input type="text" class="stex3" name="userid" value="<%=id%>"></td>
   		<td><input type="submit" class="dbutton" value="중복확인"> </td>
   	
   	</tr>
   </table>
   </form>

   
<script type="text/javascript">



function result(){
   opener.document.fr.id.value=document.wfr.userid.value;
   opener.document.fr.id.readOnly=true;
   window.close();
}



</script>


</body>
</html>