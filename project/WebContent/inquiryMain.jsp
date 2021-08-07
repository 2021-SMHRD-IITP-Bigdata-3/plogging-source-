<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href = "inquiryMain.css" rel = "stylesheet">
</head>
<body>
<%
	memberDTO info = (memberDTO)session.getAttribute("info");
	ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
	notice_BoardDAO dao = new notice_BoardDAO();
	if (info!=null){
		array = dao.showBoard(info.getMemberId());
	}
	
	// 플로깅 날짜 형태 변환 (원하는 꼴로 다 수정 가능합니다~)
	System.out.println("날짜 변환 확인 : " + dao.changeDateFormat(array.get(1).getPlogDate()));
	System.out.print(array.size());

    
    
%>
   <div>
      <table align="center" >
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="float: right"><input type="button" class="topicon" value="내정보"
               onClick="location.href='myPage.jsp'"></td>
            <td style="float: right"><input type="button" class="topicon" value="검색"></td>
         </tr>
      </table>
   </div>
<br><br><br><br><br>

<table align="center" >
	<tr>
		<td>
		<div class="searchbox">
           <div class="header">
             <div>Search</div>
             <input onkeyup="filter()" type="text" id="value" placeholder="간략한 주소지를 입력해주세요">
           </div>
           </div>
		</td>
		</tr>
</table>
<table align="center" >
    		<div class="container" style="display:none">
           	<%for(int i=0; i<array.size(); i++){%>
				<%if(info != null){%>
				<form action = "chatTest.jsp">
		           	<tr>
		    			<td class="Itable">
							<div class = "item"><span><br>
							<span><%=array.get(i).getNoticeImage()%></span><br>
							<span id="iconee" class="name" name="addr">주소지 :<%=array.get(i).getAddr() %></span><br>
							<span id="iconee" name="plogDate">플로깅 기한 : <%=dao.changeDateFormat(array.get(i).getPlogDate())%></span><br>
							<span><input id = "iconee" type= "hidden" name="noticeNumber" value="<%=array.get(i).getNoticeNumber()%>"></span>
							<span id="iconee" name="limitedNumber">플로깅 제한 인원  :<%=array.get(i).getLimitedNumber() %></span><br>
							<span><%=array.get(i).getNoticeNumber()%>번 공고방</span>
							<span id = "iconee"><input type = "submit" value = "참가"></span></div>
							</div>
						<td>
		    		</tr>
		    	 </form>
    	</div>  	
				<%}else{%>
			<tr>
    			<td class="Itable">
			   		회원님께서는 이 공고를 신청할 수 없습니다!
			   	<td>
    		</tr>
		</div>
				<%}%>
			<%}%>
<br><br>
<!-- <table>
	<tr>
		<td><input type = "button" value = "<<"></td>
		<td><input type = "button" value = "1"></td>
		<td><input type = "button" value = "2"></td>
		<td><input type = "button" value = "3"></td>
		<td><input type = "button" value = "4"></td>
		<td><input type = "button" value = "5"></td>
		<td><input type = "button" value = ">>"></td>
		<!-- 인원수 -->
	</tr>
</table> 
<br><br><br><br>
		<div class="down">
			<div class="dbutton1" onClick="location.href='Main.jsp'">메인</div>
			<div class="dbutton2" onClick="location.href='inquiryMain.jsp'">조회</div>
			<div class="dbutton3" onClick="location.href='reviewMain.jsp'">후기</div>
			<div class="dbutton4" onClick="location.href='Board.jsp'">게시판</div>
			<div class="dbutton5" onClick="location.href='reportPostWrite.jsp'">제보</div>
		</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
<script>

    function filter(){
        var value, name, item, i;

        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");

        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
            item[i].style.display = "flex";
          }else{
            item[i].style.display = "none";
          }
        }
      }
    
</script>

</body>
</html>