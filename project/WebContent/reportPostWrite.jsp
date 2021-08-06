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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   body{
    background-color: #dadbdb;
   /* scrollbar-width: none;
    -ms-overflow-style: none; */
  
   }
   table {
    
   }
   .mtable1{
   width: 100%;

        }
      .mtable2{
   width: 100%;

         }
   tr , td{
      /* padding: 5px; */
     
   }
   .htd{

   }

   h1{
   padding: 100px 130px;
   
   }
   
   h2{
   font-size: 50px;
   padding: 0px 30px;
   }

.tex {
   width: 310px;
   height: 50px;
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
.ltex{
   width: 100%;
   box-sizing : border-box;
   height: 100px;
   border: none;
   padding: 20px;
   /* text-align: center; */
   text-decoration: none;
   display: inline-block;
   font-size: 30px;

   /* border-radius: 12px; */

}
textarea {
    border: 0;
   margin: 0 auto;
   width:100%;
   height: 1000px;
   text-decoration: none;
   outline: none;
   resize: none;
   font-size: 30px;
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
   background-color: #88dba3;
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
.topicon {
   background-color: #88dba3;
   border: none;
   color: white;
   padding: 30px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 30px;
   margin: 4px 2px;
   box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
   border-radius: 15px;

   
}

.dbutton1{
  position: fixed;
  bottom: 40px;
  left: 5%;
  border: none;
  border-radius: 16px;
  background: #88dba3;
  color: white;
  padding: 30px;
  font-weight: bold;
  font-size: 30px;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton2{
  position: fixed;
  bottom: 40px;
  left: 25%;
  border: none;
  border-radius: 16px;
  background: #88dba3;
  color: white;
  padding: 30px;
  font-weight: bold;
  font-size: 30px;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton3{
  position: fixed;
  bottom: 40px;
  left: 45%;
  border: none;
  border-radius: 16px;
  background: #88dba3;
  color: white;
  padding: 30px;
  font-weight: bold;
  font-size: 30px;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton4{
  position: fixed;
  bottom: 40px;
  left: 65%;
  border: none;
  border-radius: 16px;
  background: #88dba3;
  color: white;
  padding: 30px;
  font-weight: bold;
  font-size: 30px;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.dbutton5{
  position: fixed;
  bottom: 40px;
  left: 85%;
  border: none;
  border-radius: 16px;
  background: #88dba3;
  color: white;
  padding: 30px;
  font-weight: bold;
  font-size: 30px;
  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
  cursor: pointer;
}
.down{
position: fixed;
bottom: 0px;
left:0px;
width:100%;
height:10%;
background: #3ac569;
}

label {
font-family: "Noto Sans KR", \"Noto Sans KR\";
font-size: 16px;
font-weight: 400;
line-height: 1.5em;
}

.btn {
display: inline-block;
margin-bottom: 0;
font-weight: normal;
text-align: center;
vertical-align: middle;
-ms-touch-action: manipulation;
touch-action: manipulation;
cursor: pointer;
background-image: none;
border: 1px solid transparent;
white-space: nowrap;
padding: 6px 12px;
font-size: 14px;
line-height: 1.42857143;
border-radius: 4px;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none; }

.btn-primary {
   background-color: #88dba3;
   border: none;
   color: white;
   padding: 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 30px;
   margin: 4px 2px;
   box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
   border-radius: 15px;
   
}
#input-file {
display:none;
}
span{
font-size: 30px;

}
</style>
</head>
<body>


<%
   memberDTO info = (memberDTO)session.getAttribute("info");   
%>

   <div >
      <table  class="mtable1">


   <div>
      <table class="mtable1" >
         <tr>
            <td style="text-align:left;"><h2 >제보하기</h2></td>
         <td align="right">
         <input type="submit" class="topicon" value="등록"></td>
         </tr>
      </table>
   </div>
      <form action="reportPostServiceCon" method="post" enctype = "multipart/form-data">
         <table class="mtable2" >
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
  <%}%>   </script>
</body>
</html>