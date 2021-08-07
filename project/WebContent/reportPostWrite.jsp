<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
jQuery(document).ready(function($) {
	var target_id = "input-file"; $("#" + target_id).bind('change', function() {
	selectFile(this.files, target_id); }); }); // 파일 선택시
	function selectFile(fileObject, target_id) { var files = null; var totalFileSize = 0; // 직접 파일 등록시
	files = jQuery('#' + target_id)[0].files; // 다중파일 등록
	if (files != null) { for (var i = 0; i < files.length; i++) { // 파일 이름
		var fileName = files[i].name; var fileNameArr = fileName.split("\."); // 확장자
		var ext = fileNameArr[fileNameArr.length - 1]; var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
		console.log("fileSize="+fileSize); if (fileSize <= 0) { console.log("0kb file return"); return; } var fileSizeKb = fileSize / 1024; // 파일 사이즈(단위 :kb)
		var fileSizeMb = fileSizeKb / 1024; // 파일 사이즈(단위 :Mb)
		var fileSizeStr = ""; if ((1024*1024) <= fileSize) { // 파일 용량이 1메가 이상인 경우
			console.log("fileSizeMb="+fileSizeMb.toFixed(2)); fileSizeStr = fileSizeMb.toFixed(2) + " Mb"; } else if ((1024) <= fileSize) { console.log("fileSizeKb="+parseInt(fileSizeKb)); fileSizeStr = parseInt(fileSizeKb) + " kb"; } else { console.log("fileSize="+parseInt(fileSize)); fileSizeStr = parseInt(fileSize) + " byte"; } // 업로드 파일 목록 생성
			jQuery("#target_file_wrap").find('span').html('첨부파일 : ' + fileName + ' (' + fileSizeStr + ')'); } } else { alert("ERROR"); } }

	</script>
	<script>
	// html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });

	</script>
<link rel="stylesheet" href="report.css?after">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style = "background-color: #dadbdb";>


<%
	memberDTO info = (memberDTO)session.getAttribute("info");   
%>
<div>
    <ul style="list-style: none;">
        <li class="menu" >
            <a><div class="topicon">채팅방</div></a>
            <ul class="hide" style="list-style: none;">
                <li><div class="topicon">채팅방1</div></li>
                <li><div class="topicon">채팅방2</div></li>
                <li><div class="topicon">채팅방3</div></li>
            </ul>
        </li>
    </ul>
</div>
      <table class="mtable1" >
         <tr>
            <td style="text-align:left;"><h2 >제보하기</h2></td>
			<td align="right">
			<input type="submit" class="topicon" value="등록"></td>
         </tr>
      </table>
   </div>
		<form action="reportPostServiceCon" method="post" enctype = "multipart/form-data">
			<table class="mtable1" >
				<tr >
					<td colspan="4"><input type="text" class="ltex" placeholder="제목"
						name="title"></td>
				</tr>
				<tr >
					<td align="left">
					<input type="file" id="input-file" name="fileName">
					</label>
					<div id="target_file_wrap">
					<a href="#" onclick="jQuery('#input-file').click()" class="btn btn-primary">사진</a>
					<span></span>
					</div>
					</td>
					<td align="right">
					<a href="inputAddress.jsp" target="_blank"><img
							src="Map.png"  height="100" ></a>
<%
 	request.setCharacterEncoding("EUC-KR");

	 String lat = request.getParameter("lat");
	 String lng = request.getParameter("lng");
	 String addr = request.getParameter("addr");
	 System.out.println("latdd : " + lat);
	 System.out.println("lngdd :" + lng);
 %>
			  <input type="hidden" name="lat" id="lat">
			  <input type="hidden" name="lng" id="lng">
			  <input type="hidden" name="addr" id="addr">
			   </td>
				</tr>
				<tr>
					<td align="center" colspan="4"><textarea  name="content" placeholder="내용"></textarea></td>
				</tr>
			</table >
			<br>
			<br><br><br><br>			
		</form>
		<div class="down"></div>
			<div class="dbutton1">메인</div>
			<div class="dbutton2">조회</div>
			<div class="dbutton3">후기</div>
			<div class="dbutton4">게시판</div>
			<div class="dbutton5">제보</div>
			
			
	<script>
	 <%if(lat!=null){%>
     document.getElementById('lat').value = "<%=lat%>";
     document.getElementById('lng').value = "<%=lng%>";
     document.getElementById('addr').value = "<%=addr%>";
  <%}%>	</script>
</body>
</html>