
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


    //readView 수정하기 이동 
    /*$(document).ready(function(){
    	var formObj = $("form[name='readForm']");
    
    //수정
    $(".modify_button").on("click", function(){
    	formObj.attr("action", "D:\프로젝트\Final Project\haeyoProject_yI\haeyo\src\main\webapp\WEB-INF\views\UserMypageInfoUpdate");
    	formObj.attr("method", "get");
    	formObj.submit();
    })
    })*/
    