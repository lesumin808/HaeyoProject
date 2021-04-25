const bookmark = document.querySelectorAll(".r_con");

for(var i = 0; i < bookmark.length; i++){
    bookmark[i].addEventListener('click', book, false);
}

function book() {
    (this.classList.contains("select")) ? this.classList.remove("select") : this.classList.add("select");
}

    