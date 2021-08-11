<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.reportTestDAO"%>
<%@page import="Model.reportTestDTO"%>
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
<style>
@font-face {
    font-family: 'netmarbleB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
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
   int cnt = dao.plogDateUpdate();
   if(cnt>0) {
      System.out.println("�÷α� ���� ���� ����");
   }else {System.out.println("�÷α� ���� ���� ����");
   }
   
   // ���� ä�ù� ��� (��ȸ���� '����' Ŭ���� ���)
   ArrayList<notice_BoardDTO> array = new ArrayList<notice_BoardDTO>();
   if (info!=null){
      array = dao.showMyChatroom(info.getMemberId());
      for(int i=0; i<array.size(); i++){
         System.out.println(" ä�ù� ��ȣ  : " + array.get(i).getNoticeNumber() );
      }
   } 
   // (����� ������ ����) ���� ���
   ArrayList<reportTestDTO> report_array = new ArrayList<reportTestDTO>();
   reportTestDAO report_dao = new reportTestDAO();
   report_array = report_dao.reportShow();
   for(int i=0; i<report_array.size(); i++){
      System.out.println(" ���� ��ȣ  : " + report_array.get(i).getReport_number());
   }
   
   
   ArrayList<reviewBoardDTO> reviewArray = new ArrayList<reviewBoardDTO>();
   reviewBoardDAO reviewDao = new reviewBoardDAO();
   reviewArray = reviewDao.showBoard();
   %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
  function openCloseToc() {
    if(document.getElementById('hide').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
    } else {
      document.getElementById('toc-content').style.display = 'block';
    }
  }
</script>
<table>
   <tr>
      <td id ="title" style = "width:124px;">plogging</td>
         <% if(info != null) { %>
      <td><input style="margin: 0px 0px 0px 238px;"  type ="button" value = "�α׾ƿ�" onClick="location.href='logoutServiceCon'"></td>
      <td>
         <ul style="list-style: none; ">
              <li class="menu" >
                  <a><div class="topicon" onclick="openCloseToc()" >ä�ù�</div></a>
                  <ul id="hide" style="display:none; list-style: none;">
                     <% if(info != null) { %>
                        <% for(int i=0; i<array.size(); i++){ %>
                        		<%int a = 80*i; %>
                            <li><div style="margin-top:<%=a %>px" value="<%=array.get(i).getNoticeNumber()%>�� ����" name="chat" onClick="location.href='chatTest.jsp?noticeNumber=<%=array.get(i).getNoticeNumber()%>'"><%=array.get(i).getNoticeNumber()%></div></li>
                           <%}%>
                     <%}%>   
                  </ul>
              </li>
          </ul>
      </td>
      <td><i class="far fa-user"  type ="button" value = "������ �˻�" onClick="location.href='myPage.jsp'" id = "myimport" ></i></td>
         <% }else { %>
      <td > <a id = "myimport" onClick="location.href='Login.jsp'"><img id='login' src= "login.png" style ="margin:10px 10px 0px 10px; width:30px;" >�α���</a> </td>
      <% } %>
   </tr>
</table>

<br>

<%if(info !=null){ %>
<form action = "reportPostWrite.jsp" method = "post">
   <h2 style = "font-size: 2em;
    text-align: center;
    margin: 70px 0px 10px 0px;
    border-bottom: 3px solid;
}">�������� �����ϰ� �÷α� �غ��°� ����?</h2>
   <div id="map" style="width:100%;height:600px;"></div>
</form>

      <div id ="cafe"><th>ȸ������ �������� �ı�</th></div>
      <table border='0px' style='height:100px;'>
            <%for(int i = 0; i<3;i++){%>

            <tr style = "border-bottom:1px">
            <td id = "membertitle"><a href = "Review8.jsp?reviewNumber=<%=reviewArray.get(i).getReviewNumber()%>"><%=reviewArray.get(i).getTitle()%></a></td>
            <td id = "ae">�ۼ��� : <%=reviewArray.get(i).getMemberId() %></td>
           </tr>
      <%} %>
      </table>
<table>
   <tr>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 0px 15px 100px;
         ">���㴺��</div></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 208px 0px 0px;
         ">���㴺��</div></td></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 95px 74px 0px 0px;
         ">���㴺��</div></td></td>
   </tr>
   <tr>
      <td><div style="
                   width: 40%;
                   margin: 0px 0px 0px 70px;
      "><a style="font-size:22px;"href="https://blog.naver.com/purity_k/222459285852">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı�</a></div></td>
      <td><div style="
                   width: 66%;
                   margin: 0px 0px 0px -25px;
      "><a style="font-size:22px;" href="https://blog.naver.com/earthactkgjn/222180131468">���� � Ʈ����� '�÷α�' �ǰ��� ȯ�� ��� ��Ű��!</a></div></td>
      <td><div style="
                   width: 82%;
                   margin: 0px 0px 0px -17px;
      "><a style="font-size:22px;"href="https://blog.naver.com/flydms/222290879041">�÷α����� ���������� ���� ���������?</a></div></td>
   </tr>
</table>
<%}else { %>
<table>
<tr>
<td><iframe src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</td>
</tr>
</table>
      <div id ="cafe"><th>ȸ������ �������� �ı�</th></div>
      <table border='0px' style='height:100px;'>
            <%for(int i = 0; i<3;i++){%>

            <tr style = "border-bottom:1px">
            <td id = "membertitle"><a href = "Review8.jsp?reviewNumber=<%=reviewArray.get(i).getReviewNumber()%>">-  <%=reviewArray.get(i).getTitle()%></a></td>
            <td id = "ae">�ۼ��� : <%=reviewArray.get(i).getMemberId() %></td>
           </tr>
      <%} %>
      </table>
<br>
<table>
   <tr>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 0px 15px 100px;
         ">���㴺��</div></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 90px 208px 0px 0px;
         ">���㴺��</div></td></td>
      <td><div id ="New" style="
          font-size: 25px;
          width: 124px;
          background: #AFE1FF;
          height: 45px;
          text-align: center;
          padding: 12px 0px 0px 0px;
          border-radius: 23px;
          margin: 95px 75px 0px 0px;
         ">���㴺��</div></td></td>
   </tr>
   <tr>
      <td><div style="
                   width: 40%;
                   margin: 0px 0px 0px 70px;
      "><a style="font-size:22px;"href="https://blog.naver.com/purity_k/222459285852">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı�</a></div></td>
      <td><div style="
                   width: 66%;
                   margin: 0px 0px 0px -25px;
      "><a style="font-size:22px;" href="https://blog.naver.com/earthactkgjn/222180131468">���� � Ʈ����� '�÷α�' �ǰ��� ȯ�� ��� ��Ű��!</a></div></td>
      <td><div style="
                   width: 82%;
                   margin: 0px 0px 0px -17px;
      "><a style="font-size:22px;"href="https://blog.naver.com/flydms/222290879041">�÷α����� ���������� ���� ���������?</a></div></td>
   </tr>
</table>
<%} %>
<br><br><br><br><br><br><br>
<table>
<div class="down"></div>
   <div  class="dbutton1" type="button" value="����" name="main" onClick="location.href='Main.jsp'">����</div>
   <div class="dbutton2" type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'">��ȸ</div>
   <div class="dbutton3" type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'">�ı�</div>
   <div class="dbutton4" type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'">�Խ���</div>
   <div class="dbutton5" type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'">����</div>
