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
            <td>싸이트명</td>
            <td style="float: right"><input type="button" value="내정보 검색" onClick="location.href='myPage.jsp'"></td>
            <td style="float: right"><input type="button" value="검색"></td>
         </tr>
      </table>
   </div>


            <div>
            <form action="updateServiceCon" method = "post">
            
            <table align="center">
               <tr>
               <td>
                  <p>
                     접속한 ID : <% if(info!=null){%><span><%= info.getMemberId()%></span><%}else{ %><span>a</span><%} %>
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
                     비밀번호를 입력하세요 : <input type="password" name="pass" maxlength="20">
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
                     이름을 입력하세요 : <input type="text" name="name" maxlength="20">
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
                     나이 : <input type="text" name="age" maxlength="20">
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
                     주소 : <input type="text" id="sample5_address" placeholder="주소">
                        <input type="button" onclick="sample5_execDaumPostcode()" value = "주소 검색"><br>
                        <input type="text" id ="latlng" name ="latlng"  style="display:none" >
                        <div id="map" style="width:1px;height:1px;" ></div>
                        
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08bf3a21c48702f150d8aa74eed2e61&libraries=services"></script>
                        
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
                                                document.getElementById("latlng").value = coords.toString();
                                                console.log(coords.toString());
                                                      
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
                     플로깅 여부 : <label><input type="checkbox" name="exp"
                        value="유"> 유</label> <label><input type="checkbox"
                        name="exp" value="무"> 무</label>
                  </p>
                  </td>
               </tr>
               </table>
               
            </div>

            <div class="btn_area" align="center">
               <p>
                  <input type="submit" value="수정 완료">
            </div>
            </form>
      

   <div>
      <table align="center">
         <tr>
   <td><input type="button" value="메인" name="main" onClick="location.href='Main.jsp'"></td>
   <td><input type="button" value="조회" name="inquiry" onClick="location.href='inquiryMain.jsp'"></td>
   <td><input type="button" value="후기" name="review" onClick="location.href='reviewMain.jsp'"></td>
   <td><input type="button" value="게시판" name="board" onClick="location.href='Board.jsp'"></td>
   <td><input type="button" value="제보" name="report" onClick="location.href='reportPostWrite.jsp'"></td>
         </tr>
         <tr>
            <td>메인</td>
            <td>조회</td>
            <td>후기</td>
            <td>게시판</td>
            <td>제보</td>
         </tr>
      </table>
   </div>
      </div>
      </div>
   </div>
</body>
</html>