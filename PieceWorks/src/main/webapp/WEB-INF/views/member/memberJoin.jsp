<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PIECE WORKS</title>

    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link 
    	  href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
    
    <script src="resource/js/jquery-3.6.0.min.js"></script>

</head>
<style>

	@font-face {
	    font-family: 'NEXON Lv1 Gothic OTF';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	.col-lg-7 {
		max-width:100%; 
		flex:0px;
	}

    .user-input {
        width: 50%;
        margin: 0 auto;
    }
    
   .customfont1 {
   		font-family: 'NEXON Lv1 Gothic OTF';
   }
   
    .guide {
 		font-size: 10px; 
 		font-weight: bold;  
 	}
	
</style>
<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                       
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h1 text-gray-900 mb-4 customfont1" style="margin-top: 20px; margin-bottom: 10px"> 회원 가입 </h1> <br>
                                    </div>
                                    <form class="user" action="insert.me" method="post" id="insertForm" name="insert" onsubmit="return check();">
                                        <div class="user-input">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user" id="email"
                                                    	name="email" placeholder="이메일 주소 입력" required>
                                            	<span class="guide" id="emailGuide"></span>
                                            </div>
											<div class="form-group">
                                            	<input type="password" class="form-control form-control-user" id="pwd"
                                                       	name="pwd" placeholder="비밀번호 입력" required>
                                     	      	<span class="guide" id="pwdGuide"></span>
                                           		
                                            </div>
											<div class="form-group">
                                            	<input type="password" class="form-control form-control-user" id="pwdCheck"
                                                       	name="pwdCheck" placeholder="비밀번호 확인" required>
                                               	<span class="guide" id="pwdCheckGuide"></span>
                                            </div>
                                            <div class="form-group">
	                                            <input type="text" class="form-control form-control-user" id="userName" 
                                               			name="name" placeholder="이름 입력" required>
                                            </div>
                                            <div class="form-group">
    	                                        <input type="text" class="form-control form-control-user" id="phone" 
                                                  		name="phone" placeholder="휴대전화 입력" required>
                                            	<span class="guide" id="phoneGuide"></span>
                                            </div>
                                            <div class="form-group">
        	                                    <input type="text" class="form-control form-control-user" id="nickName" 
                                                   		name="nickName" placeholder="닉네임 입력" required>
                                            </div>
                                            <input type="submit" id="submit" value="회원가입" class="btn btn-primary btn-user btn-block">
                                            <input type="button" id="button" value="취소" class="btn btn-secondary btn-user btn-block" 
                                            		onclick="cancel();">
                                    	</div>
                                    </form>
                                    
                                    <hr>
                                    
                                    <div class="text-center">
                                        <a class="small" href="loginView.me">이미 계정이 있습니다!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="resource/vendor/jquery/jquery.min.js"></script>
    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resource/js/sb-admin-2.min.js"></script>

    <script>
    
	    function cancel(){
	    	location.href = "loginView.me";
	    }
	    
	    // 정규표현식 유효성 검사 & 중복 확인
		var $email = $("#insertForm input[name=email]");
		var $pwd = $("#insertForm input[name=pwd]");
		var $pwdCheck = $("#insertForm input[name=pwdCheck]");
		var $phone = $("#insertForm input[name=phone]");
		
		var email = false;
		var pwd = false;
		var pwdCheck = false;
		var phone = false;		
		
		// [비밀번호] 하나 이상의 문자, 숫자 , 특수문자 포함한 8자 이상
		let pCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		// [휴대전화] 하이픈 없이 숫자만 
		let phCheck = /^\d{2,3}\d{3,4}\d{4}$/; 
		
		// 이메일
		function emailCheck() {
			if($email.val().length > 1 && $email.val().includes("@")) {
				$.ajax({
					url: 'emailCheck.me',
					data: {email:$email.val()},
					success: function(data) {
						if(data == "NoDup") {
							console.log(data);
							email = false;
							$("#emailGuide").css({"color":"red","margin-left":"10px"}).text("❌ 중복된 이메일입니다.");
						} else if(data == "Dup") {
							console.log(data);
							email = true;
							$("#emailGuide").css({"color":"green", "margin-left":"10px"}).text("✔ 사용 가능한 이메일입니다.");
						}
					},
					error: function(data) {
						email = false;
						console.log(data);
					}
				});
			} else {
				email = false;
				$("#emailGuide").css("color", "red").text("❌ 올바른 이메일 형식이 아닙니다.");
			}
		}
		
		// 비밀번호
		function pwdCK() {
			if(!pCheck.test($pwd.val())) {
				pwd = false;
				$("#pwdGuide").css({"color":"red","margin-left":"10px"}).text("❌ 문자,숫자,특수문자를 포함한 8자 이상 입력하세요.");
			} else if(pCheck.test($pwd.val())) {
				pwd = true;
				$("#pwdGuide").css({"color":"green","margin-left":"10px"}).text("✔ 사용 가능한 비밀번호입니다.");
			}
		}
		
		// 비밀번호 확인
		function pwdCheckCK() {
			if($pwd.val() != $pwdCheck.val()) {
				pwdCheck = false;
				$("#pwdCheckGuide").css({"color":"red","margin-left":"10px"}).text("❌ 비밀번호가 일치하지 않습니다.");
			} else if($pwd.val() == $pwdCheck.val()) {
				pwdCheck = true;
				$("#pwdCheckGuide").css({"color":"green", "margin-left":"10px"}).text("✔ 비밀번호가 일치합니다.");
			}
		}
		
		// 휴대전화
		function phoneCheck() {
			if(!phCheck.test($phone.val())) {
				phone = false;
				$("#phoneGuide").css({"color":"red", "margin-left":"10px"}).text("❌ 올바른 휴대전화 번호를 입력하세요. ('-'를 제외한 숫자만 입력)");
			} else if(phCheck.test($phone.val())) {
				phone = true;
				$("#phoneGuide").css({"color":"green", "margin-left":"10px"}).text("✔ 사용 가능한 번호입니다.");
			} 
		}
		
		$(function() {
			$email.keyup(function() {
				emailCheck();
			});
			
			$pwd.keyup(function() {
				pwdCK();
			});
			
			$pwdCheck.keyup(function() {
				pwdCheckCK();
			});
			
			$phone.keyup(function() {
				phoneCheck();
			});
		});
		
		
		function check() {
			console.log("check start");
			
			if(email == false) {
				console.log("Email Fail");
				$email.focus();
				emailCheck();
				return false;
			}
			
			if(pwd == false) {
				console.log("Pwd Fail");
				$pwd.focus();
				pwdCK();
				return false;
			}
			
			if(pwdCheck == false) {
				console.log("PwdCheck Fail");
				$pwdCheck.focus();
				pwdCheckCK();
				return false;
			}
			
			if(phone == false) {
				console.log("PhoneCheck Fail");
				$phone.focus();
				phoneCheck();
				return false;
			}
		}
        </script>
</body>
</html>