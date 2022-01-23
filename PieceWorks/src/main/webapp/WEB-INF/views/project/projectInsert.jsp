<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 생성</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="${ contextPath }/resources/js/jquery-3.6.0.min.js"></script>  -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
	#detail-content {
		display: flex; 
		flex-wrap: wrap; 
		justify-content: space-evenly;
	}
	label {font-weight: bold;}
	#projectDetail {
		margin-top: 20px; 
		margin-bottom: 20px; 
		float: left;
	}
	#projectInsert {margin-top: 20px; margin-bottom: 20px;}
	#projectContent {min-height: 500px;}
	#startDate, #endDate {width: 50%;}
	#titleImg {width: 150px; height: 150px;}
	#before {
		height: 35px; 
		font-size: 15px; 
		line-height: 35px;
		background: none;
	    color: black;
	    cursor: pointer;
	}
	
	#ing {
		height: 35px; 
		font-size: 15px; 
		line-height: 35px;
	}
	
	#finish {
		height: 35px; 
		font-size: 15px; 
		line-height: 35px;
	}
	#dropdown {margin-top: 0px;}
	
	#projectStatus {width: 160px;}
	
	#status-dropdown-menu {text-align: center;}
	
	#status-dropdown-menu a {text-decoration-line : none;}
</style>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom fonts for this template-->
<link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resource/css/sb-admin-2.min.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.2.0/lodash.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body id="page-top">
	
	<!-- Page Wrapper -->
	<div id="wrapper">
	
		<!-- SIDEBAR -->
		<c:import url="../common/project-sidebar.jsp" />
	
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
            <div id="content">
            
				<!-- TOPBAR -->
				<c:import url="../common/project_topbar.jsp" />

<!-------------------------------------------------------------------- 컨텐츠 영역 -------------------------------------------------------------------->
			<div id="detail-content" >
				<div id="projectInsert" class="container text-gray-800">
					<form action="pInsert.pr" method="post" class="row g-3">
						<h3>새 프로젝트 생성</h3>
						<div class="col-12">
							<label for="projectName" class="form-label">프로젝트명</label>
							<input type="text" class="form-control text-gray-800" id="projectTitle" name="pTitle">
						</div>
						<div class="col-12">
							<label for="projectWriter" class="form-label">생성자</label>
							<input type="text" class="form-control text-gray-900" id="projectWriter" name="pCreater" value="${ sessionScope.loginUser.email }" readonly>
						</div>
						<div class="col-12">
							<label for="wirterNickName" class="form-label">닉네임</label>
							<input type="text" class="form-control text-gray-800" id="wirterNickName" name="pNickName" value="${ sessionScope.loginUser.nickName }" readonly>
						</div>
						<div class="col-12">
								<label for="projectStatus" class="form-label mb-2">진행상황</label>
								<input type="hidden" id="pStatus" name="pStatus" value="진행전">
						</div>
						<div class="col-12" id="dropdown">
							<div class="dropdown mb-2">
								<button class="btn" type="button" id="projectStatus" data-bs-toggle="dropdown" aria-expanded="false">진행전</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" id="status-dropdown-menu">
									<li id="before">진행전</li>
									<li id="ing">진행중</li>
									<li id="finish">완료</li>
								</ul>
							</div>
						</div>
						<div class="col-12">
							<label for="projectContent" class="form-label">프로젝트 내용</label>
							<textarea class="form-control text-gray-800" id="projectContent" name="pContent" style="resize: none;"></textarea>
						</div>
						<div class="col-12">
							<label for="startDate" class="form-label">프로젝트 시작일</label>
							<input type="date" class="form-control text-gray-800" id="startDate" name="pStartDate" max="9999-12-31">
						</div>
						<div class="col-12" id="projectBtn">
							<label for="endDate" class="form-label">프로젝트 종료일</label>
							<input type="date" class="form-control text-gray-800" id="endDate" name="pEndDate" max="9999-12-31">
						</div>
						<div class="d-grid gap-2 col-12 d-md-block" align="center">
							<button type="submit" class="btn btn-primary">등록</button> 
							<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
						</div>
					</form>
				</div>
			</div>

			<script>
				function send() {
					var title = document.getElementById('projectTitle');
					var content = document.getElementById('projectContent');
					var startDate = document.getElementById('startDate');
					var endDate = document.getElementById('endDate');
					
					if(title.value == '' || title.value.length == 0){
						alert('프로젝트명을 작성하셔야 합니다.');
						title.focus();
						return false;
					} else if(content.value == '' || content.value.length == 0){
						alert('프로젝트 내용을 작성하셔야 합니다.');
						content.focus();
						return false;
					} else if(startDate.value == '' || startDate.value.length == 0){
						alert('프로젝트 시작일을 선택하셔야 합니다.');
						return false;
					} else if(endDate.value == '' || endDate.value.length == 0){
						alert('프로젝트 종료일을 선택하셔야 합니다.');
						return false;
					} else if(startDate.value > endDate.value) {
						alert('시작일보다 종료일이 빠를 수는 없습니다.');
						return false;
					}
				};
			</script>
			<script>
				$(function() {		
					var status = document.getElementById('projectStatus');
					
					if(status.innerHTML == '진행전') {
						status.style.backgroundColor = '#f6c23e';
						status.style.color = 'white';
					} else if(status.innerHTML == '진행중') {
						status.style.backgroundColor = '#36b9cc';
						status.style.color = 'white';
					} else if(status.innerHTML == '완료') {
						status.style.backgroundColor = '#4e73df';
						status.style.color = 'white';
					}
					
					if($('#before').text() == $('#projectStatus').text()) {
						$('#before').css('color', '#CCC');
						before();
						ing();
						finish();
					} else if($('#ing').text() == $('#projectStatus').text()) {
						$('#ing').css('color', '#CCC');
						before();
						ing();
						finish();
					} else if($('#finish').text() == $('#projectStatus').text()) {
						$('#finish').css('color', '#CCC');
						before();
						ing();
						finish();
					}
				});
			</script>
			<script>
				function before() {
					$('#before').mouseenter(function() {
						$(this).css({'background':'#f6c23e', 'color':'white', 'cursor':'pointer'});
					}).mouseout(function() {
						$(this).css({'background':'none', 'color':'black'});
					}).on('click', function() {
						$('#projectStatus').text('진행전');
						$('#projectStatus').css({'background':'#f6c23e', 'color':'white'});
						$('#pStatus').val('');
						$('#pStatus').val('진행전');
					});
				}
				
				function ing() {
					$('#ing').mouseenter(function() {
						$(this).css({'background':'#36b9cc', 'color':'white', 'cursor':'pointer'});
					}).mouseout(function() {
						$(this).css({'background':'none', 'color':'black'});
					}).on('click', function() {
						$('#projectStatus').text('진행중');
						$('#projectStatus').css({'background':'#36b9cc', 'color':'white'});
						$('#pStatus').val('');
						$('#pStatus').val('진행중');
					});
				}
				
				function finish() {
					$('#finish').mouseenter(function() {
						$(this).css({'background':'#3479FF', 'color':'white', 'cursor':'pointer'});
					}).mouseout(function() {
						$(this).css({'background':'none', 'color':'black'});
					}).on('click', function() {
						$('#projectStatus').text('완료');
						$('#projectStatus').css({'background':'#3479FF', 'color':'white'});
						$('#pStatus').val('');
						$('#pStatus').val('완료');
					});
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
