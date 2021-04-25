
$(document).ready(function(){
    thumbnail();
    certification();
    setDisplay();
});


function thumbnail(event){
$("#user-thumb").change(function(){
    if(this.files && this.files[0]) {
     var reader = new FileReader;
     reader.onload = function(data) {
      $("#thumb-img").attr("src", data.target.result);        
     }
     reader.readAsDataURL(this.files[0]);
    }
   })
}

function certification(event){
    $(".form-control").change(function(){
        if(this.files && this.files[0]) {
         var reader = new FileReader;
         reader.onload = function(data) {
          $("#file-img").attr("src", data.target.result);        
         }
         reader.readAsDataURL(this.files[0]);
        }
       })
    }

function setDisplay(){

    var chk_cleaning = $("#cleaning-service").find("input[type='checkbox']");
    var chk_moving = $("#moving-service").find("input[type='checkbox']");
    var chk_repair = $("#repair-service").find("input[type='checkbox']");

    if($("#cleaning").is(":checked")){
        $("#cleaning-service").show(function(){
            chk_cleaning.each(function(){
                    if(this.value == "1"){ this.checked = true;}
            });
            checked();
        });
    }else{
        $("#cleaning-service").hide(function(){
            chk_cleaning.prop("checked", false)
            chk_cleaning.val("0");
        });
    }

    if($("input:radio[id=moving]").is(":checked")){
        $("#moving-service").show(function(){
            chk_moving.each(function(){
                if(this.value == "1"){ this.checked = true;}
            });
            checked();
        });
    }else{
        $("#moving-service").hide(function(){
            chk_moving.prop("checked", false)
            chk_moving.val("0");
        });
    }

    if($("input:radio[id=repair]").is(":checked")){
        $("#repair-service").show(function(){
        	chk_repair.each(function(){
                if(this.value == "1"){ this.checked = true;}
            });
            checked();
        });
    }else{
        $("#repair-service").hide(function(){
        	chk_repair.prop("checked", false)
            chk_repair.val("0");
        });
    }
}

function checked(){
$(".subcategory").on("click", function(){
    $(this).prop("checked", this.checked); //this.checked: 값 가져와서 토글처럼 변경할 때 사용

    if($(this).is(':checked')){ //check가 있다면
        $(this).val("1");
     }else{
        $(this).val("0");
     }
 });
}


const locx = document.getElementById('locx');
const locy = document.getElementById('locy');

const locx_val= locx.value;
const locy_val= locy.value;

var mapContainer = document.getElementById("map"), // 지도를 표시할 div
     mapOption = {
         center: new kakao.maps.LatLng(locx_val, locy_val), // 지도의 중심좌표
         level: 5 // 지도의 확대 레벨
     };
 console.log(mapContainer);

 //지도를 미리 생성
 var map = new kakao.maps.Map(mapContainer, mapOption);
 //주소-좌표 변환 객체를 생성
 var geocoder = new kakao.maps.services.Geocoder();
 //마커를 미리 생성
 var marker = new kakao.maps.Marker({
     position: new kakao.maps.LatLng(locx_val, locy_val),
     map: map
 });


function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("searchLoc").value = addr;
            // 주소로 상세 정보를 검색
            console.log(geocoder);
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용
                    console.log(result);
                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new kakao.maps.LatLng(result.y, result.x);
                    console.log(result.y);
                    locx.setAttribute("value",result.y);
                    locy.setAttribute("value",result.x);
                    // 지도를 보여준다.
                    //mapContainer.style.display = "block"; 
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
