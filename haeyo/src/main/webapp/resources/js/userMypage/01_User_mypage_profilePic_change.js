$(document).ready(function(){
    thumbnail();

})

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




     
