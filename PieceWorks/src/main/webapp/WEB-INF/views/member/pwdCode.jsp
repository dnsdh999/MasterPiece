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

    <title>Forgot Password Code</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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
    
    #displayTimer{
    	color: ligthgrey;
    	font-size: 13px;
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
                                        <h1 class="h4 text-gray-900 mb-2">인증번호</h1>
                                        <span id="timer"></span>
                                    </div>
                                    <form class="user" action="pwdCode.me" method="post">
                                        <div class="user-input">
                                            <div class="form-group">
	                                            <input type="hidden" id="random" value="${ random }" />
	                                            <input type="text" class="form-control form-control-user"
	                                                    id="code" placeholder="인증번호를 입력하세요">
	                                            <br>
  	                                    	</div>
                                        	<div>
                                        		<input type="hidden" name="email" value="${ email }">
                                        	</div>
                                            <input type="submit" class="btn btn-primary btn-user btn-block" value="확인">
                                            <input type="button" class="btn btn-cancle btn-user btn-block" value="취소" onclick="cancle();">
                                        </div>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="signUpView.me">계정이 없으신가요?</a>
                                    </div>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <script>
        function cancle(){
            location.href = "loginView.me";
        }
        
        function $ComTimer(){
            //prototype extend
        }

        $ComTimer.prototype = {
            comSecond : ""
            , fnCallback : function(){}
            , timer : ""
            , domId : ""
            , fnTimer : function(){
            	debugger;
                var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";	// 남은 시간 계산
                this.comSecond--;					// 1초씩 감소
                console.log(m);
                this.domId.innerText = m;
                if (this.comSecond < 0) {			// 시간이 종료 되면
                    clearInterval(this.timer);		// 타이머 해제
                    alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
                    location.href="javascript:history.go(-1);";
                }
            }
            ,fnStop : function(){
                clearInterval(this.timer);
            }
        }

        $(document).ready(function(){
          var AuthTimer = new $ComTimer()
          AuthTimer.comSecond = 180;
          AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
          AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
          AuthTimer.domId = document.getElementById("timer");
        });
            var AuthTimer = new $ComTimer();
        	
        	AuthTimer.comSecond = 180;
        	AuthTimer.fnCallback = function(){
        			alert("다시인증을 시도해주세요.");
        			location.href="findPwdForm.me";
        	};
        	AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
        	AuthTimer.domId = document.getElementById("timer");
        	count = 1;
        	
        	function randomNumCheck(){
        		var ran1 = document.getElementById("random").value;
        		var ran2 = document.getElementById("code").value;
        		
        		
        		console.log(count);
        		
        		if(ran1 == ran2){
        			return true;
        		} else {
        			if(count > 3){
        				alert("인증번호가 일치하지 않습니다. 재시도 가능 횟수를 초과하여 메일인증 페이지로 돌아갑니다.");
        				location.href="sPwdView.me";
        				return false;
        			}
        			alert("인증번호가 일치하지 않습니다. 재시도 가능 횟수("+count+"/3)");
        			count++;
        			return false;
        		}
        	}
        
    </script>
</body>

</html>