</table>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72d306962d4f7f31bb4597d71782852b&libraries=services"></script>
<script><!-- ����������-->
   <%if(info !=null){%>
      var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
      mapOption = {
            center: new kakao.maps.LatLng(<%=info.getMemberLat()%>,<%=info.getMemberLng()%>), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
      };

      //������ �����մϴ�    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
   
      // ��������
      let lat;
      let lng;
      
      <%for(int i=0; i<report_array.size();i++){%>
         // ��Ŀ�� �����մϴ�
         // ���� �� �������� Ȯ��
         lat = <%=report_array.get(i).getLat()%>;
         lng = <%=report_array.get(i).getLng()%>;
         report_number = <%=report_array.get(i).getReport_number()%>;
         console.log('lat, lng: ', lat, lng);
   
         var marker = new kakao.maps.Marker({      
            position: new kakao.maps.LatLng(lat, lng)
         // ��Ŀ�� ��ġ
         });
         
         makeMarkerDeletable(report_number, marker);
      
         marker.setMap(map);
      <%}%>
   <%}%>
   
      // '���� �� �ִ� ��Ŀ �����' �Լ� ����
   function makeMarkerDeletable(targetReportNumber, targetMarker) {

      //href="maingDelete?lat="+latlng.getLat()+"&lng="+latlng.getLng();
      //��Ŀ�� ����� �̺�Ʈ
      kakao.maps.event.addListener(targetMarker, 'click', function() {
        // ��Ŀ ���� ���������츦 ǥ���մϴ�
        var lat = targetMarker.getPosition().getLat()
        var lng = targetMarker.getPosition().getLng()
        console.log('lat : ', lat);
        console.log('lng : ', lng);
        targetMarker.setMap(null);
        
      $.ajax({
         url: "deleteReportServiceCon",
          type: 'POST',
          data:{"report_number" : targetReportNumber},
          contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
          success: function (res) {
              console.log(res);
          },
          error: function (xhr) {
              alert(xhr);
          } 
      });
      
      });
   }
</script>
</body>
</html>