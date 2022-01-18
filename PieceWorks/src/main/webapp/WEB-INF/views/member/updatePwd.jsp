<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="resource/css/sb-admin-2.css" rel="stylesheet">
</head>
<style>

	.col-lg-6{
		max-width: 100%;
		flex: 0px;
	}

    .user-input{
        width: 50%;
        margin: 0 auto;
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
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h1 text-gray-900 mb-4">PIECE WORKS</h1>
                                        <h1 class="h4 text-gray-900 mb-3">비밀번호 재설정</h1>
                                    </div>
                                    <form class="user" action="updatePwd.me" method="post" id="insertForm" name="insert" onsubmit="return check();">
                                        <div class="user-input">
                                            <div class="form-group">
	                                            <input type="password" class="form-control form-control-user" name="pwd"
	                                                    id="newPwd" placeholder="비밀번호 입력" required>
	                                            <span class="guide" id="pwdGuide"></span>
                                            </div>
                                            <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="pwdCheck"
                                                    id="newPwdCheck" placeholder="비밀번호 확인" required>
                                            <span class="guide" id="pwdCheckGuide"></span>
                                            </div>
                                           	
                                        	<input type="hidden" name="email" value="${ email }">
                                            <input type="submit" class="btn btn-primary btn-user btn-block" value="확인">
                                        </div>
                                    </form>
                                    <hr>
<!--                                     <div class="text-center"> -->
<!--                                         <a class="small" href="signUpView.me">아이디가 없으신가요?</a> -->
<!--                                     </div> -->
<!--                                     <div class="text-center"> -->
<!--                                         <a class="small" href="login.me">이미 계정이 있습니다!</a> -->
<!--                                     </div> -->
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
    
	    var $pwd = $("#insertForm input[name=pwd]");
		var $pwdCheck = $("#insertForm input[name=pwdCheck]");
    	
		var pwd = false;
		var pwdCheck = false;
		
		// [비밀번호] 하나 이상의 문자, 숫자 , 특수문자 포함한 8자 이상
		let pCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		
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
		
		$(function() {
			$pwd.keyup(function() {
				pwdCK();
			});
			
			$pwdCheck.keyup(function() {
				pwdCheckCK();
			});
		});
		
		function check() {
			console.log("check start");
			
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
		}
		
    </script>
</body>

</html>