
<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    // html dom �� �� �ε��� �� ����ȴ�.
    $(document).ready(function(){
        // menu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu �� ȭ��� ���϶��� ���� ������� ���� �ƴϸ� �Ʒ��� ������� ��ġ��
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/15d6ad4059.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/Main.css?after">
</head>
<body>
<%
	memberDTO info = (memberDTO)session.getAttribute("info");   
	if (info!=null){
		double memberLat = info.getMemberLat();
		double memberLng = info.getMemberLng();
		System.out.println("(������������ ������� ������ �� �Ѿ������) memberLat : "+ memberLat);
		System.out.println("(������������ ������� �浵�� �� �Ѿ������) memberLng : "+ memberLng);
	}
	// �������� ����
	notice_BoardDAO dao = new notice_BoardDAO();
	
   	// ���� ������ - �÷α� ���� ���� ����� ����
//	int cnt = dao.plogDateUpdate();
//	if(cnt>0) {
//		System.out.println("�÷α� ���� ���� ����");
//	}else {System.out.println("�÷α� ���� ���� ����");
//	}
	
	// ���� ä�ù� ����Ʈ (��ȸ���� '����' Ŭ���� ���)
	ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
	if (info!=null){
		array = dao.showMyChatroom(info.getMemberId());
		for(int i =0; i<array.size(); i++){
			System.out.println(" ä�ù� ��ȣ  : " + array.get(i).getNoticeNumber() );
		}
	} 
%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    // html dom �� �� �ε��� �� ����ȴ�.
    $(document).ready(function(){
        // menu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu �� ȭ��� ���϶��� ���� ������� ���� �ƴϸ� �Ʒ��� ������� ��ġ��
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
<div float=right>
   <div>
      <div>
	    <ul style="list-style: none; ">
	        <li class="menu" >
	            <a><div class="topicon" >ä�ù�</div></a>
	            <ul class="hide" style="list-style: none;">
					<% if(info != null) { %>
						<% for(int i=0; i<array.size(); i++){ %>
		                <li><input type="topicon" value="<%=array.get(i).getNoticeNumber()%>�� ����" name="chat"onClick="location.href='chatTest.jsp?noticeNumber=<%=array.get(i).getNoticeNumber()%>'"></li>
							<%}%>
					<%}%>		
	            </ul>
	        </li>
	    </ul>
       </div>
    </div>
</div>

<table>
	<tr>
	   <td id ="title" style = "width:124px;">plogging</td>
	      <% if(info != null) { %>
	   <td><input  type ="button" value = "�α׾ƿ�" onClick="location.href='logoutServiceCon'"></td>
	   <td><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
	      <% }else { %>
	   <td > <a id = "myimport" onClick="location.href='Login.jsp'"><img id='login' src= "login.png" style ="width:67px; margin:10px 10px 0px 10px;" >�α���</a> </td>
      <% } %>
	   
	</tr>
</table>


<table style="float: right" >
	<tr>
		<td>
    <ul style="list-style: none; ">
        <li class="menu" >
            <a><div class="topicon" >ä�ù�</div></a>
            <ul class="hide" style="list-style: none; padding-left:0px;">
                <li><div class="topicon">ä�ù�1</div></li>
                <li><div class="topicon">ä�ù�2</div></li>
                <li><div class="topicon">ä�ù�3</div></li>
            </ul>
        </li>
    </ul>
    	</td>
    </tr>
</table>
<br><br>
<table>
<tr><td><a href="https://terms.naver.com/entry.naver?docId=5138665&cid=43667&categoryId=43667">�÷α�</a></td></tr>
</table>


<br>
<table>
<tr>
<td><iframe src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</td>
</tr>
</table>
<br>
<ul>
	<div id ="cafe" style ="padding: 15px 1px 5px 58px width:1012px margin-left:-50px"><th>�÷α��̶�?</th></div>
	<li id = "ae"><a href="https://blog.naver.com/happyhouse2u/222359846153">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı�</a></li>
	<li id = "ae"><a href="https://post.naver.com/viewer/postView.naver?volumeNo=31743685&memberNo=25324157&vType=VERTICAL">���� � Ʈ����� '�÷α�' �ǰ��� ȯ�� ��� ��Ű��!</a></li>
	<li id = "ae"><a href="https://blog.naver.com/sku-cast/222439716410">�÷α����� ���������� ���� ���������?</a></li>
	<li id = "ae"><a href="https://blog.naver.com/baekjeun/222452172788">���� �������� �ϴ� ���� ���� �̻��� ��õ�ϴ� ����� ������</a></li>
</ul>
<table>
<div class="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>
</body>
</html>