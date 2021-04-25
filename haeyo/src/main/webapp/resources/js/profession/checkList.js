const locx = document.getElementById('locX');
const locy = document.getElementById('locY');
const startDate = document.getElementById('startDate')
const endDate = document.getElementById('endDate');

let nowDate = new Date();

/*오늘 날짜 구하기*/
let today = new Date();
let dd = today.getDate();
let mm = today.getMonth() + 1;
let yyyy = today.getFullYear();
if (dd < 10) {
    dd = '0' + dd;
}
if (mm < 10) {
    mm = '0' + mm;
}
today = yyyy + '-' + mm + '-' + dd;

startDate.value = today;
startDate.setAttribute("min", today);
endDate.setAttribute("min", today)
let strArr = startDate.value.split('-');
let date = new Date(strArr[0], strArr[1], strArr[2] + 7);
endDate.setAttribute("max", date);

var mapContainer = document.getElementById("map"), // 지도를 표시할 div
     mapOption = {
         center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
         level: 5 // 지도의 확대 레벨
     };
 console.log(mapContainer);

 //지도를 미리 생성
 var map = new daum.maps.Map(mapContainer, mapOption);
 //주소-좌표 변환 객체를 생성
 var geocoder = new daum.maps.services.Geocoder();
 //마커를 미리 생성
 var marker = new daum.maps.Marker({
     position: new daum.maps.LatLng(37.537187, 127.005476),
     map: map
 });

/*우편번호 찾기 */
 function PostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
             var addr = data.address; // 최종 주소 변수

             // 주소 정보를 해당 필드에 넣는다.
             document.getElementById("searchLoc").value = addr;
             // 주소로 상세 정보를 검색
             console.log(geocoder);
             geocoder.addressSearch(data.address, function(results, status) {
                 // 정상적으로 검색이 완료됐으면
                 if (status === daum.maps.services.Status.OK) {

                     var result = results[0]; //첫번째 결과의 값을 활용
                     console.log(result);
                     // 해당 주소에 대한 좌표를 받아서
                     var coords = new daum.maps.LatLng(result.y, result.x);
                     console.log(result.y);
                     locx.setAttribute("value",result.y);
                     locy.setAttribute("value",result.x);
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