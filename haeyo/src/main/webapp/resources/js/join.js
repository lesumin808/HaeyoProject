function join_check() {

   const uPwd = document.getElementById("uPwd").value; // 비밀번호
   const uPwd2 = document.getElementById("uPwd2").value; // 비밀번호 확인
   const uEmail = document.getElementById("uEmail").value; // 이메일(아이디 역할)
   const uName = document.getElementById("uName").value; // 이름
   const uPhone = document.getElementById("uPhone").value; // 전화번호
   const uAgreecheck0 = document.getElementById("uAgreecheck0").value; // 이용약관
   // 동의 X
   const uAgreecheck1 = document.getElementById("uAgreecheck1").value; // 이용약관
   // 동의 O

   let uPwd_passed = true;

   const pwd_msg = "";
   const Pass_pattern1 = /[0-9]/;
   const Pass_pattern2 = /[a-zA-z]/;
   const Pass_pattern3 = /[~!@#$%<>^&*]/;
   const Email_pattern = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
   const Name_pattern = /^[가-힣]{2-15}$/;
   const Phone_pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;

   // ================ 유효성 검사1(이메일 : uEmail) ================
   if (uEmail.length == 0) {
      alert("이메일을 입력해주세요");
      return false;
   } else {
      if (!Email_pattern.test(uEmail)) {
         alert("이메일 형식이 올바르지 않습니다");
         form.uEmail.vlaue = "";
         form.uEmail.focus();
         return false;
      }
   }
   // ================ 유효성 검사2(비밀번호 : uPwd) ================
   if (uPwd.length == 0) {
      alert("비민번호를 입력해주세요");
      return false;
   } else {
      if (uPwd != uPwd2) {
         alert("비밀번호가 일치하지 않습니다");
         return false;
      }
   }
   if (!Pass_pattern1.test(uPwd) || !Pass_pattern2.test(uPwd)
         || !Pass_pattern3.test(uPwd) || uPwd.length < 8 || uPwd.length > 50) {
      alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다");
      return false;
   }
   // if(uPwd.indexOf(uEmail) > -1) {
   // alert("비밀번호는 E-mail을 포함할 수 없습니다");
   // return false;
   // }
   if (uEmail == uPad) {
      alert("이메일과 비밀번호는 같을 수 없습니다");
      form.uPwd.value = "";
      form.uPwd2.value = "";
   }
   // ================ 유효성 검사3(이름 : uName) ================
   if (uName.length == 0) {
      alert("이름을 입력해주세요");
      return false;
   }
   if (!Name_pattern.test(uName)) {
      alert("이름은 한글만 입력해주세요");
      return false;
   }
   // ================ 유효성 검사4(이름 : uPhone) ================
   if (uPhone.length == 0) {
      alert("전화번호를 입력해주세요");
      return false;
   }
   if (!Phone_pattern.test(uPhone)) {
      alert("전화번호 형식이 올바르지 않습니다");
      return false;
   }
   // ================ 유효성 검사5(이용약관 : uAgreecheck) ================
   if (document.getElementById("uAgreecheck1").checked) {
      document.getElementById("uAgreecheck0").disabled = true;
   }
   return true;
}

$(document).ready(function() {
   thumbnail();
//   certification();

})

function thumbnail(event) {
   $("#uPic").change(function() {
      if (this.files && this.files[0]) {
         var reader = new FileReader;
         reader.onload = function(data) {
            $("#thumb-img").attr("src", data.target.result);
         }
         reader.readAsDataURL(this.files[0]);
      }
   })
}

//function certification(event) {
//   $(".form-control").change(function() {
//      if (this.files && this.files[0]) {
//         var reader = new FileReader;
//         reader.onload = function(data) {
//            $("#file-img").attr("src", data.target.result);
//         }
//         reader.readAsDataURL(this.files[0]);
//      }
//   })
//}

/* 인증번호 이메일 전송 */

var code = "";		// 이메일전송 인증번호 저장을 위한 코드

   $(".mail_check_button").click(function() {
      var email = $(".mail_input").val(); 		// 입력한 이메일
      var checkBox = $(".mail_check_input"); 	// 인증번호 입력란
      var boxwrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
      
      $.ajax({
         type : "GET",
         url : "mailCheck?email=" + email,
         success:function(data){
         
         //console,log("data : " + data);
         checkBox.attr("disabled", false);
         boxwrap.attr("id", "mail_check_input_box_true");
         code = data;
         }
      });
   });

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){

	var inputCode = $(".mail_check_input").val();		// 입력코드
	var checkResult = $("#mail_check_input_box_warn");	// 비교결과

	if(inputCode == code) {		// 인증번호 일치
	checkResult.html("인증번호가 일치합니다.");
	checkResult.attr("class", "correct");
	} else {					// 인증번호 불일치
	checkResult.html("인증번호를 다시 확인해주세요.");
	checkResult.attr("class", "incorrect");
	}	
});