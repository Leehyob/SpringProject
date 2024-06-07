$(document).ready(function(){
         
    $('.message a').click(function(){
          $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
       });
    $("#loginBtn").on("click",function(){ //로그인 유효성 검사
           
           if($("input[name='username']").val()===""){
               alert("이메일을 입력하세요");
               return false;
           }
           else if($("input[name='password']").val()===""){
               alert("비밀번호를 입력하세요");
               return false;
           }
           return;
           
       })

       //이용 약관 유효성 검사
       $("#registerBtn").on("click",function(){   
            if($("#check_1").is(":checked") == false){
                alert("모든 필수 약관에 동의 하셔야 다음 단계로 진행 가능합니다");
                return;
            }if($("#check_2").is(":checked") == false){
                alert("모든 필수 약관에 동의 하셔야 다음 단계로 진행 가능합니다");
                return;
            }if($("#check_3").is(":checked") == false){
                alert("모든 필수 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                return;
            }
        });    

       const agreeChkAll = document.querySelector('input[name=agree_all]');
       agreeChkAll.addEventListener('change', (e) => {
       let agreeChk = document.querySelectorAll('input[name=agree]');
       for(let i = 0; i < agreeChk.length; i++){
         agreeChk[i].checked = e.target.checked;
       }
   });
   $('input[type=checkbox]').on('change', function(e) {
    if ($("#check_1").is(":checked") && $("#check_2").is(":checked") && $("#check_3").is(":checked") && $("#check_4").is(":checked")) {
        $("#agree_all").prop("checked", true);
    } else {
        $("#agree_all").prop("checked", false);
    }
});
       //이용 약관 유효성 검사End
       
       $("#registerBtn").on("click",function(){
           var joinForm = $(".register-form");
           
           
           if(!joinForm.find("input[name='member_email']").val()){
               alert("이메일을 입력하세요");
               return false;
           }
            
            if(!joinForm.find("#emailCheckBtn")){
                   alert("이메일을 입력하세요");
                   return false;
               }
           if(!joinForm.find("input[name='pwd']").val()){
                   alert("비밀번호를 입력하세요");
                   return false;
               }
           if(joinForm.find("input[name='pwd']").val().length < 8){
               alert("비밀번호는 8자리 이상으로 설정해야 합니다")
               return false;
           }
           if(joinForm.find("input[name='pwd']").val() != joinForm.find("input[name='pwd-repeat']").val()){
               alert("비밀번호가 일치하지 않습니다")
               return false;
           }
           if(joinForm.find("input[name='name']").val()===""){
               alert("이름을 입력해주세요")
               return false;
           }
           if(joinForm.find("input[name='phone']").val()===""){
               alert("휴대폰 번호를 입력해주세요")
               return false;
           }
           if($(".mail-check-input").val()===""){
               alert("이메일 인증을 먼저 진행해주세요!")
               return false;
           }
           alert("회원가입이 완료되었습니다!");
           return;
           
       })
       
$("#id").on("focusout", function() {
           
           var id = $("#id").val();
           
           if(id === ''|| id.length === 0) {
               $("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
               return false;
           }
           
           function email_check(id) {
               var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
               return reg.test(id);
           }
           
           if(!email_check(id)){
               $("#label1").css("color", "red").text("이메일 형식이 올바르지 않습니다.");
               return false;
           }
           
           
           //Ajax로 전송
           $.ajax({
               url : '/ConfirmId',
               data : {
                   id : id
               },
               type : 'post',
               dataType : 'json',
               success : function(result) {
                   if (result === true) {
                       $("#label1").css("color", "green").text("사용 가능한 ID 입니다.");
                   } else{
                       $("#label1").css("color", "red").text("이미 존재하는 ID 입니다.");
                       $("#id").val('');
                   }
               }
           }); //End Ajax
       });
       
       $('#mail-Check-Btn').on("click",function() {
           var email = $('#id').val(); // 이메일 주소값 얻어오기!
           console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
           var checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
           
           $.ajax({
               type : 'post',
               url : '/mailCheck', // GET방식이라 Url 뒤에 email을 뭍힐수있다.,
               data :{ email : email},
               dataType : 'json',
               success : function (result) {
                   console.log("result : " +  result);
                   checkInput.attr('disabled',false);
                   code =result;
                   if(email !== ""){
                   alert('인증번호가 전송되었습니다.')
                   }else{
                       alert('이메일을 입력해주세요')
                       return false
                   }
               }			
           }); // end ajax
       }); // end send eamil
       
       $(".mail-check-input").on("focusout", function() {
           var inputCode = $(".mail-check-input").val(); //인증번호 입력 칸에 작성한 내용 가져오기
           
           console.log("입력코드 : " + inputCode);
           console.log("인증코드 : " + code);
               
           if(Number(inputCode) === code){
               $("#mail-check-warn").html('인증번호가 일치합니다.');
               $("#mail-check-warn").css('color', 'green');
               $('#mail-Check-Btn').attr('disabled', true);
               $('#id').attr('readonly', true);
               $(".signupbtn").attr("disabled", false);
           }else{
               $("#mail-check-warn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
               $("#mail-check-warn").css('color', 'red');
               $(".signupbtn").attr("disabled", true);
           }
       });
    
 })   
 
