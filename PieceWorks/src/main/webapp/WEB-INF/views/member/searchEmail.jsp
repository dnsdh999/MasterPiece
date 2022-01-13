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

    <title>Search Email</title>

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
	
	.guide{
		color: grey;
		font-size: xx-small;
		margin-left: 10px;
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
                                        <h1 class="h4 text-gray-900 mb-2">이메일을 잊으셨나요?</h1>
                                        <p class="mb-4">아래에 이름과 전화번호를 입력하면 이메일 찾기로 넘어갑니다.</p>
                                    </div>
                                    <form class="user" action="sEamil.me" method="post">
                                        <div class="user-input">
                                            <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                    id="name" name="name" placeholder="이름을 입력해주세요" required>
                                            <br>
                                            <input type="text" class="form-control form-control-user mb-1"
                                                    id="phone" name="phone" placeholder="휴대전화를 입력해주세요 (' - '를 제외한 숫자 입력)" required>
                                            </div>
                                            <input type="submit" class="btn btn-primary btn-user btn-block" value="이메일 찾기">
                                            <input type="button" class="btn btn-cancle btn-user btn-block" onclick="cancle();" value="취소">
                                        </div>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="signUpView.me">아이디가 없으신가요?</a>
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

    </script>
</body>

</html>