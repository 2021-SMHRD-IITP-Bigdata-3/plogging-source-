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
<script type="text/javascript">
    
        // ȸ������ ȭ���� �Է°����� �˻��Ѵ�.
        function checkid()
        {
            var form = document.userInfo;
        
            if(fr.id.value){
                alert("���̵� �Է��ϼ���.");
                form.id.focus();
            }else{
            window.open("IdCheckForm.jsp?id=" + fr.id.value,"id check","toolbar=no, width=1350, height=1450, top=1450, left=1450")
           }
        }
        // ��� ��ư Ŭ���� ùȭ������ �̵�
        function goFirstForm() {
            location.href="Main.jsp";
        }    
        function winopen(){
           //��â�� ��� �������� ���� �� -> ȸ�����̵������� ������ �ߺ�üũ
           //1. ���̵� ������ �˸�â�� ����x
           if(document.fr.id.value =="" || document.fr.id.value.length < 0){
              alert("���̵� ���� �Է����ּ���")
              document.fr.id.focus();
           }else{
              //2. ȸ���������̵� ������ �ִ� �� üũ�Ϸ��� DB�� �����ؾ��Ѵ�.
              //�ڹٽ�ũ��Ʈ�� ��� DB�� �����ұ�? => �Ķ���ͷ� id���� �������� jsp���������� �����ϸ� �ȴ�.
              window.open("check_id.jsp?userid="+document.fr.id.value,"","width=500, height=300");
           }
        }
        function pwcheck(){
            
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 2 || pw.length>6){
                window.alert('��й�ȣ�� 2���� �̻�, 6���� ���ϸ� �̿� �����մϴ�.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% �� Ư�����ڰ� �� ���� �ʽ��ϴ�. �Է����ּ���.')
                document.getElementById('pw').value='';
                document.getElementById('pw2').value='';
                
                           }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ�մϴ�.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
   </script>
</head>
<body>
   <div>
      <table align="center">
         <tr>
            <td><h2>Plogging</h2></td>

            <td style="float: right"><input type="button" class="topicon" value="�˻�"></td>
         </tr>
      </table>
   </div>

   <table>
      <tr>
         <h1 align="center">ȸ������</h1>
      </tr>
   </table>

   <form action="joinServiceCon" method="post" name="fr">
      <table align="center">
         <tr>
            <td>���̵�</td>
         </tr>
         <tr>
            <td>
               <div>
                  <input type="text" name="id" maxlength="50" class="stex2">
               </div>
            </td>
            <td>
               <div>
                  <input type="button" value="�ߺ�Ȯ��" class="dbutton" onclick="winopen()">
               </div>

            </td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>��й�ȣ</td>
         </tr>
         <tr>
            <td>
               <div>
                  <input type="password" name="pass" maxlength="20" id="pw"
                     onchange="pwcheck()" class="tex">
               </div>
            </td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>��й�ȣ Ȯ�� &nbsp;<span id="check"></span></td>
            <td></td>
         </tr>
         <tr>
            <td><div><input type="password" name="passcheck" maxlength="20"
               id="pw2" onchange="pwcheck()" class="tex">
                </div></td>
         </tr>
         <tr>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>�̸�</td>
         </tr>
         <tr>
            <td><input type="text" name="name" maxlength="20" class="tex">
            </td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>����</td>
         </tr>
         <tr>
            <td><input type="text" name="age" maxlength="20" class="tex">
            </td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>�ּ�</td>
         </tr>
         <tr>
            <td><input type="text" id="sample5_address" placeholder="�ּ�" class="stex2">
            	<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�" class="topicon"><br>
               <input type="text" id="latlng" name="latlng" style="display: none">
               <input type="text" id="lat" name="lat" style="display: none">
               <input type="text" id="lng" name="lng" style="display: none">
               <div id="map" style="width: 1px; height: 1px;"></div>
               <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
               <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08bf3a21c48702f150d8aa74eed2e61&libraries=services"></script>

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
                                                // (coords ��ü�� (����, �浵) ���·� ����)
                                                document.getElementById("latlng").value = coords.toString();
                                                document.getElementById("lat").value = coords.getLat().toString();
                                                document.getElementById("lng").value = coords.getLng().toString();
                                                console.log(coords.toString());
                                                console.log(coords.coords.getLat().toString());
                                                console.log(coords.coords.getLng().toString());
                                 
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
                            </script></td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>�÷α� ����</td>
         </tr>
         <tr>
            <td><label><input type="radio" name="exp" value="��">
                  ��</label> <label><input type="radio" name="exp" value="��">
                  ��</label></td>
         </tr>
      </table>
      <div class="btn_area" align="center">
         <p>
            <input type="submit" value="�����ϱ�" class="button">
      </div>
   </form>
   <br>
   <br>
   <br>
   <br>
<<<<<<< HEAD

   <div>
      <table align="center">
         <tr>
<<<<<<< HEAD
            <td><input type="button" value="����" name="main" onClick="location.href='Main.jsp'"></td>
            <td><input type="button" value="��ȸ" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
            <td><input type="button" value="�ı�" name="review" onClick="location.href='reviewMain.jsp'"></td>
            <td><input type="button" value="�Խ���" name="board" onClick="location.href='Board.jsp'"></td>
            <td><input type="button" value="����" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
=======
            <td><input type="button" class="dbutton" value="����" name="main"
               onClick="location.href='Main.jsp'"></td>
            <td><input type="button" class="dbutton" value="��ȸ" name="inquiry"
               onClick="location.href='inquiryMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="�ı�" name="review"
               onClick="location.href='reviewMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="�Խ���" name="board"
               onClick="location.href='Board.jsp'"></td>
            <td><input type="button" class="dbutton" value="����" name="report"
               onClick="location.href='reportPostWrite.jsp'"></td>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
         </tr>
      </table>
   </div>
   </div>
   </div>
   </div>
=======
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-IITP-Bigdata-3/plogging-source-.git
</body>
</html>