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
<link rel="stylesheet" href="css/check_id.css?after">
</head>
<body>
<table  align="center">
   <tr>
      <td><h2>���̵��ߺ�üũ</h2><td>
   </tr>
</table>
<table align="center">
<tr>
<td align="center" style="font-size:30px;">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("userid");
memberDAO dao = new memberDAO();
int result = dao.checkId(id);

if(result==1){
   out.print("��밡���� ���̵��Դϴ�.");

%>
</td>
<td align="center" style="font-size:30px; height:100px;">
<input type="button" class="dbutton" value="���̵� ����ϱ�" onclick="result();">
<%}else if(result==0){
   out.print("�ߺ��Ⱦ��̵��Դϴ�.");
   }else{
   out.print("���� �߻�!!(-1)");
   }
   %>
   </td>
   </tr>
   </table>
   

   
   <form action="check_id.jsp" method="post" name=wfr>
   <table align="center" >
         <tr>
            <td align="right" width="35%"><h3>���̵�</h3></td>
            <td align="center"><input type="text" style="width:200px;height:50px;font-size:30px;" class="stex3" name="userid" value="<%=id%>"></td>
   		<td><input type="submit" class="dbutton" value="�ߺ�Ȯ��"> </td>
            </td>
         </tr>
      </table>  
 
   </form>
   <table>
<div id="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>

   
<script type="text/javascript">



function result(){
   opener.document.fr.id.value=document.wfr.userid.value;
   opener.document.fr.id.readOnly=true;
   window.close();
}



</script>


</body>
</html>