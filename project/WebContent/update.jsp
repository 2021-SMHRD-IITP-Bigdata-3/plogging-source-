<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
   background-color: #efefef;
   scrollbar-width: none;
   -ms-overflow-style: none;
}

table {
   width: 360px;
}

tr, td {
   /* padding: 5px; */
   
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
   padding: 70px;
   }

a {
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

div {
   /* padding: 10px */
   margin-left: auto;
   margin-right: auto;
}

.tex {
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

.stex1 {
   width: 270px;
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

.stex2 {
   width: 220px;
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

.dbutton {
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
<%
memberDTO info = (memberDTO)session.getAttribute("info");
%>

   <div>
      <table align="center">
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="float: right"><input type="button" class="topicon" value="������"
               onClick="location.href='myPage.jsp'"></td>
            <td style="float: right"><input type="button" class="topicon" value="�˻�"></td>
         </tr>
      </table>
   </div>
   <table>
      <tr>
         <h1 align="center">ȸ�� ���� ����</h1>
      </tr>
   </table>
   
            <form action="updateServiceCon" method = "post">
            <table align="center">
               <tr>
               		<td></td>
               </tr>
               <tr>
               <td>
                  <div>
                     ������ ID : <% if(info!=null){%><span><%= info.getMemberId()%></span><%}else{ %><span>a</span><%} %>
                  </div>
                  </td>
               </tr>
               </table>
				<br>
               <table align="center">
              <tr>
              	<td>��й�ȣ�� �Է��ϼ���</td>
              </tr>
               <tr>
               <td>
                  <div>
                    <input type="password" name="pass" maxlength="20" class="tex">
                  </div>
                  </td>
               </tr>
               </table>
            <div>
               <table align="center">
               <tr>
               		<td>�̸��� �Է��ϼ���</td>
               </tr>
               <tr>
               <div>
              	 <td>
                     <input type="text" name="name" maxlength="20" class="tex">
                  </div>
                  </td>
               </tr>
               </table>
            </div>
               <table align="center">
               <tr>
               		<td>���̸� �Է��ϼ���</td>
               </tr>
               <tr>
               <td>
                  <div>
                    <input type="text" name="age" maxlength="20" class="tex">
                  </div>
                  </td>
               </tr>
               </table>
               <br>
            <div class="btn_area" align="center">
                  <input type="submit" value="���� �Ϸ�" class="button">
            </div>
            </form>
      <br>
   <br>
   <br>
   <br>

   <div>
      <table align="center">
         <tr>
   <td><input type="button" class="dbutton" value="����" name="main" onClick="location.href='Main.jsp'"></td>
   <td><input type="button" class="dbutton" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
   <td><input type="button" class="dbutton" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"></td>
   <td><input type="button" class="dbutton" value="�Խ���" name="board" onClick="location.href='Board.jsp'"></td>
   <td><input type="button" class="dbutton" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
         </tr>
      </table>
   </div>
</body>
</html>