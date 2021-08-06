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
   text-align: left;
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

.header{
	width:100%
}

.Itable{
	background-color:#BDBDBD
    padding: 10px;
}
textarea {
	 border: 0;
	margin: 0 auto;
	width:50%;
	height: 500px;
	outline: none;
	resize: none;
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
   font-size: 30px;
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

  #value{
    border: none;
    background: #E0D3B6;
    padding: 6px;
    font-size: 18px;
    width: 80%;
    border-radius: 6px;
    color: white;
  }
  #value:focus{
    outline: none;
  }
  .container{
    background: #FFFFF5;
    padding: 1%;
  }
  .item{
    margin: 3% 0px;
    display: flex;
    align-items: center;
  }
  #iconee{
  	font-size:2.5em;
  	width:900px;
  	margin:0px 0px 0px 0px;
  }
  #value{
    width: 1000px;
    height: 53px
  }
  #value::placeholder{
  	font-size : 1em;
  }
  #input{
  	float :right;
  	font-size:2em;
  	margin:-19px 41px -15px 0px;
  	}
</style>
</head>
<body>
<%
	memberDTO info = (memberDTO)session.getAttribute("info");
	ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
	notice_BoardDAO dao = new notice_BoardDAO();
	array = dao.showBoard(info.getMemberId());
	
	//��û�� ���̵� ����
%>
   <div>
      <table align="center" >
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="float: right"><input type="button" class="topicon" value="������"
               onClick="location.href='myPage.jsp'"></td>
         </tr>
      </table>
   </div>
<br><br><br><br><br>

<form action = "inquiryServiceCon" method ="post">
<table align="center" >
	<tr>
		<td>
		<div class="searchbox">
           <div class="header">
             <div>Search</div>
             <input onkeyup="filter()" type="text" id="value" placeholder="������ �ּ����� �Է����ּ���">
           </div>
           </div>
		</td>
		</tr>
</table>
<table align="center" >
    		<div class="container" style="display:none">
           	<%for(int i=0; i<array.size(); i++){ %>
           	<%if(info != null){%>
           	<tr>
    			<td class="Itable">
				<div class = "item"><span><br>
				<span id = "iconee"><%=array.get(i).getNoticeImage()%></span><br>
				<span id = "iconee" class = "name">�ּ��� :<%=array.get(i).getAddr() %></span><br>
				<span id = "iconee">�÷α� ���� :<%=array.get(i).getPlogDate()%></span><br>
				<span><input id = "iconee" type= "hidden" name = "noticeNumber" value = "<%=array.get(i).getNoticeNumber()%>"></span>
				<span id = "iconee">�÷α� ���� �ο�  :<%=array.get(i).getLimitedNumber() %></span><br>
				<span><input type = "submit" value = "����" id="input"></span></div>
			  	<td>
    		</tr>
    		</div>
			  <%}else{%>
			<tr >
    			<td class="Itable">
			   		ȸ���Բ����� �� ���� ��û�� �� �����ϴ�!
			   	<td>
    		</tr>
			  	<%} %>
			  <%}%>	
</form>
</table>
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
		<!-- �ο��� -->
	</tr>
</table> 
<br><br><br><br>
<table align="center">
<tr>
	<td><input type="button" class="dbutton" value="����" name="main" onClick="location.href='Main.jsp'"></td>
	<td><input type="button" class="dbutton" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
	<td><input type="button" class="dbutton" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"></td>
	<td><input type="button" class="dbutton" value="�Խ���" name="board" onClick="location.href='Board.jsp'"></td>
	<td><input type="button" class="dbutton" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
</tr>
</table >
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