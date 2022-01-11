<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="${ contextPath }/resources/js/jquery-3.6.0.min.js"></script>  -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
	label {font-weight: bold;}
	#myInfo {margin-bottom: 90px; margin-left: auto; margin-right: auto;}
	.form-group input {font-size: 15px;}
	#titleImg {width: 150px; height: 150px;}
/* 	ul>a {} */
</style>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom fonts for this template-->
<link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resource/css/sb-admin-2.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.2.0/lodash.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body id="page-top">
	
	<!-- Page Wrapper -->
	<div id="wrapper">
	
		<!-- SIDEBAR -->
		<c:import url="../common/main-sidebar.jsp" />
	
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
            <div id="content">
            
				<!-- TOPBAR -->
				<c:import url="../common/topbar.jsp" />


<!-------------------------------------------------------------------- 컨텐츠 영역 -------------------------------------------------------------------->
			<div class="container" id="myInfo">			
				<div class="col-lg-8 my-5 mx-auto">
					<div class="p-4">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">${ loginUser.name }님의 정보 조회</h1>
						</div>
						<form class="user" action="mUpdateForm.me" method="post">
							<div class="form-group">
								<label class="control-label" for="email">Email</label>
								<input type="email" class="form-control form-control-user" id="email" name="email" value="${ loginUser.email }" readonly>
							</div>
							<div class="form-group">
								<label class="control-label" for="name">이름</label>
								<input type="text" class="form-control form-control-user" id="name" name="name" value="${ loginUser.name }" readonly>
							</div>
							<div class="form-group">
								<label class="control-label" for="nickName">닉네임</label>
								<input type="text" class="form-control form-control-user" id="nickName" name="nickName" value="${ loginUser.nickName }" readonly>
							</div>
							<div class="form-group">
								<label class="control-label" for="phone">전화번호</label>
								<input type="text" class="form-control form-control-user" id="phone" name="phone" value="${ loginUser.phone }" readonly>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-user btn-block">정보수정</button>
								<c:url var="mdelete" value="mdelete.me">
									<c:param name="email" value="${ loginUser.email }"/>
								</c:url>
								<button type="button" class="btn btn-delete btn-user btn-block" onclick="deleteMember()">회원탈퇴</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<script>
				function deleteMember() {
					var bool = confirm('정말 탈퇴를 하시겠습니까?');
					if(bool) {
						location.href='${ mdelete }';
					}
				}
			</script>
<!-------------------------------------------------------------------- 컨텐츠 영역 -------------------------------------------------------------------->


			<!-- End of Main content -->
			
			<!-- Footer -->
			<c:import url="../common/footer.jsp" />
			
			<!-- Main Content 끝 -->
			</div>
		<!-- Content Wrapper 끝 -->
		</div>
	<!-- Page Wrapper 끝 -->    
	</div>
</body>
</html>
