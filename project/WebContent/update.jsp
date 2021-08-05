<%@page import="Model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   table{
    width: 360px;
    border: 1px solid #444444;
         }
   tr , td{
    border: 1px solid #444444;
    padding: 5px;
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
            <td>����Ʈ��</td>
            <td style="float: right"><input type="button" value="������ �˻�" onClick="location.href='myPage.jsp'"></td>
            <td style="float: right"><input type="button" value="�˻�"></td>
         </tr>
      </table>
   </div>


            <div>
            <form action="updateServiceCon" method = "post">
            
            <table align="center">
               <tr>
               <td>
                  <p>
                     ������ ID : <% if(info!=null){%><span><%= info.getMemberId()%></span><%}else{ %><span>a</span><%} %>
                  </p>
                  </td>
               </tr>
               </table>
            </div>
            <div>
               <table align="center">
               <tr>
               <td>
                  <p>
                     ��й�ȣ�� �Է��ϼ��� : <input type="password" name="pass" maxlength="20">
                  </p>
                  </td>
               </tr>
               </table>
            </div>
            <div>
               <table align="center">
               <tr>
               <td>
                  <p>
                     �̸��� �Է��ϼ��� : <input type="text" name="name" maxlength="20">
                  </p>
                  </td>
               </tr>
               </table>
            </div>
            <div>
               <table align="center">
               <tr>
               <td>
                  <p>
                     ���� : <input type="text" name="age" maxlength="20">
                  </p>
                  </td>
               </tr>
               </table>
            </div>
            <div>
               <table align="center">
               <tr>
               <td>
                  <p>
                     �ּ� : <input type="text" id="sample5_address" placeholder="�ּ�">
                        <input type="button" onclick="sample5_execDaumPostcode()" value = "�ּ� �˻�"><br>
                        <input type="text" id ="latlng" name ="latlng"  style="display:none" >
                        <div id="map" style="width:1px;height:1px;" ></div>
                        
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08bf3a21c48702f150d8aa74eed2e61&libraries=services"></script>
                        
                        <script>
                            var mapContainer = document.getElementById('map'), // ������ ǥ���� div
                                mapOption = {
                                    center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
                                    level: 5 // ������ Ȯ�� ����
                                };
                        
                            //������ �̸� ����
                            //var map = new daum.maps.Map(mapContainer, mapOption);
                            //�ּ�-��ǥ ��ȯ ��ü�� ����
                            var geocoder = new daum.maps.services.Geocoder();
                            
                            //��Ŀ�� �̸� ����
                            var marker = new daum.maps.Marker({
                                position: new daum.maps.LatLng(37.537187, 127.005476),
                                map: map
                            });
                        
                            function sample5_execDaumPostcode() {
                                new daum.Postcode({
                                    oncomplete: function(data) {
                                        var addr = data.address; // ���� �ּ� ����
                        
                                        // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                                        document.getElementById("sample5_address").value = addr;
                                        // �ּҷ� �� ������ �˻�
                                        geocoder.addressSearch(data.address, function(results, status) {
                                            // ���������� �˻��� �Ϸ������
                                            if (status === daum.maps.services.Status.OK) {
                        
                                                var result = results[0]; //ù��° ����� ���� Ȱ��
                        
                                                // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                                                var coords = new daum.maps.LatLng(result.y, result.x);
                                                document.getElementById("latlng").value = coords.toString();
                                                console.log(coords.toString());
                                                      
                                                // ������ �����ش�.
                                                mapContainer.style.display = "block";
                                                map.relayout();
                                                // ���� �߽��� �����Ѵ�.
                                                map.setCenter(coords);
                                                // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                                                marker.setPosition(coords)
                                            }
                                        });          
                                    }
                                }).open();
                            }
                        </script>
                     </p>   
                  </td>
               </tr>
               </table>
            </div>
            <div>
               <table align="center">
               <tr>
               <td>
                  <p>
                     �÷α� ���� : <label><input type="checkbox" name="exp"
                        value="��"> ��</label> <label><input type="checkbox"
                        name="exp" value="��"> ��</label>
                  </p>
                  </td>
               </tr>
               </table>
               
            </div>

            <div class="btn_area" align="center">
               <p>
                  <input type="submit" value="���� �Ϸ�">
            </div>
            </form>
      

   <div>
      <table align="center">
         <tr>
   <td><input type="button" value="����" name="main" onClick="location.href='Main.jsp'"></td>
   <td><input type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
   <td><input type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"></td>
   <td><input type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'"></td>
   <td><input type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
         </tr>
         <tr>
            <td>����</td>
            <td>��ȸ</td>
            <td>�ı�</td>
            <td>�Խ���</td>
            <td>����</td>
         </tr>
      </table>
   </div>
      </div>
      </div>
   </div>
</body>
</html>