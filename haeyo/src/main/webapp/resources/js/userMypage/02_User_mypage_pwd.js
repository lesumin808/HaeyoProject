function pwd_checkkkk() {

   const uPwd = document.getElementById("uPwd").value; // 현재 비밀번호
   const uPwd3 = document.getElementById("uPwd3")// 새로운 비밀번호 
   const uPwd4 = document.getElementById("uPwd4").value; // 새로운 비밀번호 확인

   const pwd_msg = "";
   const Pass_pattern1 = /[0-9]/;
   const Pass_pattern2 = /[a-zA-z]/;
   const Pass_pattern3 = /[~!@#$%<>^&*]/;


   // ================ 유효성 검사(비밀번호 : uPwd) ================
   if (uPwd3.length == 0) {				//현재 비밀번호를 입력하지 않았을 시 ,
      alert("비밀번호를 입력해주세요");
      return false
   }  else{
	   if (uPwd3 != uPwd4) {				//새로운 비밀번호와 확인 비밀번호가 동일하지 않을 시, 
         alert("비밀번호가 일치하지 않습니다");
         return false 
   }
}
     if (!Pass_pattern1.test(uPwd3) || !Pass_pattern2.test(uPwd3)
    		  	|| !Pass_pattern3.test(uPwd3) || uPwd3.length < 8 || uPwd.length > 50) {
    	  alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다");
    	  return false
      } 

   return true
} 


function recheckPwd(){
	var nowPwdInput = $('#uPwd').val();
	console.log(nowPwdInput);
	
	   $.ajax({
	         url:"getOnePwd.do",
	         type: "GET",
	         contentType : "application/json; charset=UTF-8",
	         dataType: "json",
	         success: function(result){
	            console.log("result"+result);

	   		 if(nowPwdInput == result.uPwd){
	   			 $('#noticePwd').text("기존 비밀번호와 동일합니다");
	            }else{
	             $('#noticePwd').text("기존 비밀번호 확인 후 입력하세요");
	            } 
	         }
	   });
}