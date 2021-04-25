const bookmark = document.querySelectorAll(".book");
const bookmark2 = document.querySelectorAll(".book2");
const score = document.getElementsByClassName("score");
const ul = document.getElementsByClassName("star");
const proscore = document.getElementsByClassName("proscore");
const proul = document.getElementsByClassName("prostar");
const pCate = document.getElementsByClassName("pCate");

const order = document.getElementById("order");
const proWrap = document.getElementById("proWrap");

window.onload = function(){
	startScore();
	prostartScore();
}

//select연결
function selectList(value) {
    let pCategory = pCate[0].innerText;
    var data = { "order": value, "pCategory": pCategory };
    console.log(data);
    $.ajax({
        data: data,
        type: "get",
        url: "getList.do",
        success: function (result) {
            console.log(result);
            //create생성함수
            createProfession(result);
            startScore();
        }
    });
};


function createProfession(result) {

    $("#proWrap").remove();

    const proWrap = document.createElement("div");
    proWrap.id = "proWrap";
    professionList.appendChild(proWrap);


    for (i = 0; i < result.length; i++) {
        const pro = document.createElement("div");
        const proList_img = document.createElement("span");
        const img = document.createElement("img");
        const pro_txt = document.createElement("div");
        const proName_txt = document.createElement("div");
        const h1 = document.createElement("h1");
        const pCate = document.createElement("span");
        const h2 = document.createElement("h2");
        const p = document.createElement("p");
        const starWrap = document.createElement("div");
        const star = document.createElement("ul");
        const score = document.createElement("span");

        const rihgt_txt = document.createElement("div");
        const book2 = document.createElement("span");
        const button = document.createElement("button");

        pro.classList.add("pro");
        pro.classList.add("clearfix");
        proList_img.classList.add("proList_img");
        img.setAttribute('src', "resources/image/" + result[i].pPic + ".jpg");
        proList_img.appendChild(img);
        pro_txt.classList.add("pro_txt");

        proName_txt.classList.add("proName_txt");
        proName_txt.classList.add("clearfix");
        h1.innerText = result[i].uName;
        pCate.classList.add("pCate");
        pCate.innerText = result[i].pCategory;
        proName_txt.appendChild(h1);
        proName_txt.appendChild(pCate);

        h2.innerText = result[i].pAddress;
        p.innerText = result[i].pIntroduce;

        starWrap.classList.add("starWrap");
        star.classList.add("star");
        star.classList.add("clearfix");
        score.classList.add("score");
        score.innerText = result[i].score;
        starWrap.appendChild(star);
        starWrap.appendChild(score);

        rihgt_txt.classList.add("rihgt_txt");
        book2.classList.add("book2");
        button.classList.add("proList_btn");
        button.innerText = "상세보기";
        //상세 보기 클릭이벤트 연결
        //button.addEventListener("click", location.href='detail.do?pNo='+ result[i].pNo +'&pCategory=' + + result[i].pCategory);
                
   	    rihgt_txt.appendChild(book2);
     	rihgt_txt.appendChild(button);

        pro_txt.appendChild(proName_txt);
        pro_txt.appendChild(h2);
        pro_txt.appendChild(p);
        pro_txt.appendChild(starWrap);
        pro_txt.appendChild(rihgt_txt);

		pro.appendChild(proList_img);
        pro.appendChild(pro_txt);

        proWrap.appendChild(pro);
    }
}

//북마크 체크
function bookplus(pNo, uNo) {
	let param = { "pNo": pNo, "uNo": uNo };

	console.log(param);
	$.ajax({
		data: param,
		type: 'GET',
		url: "bookmark.do",
		success: function(data) {
			console.log(data);
			if (data == -1) {
				alert("로그인 해주세요");
			} else if (data == 1 || data == 0) {
				for (var i = 0; i < bookmark.length; i++) {
					bookmark[i].addEventListener('click', book, true);
				}
				for (var i = 0; i < bookmark2.length; i++) {
					bookmark2[i].addEventListener('click', book, true);
				}
				if (data == 1) {
					connectWs(param);
				}
			}
		}
	});
}

//별돌리기
function startScore(){
    for(i=0; i<score.length; i++){
        let scoreTxt = score[i].innerText;
        let starshare = Math.floor(scoreTxt);
        let remainder = scoreTxt%starshare;
        for(j=0; j < starshare; j++){
            let li = document.createElement("li");
            li.innerText = "★";
            ul[i].appendChild(li);
        }
        if(remainder >= 0.5){
            let harf_li = document.createElement("li");
            harf_li.innerText = "☆";
            ul[i].appendChild(harf_li);
        }
      
        console.log(remainder);
    }
}

//별돌리기
function prostartScore(){
    for(i=0; i < proscore.length; i++){
        let scoreTxt = proscore [i].innerText;
        let starshare = Math.floor(scoreTxt);
        let remainder = scoreTxt%starshare;
        for(j=0; j < starshare; j++){
            let li = document.createElement("li");
            li.innerText = "★";
            proul[i].appendChild(li);
        }
        if(remainder >= 0.5){
            let harf_li = document.createElement("li");
            harf_li.innerText = "☆";
            proul[i].appendChild(harf_li);
        }
      
        console.log(remainder);
    }
}

//소켓 테스트
function connectWs(param) {
	//웹 소켓을 지정한 url로 연결한다.
	console.log(param);
	sock = new SockJS("http://localhost:9999/project/echo/");
	socket = sock;

	sock.onopen = function(param) {
		console.log("info: connection opened");
		sock.send(param);
	};

	sock.onmessage = function(event) {
		var data = evt.data;
		consol.log("ReceveMessage" + data);
		alert(`[message] 서버로부터 전송받은 데이터: ${event.data}`);
	}

	sock.onClose = function() {
		console.log("connect close");
	};

}

function book() {
	(this.classList.contains("select")) ? this.classList.remove("select") : this.classList.add("select");
}

// function starScore() {
//     const li = document.createElement("li");
//     const scorInt = score.innerText;
//     for (let i = 0; i < scorInt; i++) {
//         li.appendChild(document.createTextNode("Four"));
//         ul[i].appendChild(li);
//     }
// }

