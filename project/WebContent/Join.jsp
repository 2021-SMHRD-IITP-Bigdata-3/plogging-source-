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
    
        // 회원가입 화면의 입력값들을 검사한다.
        function checkid()
        {
            var form = document.userInfo;
        
            if(fr.id.value){
                alert("아이디를 입력하세요.");
                form.id.focus();
            }else{
            window.open("IdCheckForm.jsp?id=" + fr.id.value,"id check","toolbar=no, width=1350, height=1450, top=1450, left=1450")
           }
        }
        // 취소 버튼 클릭시 첫화면으로 이동
        function goFirstForm() {
            location.href="Main.jsp";
        }    
        function winopen(){
           //새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
           //1. 아이디가 없으면 알림창과 진행x
           if(document.fr.id.value =="" || document.fr.id.value.length < 0){
              alert("아이디를 먼저 입력해주세요")
              document.fr.id.focus();
           }else{
              //2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
              //자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
              window.open("check_id.jsp?userid="+document.fr.id.value,"","width=500, height=300");
           }
        }
        function pwcheck(){
            
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 2 || pw.length>6){
                window.alert('비밀번호는 2글자 이상, 6글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다. 입력해주세요.')
                document.getElementById('pw').value='';
                document.getElementById('pw2').value='';
                
                           }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
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

            <td style="float: right"><input type="button" class="topicon" value="검색"></td>
         </tr>
      </table>
   </div>

   <table>
      <tr>
         <h1 align="center">회원가입</h1>
      </tr>
   </table>

   <form action="joinServiceCon" method="post" name="fr">
      <table align="center">
         <tr>
            <td>아이디</td>
         </tr>
         <tr>
            <td>
               <div>
                  <input type="text" name="id" maxlength="50" class="stex2">
               </div>
            </td>
            <td>
               <div>
                  <input type="button" value="중복확인" class="dbutton" onclick="winopen()">
               </div>

            </td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>비밀번호</td>
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
            <td>비밀번호 확인 &nbsp;<span id="check"></span></td>
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
            <td>이름</td>
         </tr>
         <tr>
            <td><input type="text" name="name" maxlength="20" class="tex">
            </td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>나이</td>
         </tr>
         <tr>
            <td><input type="text" name="age" maxlength="20" class="tex">
            </td>
         </tr>
      </table>
      <table align="center">
         <tr>
            <td>주소</td>
         </tr>
         <tr>
            <td><input type="text" id="sample5_address" placeholder="주소" class="stex2">
            	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="topicon"><br>
               <input type="text" id="latlng" name="latlng" style="display: none">
               <input type="text" id="lat" name="lat" style="display: none">
               <input type="text" id="lng" name="lng" style="display: none">
               <div id="map" style="width: 1px; height: 1px;"></div>
               <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
               <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08bf3a21c48702f150d8aa74eed2e61&libraries=services"></script>

               <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                mapOption = {
                                    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                    level: 5 // 지도의 확대 레벨
                                };
                        
                            //지도를 미리 생성
                            //var map = new daum.maps.Map(mapContainer, mapOption);
                            //주소-좌표 변환 객체를 생성
                            var geocoder = new daum.maps.services.Geocoder();
                            
                            //마커를 미리 생성
                            var marker = new daum.maps.Marker({
                                position: new daum.maps.LatLng(37.537187, 127.005476),
                                map: map
                            });
                        
                            function sample5_execDaumPostcode() {
                                new daum.Postcode({
                                    oncomplete: function(data) {
                                        var addr = data.address; // 최종 주소 변수
                        
                                        // 주소 정보를 해당 필드에 넣는다.
                                        document.getElementById("sample5_address").value = addr;
                                        // 주소로 상세 정보를 검색
                                        geocoder.addressSearch(data.address, function(results, status) {
                                            // 정상적으로 검색이 완료됐으면
                                            if (status === daum.maps.services.Status.OK) {
                        
                                                var result = results[0]; //첫번째 결과의 값을 활용
                        
                                                // 해당 주소에 대한 좌표를 받아서
                                                var coords = new daum.maps.LatLng(result.y, result.x);
                                                // (coords 자체는 (위도, 경도) 형태로 나옴)
                                                document.getElementById("latlng").value = coords.toString();
                                                document.getElementById("lat").value = coords.getLat().toString();
                                                document.getElementById("lng").value = coords.getLng().toString();
                                                console.log(coords.toString());
                                                console.log(coords.coords.getLat().toString());
                                                console.log(coords.coords.getLng().toString());
                                 
                                                // 지도를 보여준다.
                                                mapContainer.style.display = "block";
                                                map.relayout();
                                                // 지도 중심을 변경한다.
                                                map.setCenter(coords);
                                                // 마커를 결과값으로 받은 위치로 옮긴다.
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
            <td>플로깅 여부</td>
         </tr>
         <tr>
            <td><label><input type="radio" name="exp" value="유">
                  유</label> <label><input type="radio" name="exp" value="무">
                  무</label></td>
         </tr>
      </table>
      <div class="btn_area" align="center">
         <p>
            <input type="submit" value="가입하기" class="button">
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
            <td><input type="button" value="메인" name="main" onClick="location.href='Main.jsp'"></td>
            <td><input type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
            <td><input type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'"></td>
            <td><input type="button" value="게시판" name="board" onClick="location.href='Board.jsp'"></td>
            <td><input type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
=======
            <td><input type="button" class="dbutton" value="메인" name="main"
               onClick="location.href='Main.jsp'"></td>
            <td><input type="button" class="dbutton" value="조회" name="inquiry"
               onClick="location.href='inquiryMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="후기" name="review"
               onClick="location.href='reviewMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="게시판" name="board"
               onClick="location.href='Board.jsp'"></td>
            <td><input type="button" class="dbutton" value="제보" name="report"
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