<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
jQuery(document).ready(function($) {
	var target_id = "input-file"; $("#" + target_id).bind('change', function() {
	selectFile(this.files, target_id); }); }); // ���� ���ý�
	function selectFile(fileObject, target_id) { var files = null; var totalFileSize = 0; // ���� ���� ��Ͻ�
	files = jQuery('#' + target_id)[0].files; // �������� ���
	if (files != null) { for (var i = 0; i < files.length; i++) { // ���� �̸�
		var fileName = files[i].name; var fileNameArr = fileName.split("\."); // Ȯ����
		var ext = fileNameArr[fileNameArr.length - 1]; var fileSize = files[i].size; // ���� ������(���� :byte)
		console.log("fileSize="+fileSize); if (fileSize <= 0) { console.log("0kb file return"); return; } var fileSizeKb = fileSize / 1024; 
		var fileSizeMb = fileSizeKb / 1024;
		var fileSizeStr = ""; if ((1024*1024) <= fileSize) { // ���� �뷮�� 1�ް� �̻��� ���
			console.log("fileSizeMb="+fileSizeMb.toFixed(2)); fileSizeStr = fileSizeMb.toFixed(2) + " Mb"; } else if ((1024) <= fileSize) { console.log("fileSizeKb="+parseInt(fileSizeKb)); fileSizeStr = parseInt(fileSizeKb) + " kb"; } else { console.log("fileSize="+parseInt(fileSize)); fileSizeStr = parseInt(fileSize) + " byte"; } // ���ε� ���� ��� ����
			jQuery("#target_file_wrap").find('span').html('÷������ : ' + fileName + ' (' + fileSizeStr + ')'); } } else { alert("ERROR"); } }
</script>
<link rel = "stylesheet" href="BoardWrite9.css?after">
</head>
<body style = "background-color: #dadbdb">
<%
memberDTO info = (memberDTO)session.getAttribute("info");
 %>
<div>
   <table class="mtable1" >
   <tr>
      <td>����Ʈ��</td>
      <td style = "float : right"><input type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'"></td>
      <td style = "float : right"><input type ="button" value = "�˻�"></td>
   </tr>
   </table>
   <form action = "BoardServiceCon" method = "post"  >
      <table border = "1px" class="mtable1" >
         <tr>
            <td colspan = "8" ><input type = "text" placeholder="����" name="title" class="ltex"></td>
         </tr>
         <tr>
         <td colspan = "8" >�ۼ��� : <%if(info!=null){%><span><%=info.getMemberId() %></span><%}else{ %><span name="name"  >�͸�</span><%} %></span></td>
         </tr>
         <tr>
         <td colspan = "4" align="left" ><input type = "file"  name = "fileName" id="input-file"></td>
           <td colspan = "4" align = "center" ><input type = "submit" value = "�۾��� �Ϸ�" class="topicon"></td>		
         </tr>
         <tr>
            <td align="center" colspan="8"><textarea  name="textarea" placeholder="����"></textarea></td>
         </tr>
      </table>
      </form>
      
   	<div class="down"></div>
			<div class="dbutton1" onClick="location.href='Main.jsp'">����</div>
			<div class="dbutton2" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
			<div class="dbutton3" onClick="location.href='reviewMain.jsp'">�ı�</div>
			<div class="dbutton4" onClick="location.href='Board.jsp'">�Խ���</div>
			<div class="dbutton5" onClick="location.href='reportPostWrite.jsp'">����</div>
   
</div>

</body>
</html>