const locx = document.getElementById('locx');
const locy = document.getElementById('locy');

const locx_val= locx.value;
const locy_val= locy.value;


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(locx_val, locy_val), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

//마커를 생성
var marker = new kakao.maps.Marker({
    position: new kakao.maps.LatLng(locx_val, locy_val),
    map: map
});


//delete modal창
const openButton = document.getElementById("openButton");
const modal = document.querySelector(".modal");
const overlay = modal.querySelector(".out-modal-overlay");
const closeBtn = modal.querySelector("button")

const openModal = ()=> {
    modal.classList.remove("hidden");
}
const closeModal = ()=> {
    modal.classList.add("hidden");
}
overlay.addEventListener("click", closeModal);
closeBtn.addEventListener("click", closeModal);
openButton.addEventListener("click", openModal);

//get방식일때 url 제거
//window.history.replaceState({}, null, location.pathname);

