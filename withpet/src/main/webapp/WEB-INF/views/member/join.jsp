<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>

<style type="text/css">
	/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
	.mailChk_button{
	visibility : hidden;
	}
	

	.correct{
    color : green;
}
	.incorrect{
    color : red;
}


.final_pw_ck{
    display: none;
}
.final_pwck_ck{
    display: none;
}
.final_name_ck{
    display: none;
}
.final_mail_ck{
    display: none;
}
.final_birth_ck{
    display: none;
}
/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1{
        color : green;
        display : none;    
}
.pwck_input_re_2{
        color : red;
        display : none;    
}  

</style>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WithPet_회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/member/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/member/css/sb-admin-2.min.css" rel="stylesheet">
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form class="user" id="registerForm"  method = "post">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="name"
                                            placeholder="이름 ex)홍길동" name = "name">
                                            <span class="final_name_ck">이름을 입력해주세요.</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="birth"
                                            placeholder="생년월일 ex)220101 " name = "birth">
                                            <span class="final_birth_ck">생년월일을 입력해주세요.</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="email"
                                        placeholder="아이디 ex)withpet@withpet.com" name = "email">
                                   			   	    <span class="final_mail_ck">이메일을 입력해주세요.</span>
                                   			   	    <span class="id_input_re_1">사용가능 이메일 입니다.</span>
													<span class="id_input_re_2">이메일이 이미 존재합니다.</span>
													<span class="mail_input_box_warn"></span>
                                </div>
                                
								<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0" >
                                        <input type = "text" class="form-control form-control-user" id = "mailChk" disabled = "disabled">
                                         <span id="mail_check_input_box_warn"></span>
                                    </div>
                                    <div class = "mailChk_button" type="button">
                                   	 	<span>인증번호 요청</span>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="password" placeholder="비밀번호" name = "password">
                                            <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="repeatPassword" placeholder="비밀번호 확인" name = "repeatPassword">
                                            <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
                                            <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                							<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                                    </div>
                                </div>
                                <a class="btn btn-primary btn-user btn-block" id="register">
                                    회원가입
                                </a>
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> 구글로그인
                                </a>
                               
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">비밀번호찾기</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login">로그인</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
  <script>
  
  var code = ""; //인증번호 코드 저장
  
  /* 유효성 검사 통과유무 변수 */
  var mailCheck = false;            // 아이디
  var mailnumCheck = false;        // 이메일 인증번호 확인
  var pwCheck = false;            // 비번
  var pwckCheck = false;            // 비번 확인
  var pwckcorCheck = false;        // 비번 확인 일치 확인
  var nameCheck = false;            // 이름
  
  $(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
		$("#register").click(function(){

			var id = $('#email').val();                 // id 입력란(email)
	        var pw = $('#password').val();                // 비밀번호 입력란
	        var pwck = $('#repeatPassword').val();            // 비밀번호 확인 입력란
	        var name = $('#name').val();            // 이름 입력란
			var birth = $('#birth').val(); // 생일 입력

			$("#registerForm").attr("action","/member/join")
			$("#registerForm").submit();    
	        
	 
		});
	});
  
//아이디 중복검사
  $('#email').on("propertychange change keyup paste input", function(){
	  
		var email = $('#email').val();			// .id_input에 입력되는 값
		var emailChk = {email : email}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
		
		$.ajax({
			type : "POST",
			url : "/member/emailChk",
			data : emailChk,
			success : function(result){
			    /* 이메일 형식 유효성 검사 */
			    if(mailFormCheck(email)){
			        warnMsg.html("사용가능한 이메일 입니다.");
			        warnMsg.css("display", "inline-block");
			    } else {
			        warnMsg.html("올바르지 못한 이메일 형식입니다.");
			        warnMsg.css("display", "inline-block");
			        $('.mailChk_button').css("visibility", "hidden")
			        return false;
			    }   
			    
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");			
					$('.mailChk_button').css("visibility", "visible")

				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");			
					$('.mailChk_button').css("visibility", "hidden")

				}

				
			}
		
		}); // ajax 종료

  });// function 종료
  
  //이메일 인증번호 전송
  $(".mailChk_button").click(function(){
	  var emailChk = $("#email").val();
	  var cehckBox = $("#mailChk");
	  


	 
	
	  $.ajax({
		  type : "GET",
		  url : "mailChk?emailChk="+emailChk,
		  success : function(data){
			  /* console.log("data : " + data); */
 			  cehckBox.attr("disabled",false);
			  alert('인증번호가 전송되었습니다.')
			  code = data; 
			  console.log(code);
			 
		  }
			
	  })
	  
  });
  
  //인증번호 비교
  
  $("#mailChk").blur(function(){
	  var inputCode = $("#mailChk").val();        // 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");      
	        mailnumCheck = true;
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        mailnumCheck = false;
	    }    
  });
  

  
  /* 비밀번호 확인 일치 유효성 검사 */
   
  $('#repeatPassword').on("propertychange change keyup paste input", function(){
	    var pw = $('#password').val();
	    var pwck = $('#repeatPassword').val();
	    $('.final_pwck_ck').css('display', 'none');
	 
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }        
	    
	});  
  
  /* 입력 이메일 형식 유효성 검사 */
  function mailFormCheck(email){
	  var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	  return form.test(email);
  
 }
  
  
          
      
 
  

  

	


</script>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/member/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/member/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/member/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/member/js/sb-admin-2.min.js"></script>

</body>

</html>