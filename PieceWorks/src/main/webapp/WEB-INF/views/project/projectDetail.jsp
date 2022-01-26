<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
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
	
	#projectTitle, 
	#projectWriter, 
	#projectContent, 
	#startDate, 
	#endDate { 
		background: transparent; 
	}
	
	#Participant {
		margin-top: 75px; 
		margin-bottom: 20px; 
		text-align: center;
	}
	
	#projectContent {min-height: 500px;}
	/* #projectTitle, #projectWriter, #projectContent, #startDate, #endDate {width: 40%;} */
	
	#before {
		height: 35px; 
		font-size: 15px; 
		line-height: 35px;
	}
	
	#ing {
		height: 35px; 
		font-size: 15px; 
		line-height: 35px;
	}
	
	#stop {
		height: 35px; 
		font-size: 15px; 
		line-height: 35px;
	}
	
	#finish {
		height: 35px; 
		font-size: 15px; 
		line-height: 35px;
	}
	
	#updateForm{ float: left;}
	
	.row1 {width: 70%;}

	.psImg {
		eight: 30px; 
		display: inline-block; 
		vertical-align: bottom; 
		margin-right: 10px;
	}
	
	.psName {
		height: 30px; 
		display: inline-block; 
		line-height: 30px;
	}
	
	#dropdown {margin-top: 0px;}
	
	#projectStatus {width: 160px;}
	
	#status-dropdown-menu {text-align: center;}
	
	#status-dropdown-menu a {text-decoration-line : none;}
	
	#titleImg {
		width: 150px; 
		height: 150px;
	}
	
	#Participant { float: right; } 

	#card{
		position: sticky; 
		top: 5px; 
		display: inline-block;
	}
</style>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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
				<div id="projectDetail" class="container text-gray-800">
					<form action="pUpdateForm.pr" method="post" class="row1 g-3" id="updateForm">
						<h3>프로젝트</h3>
						<div class="col-12">
							<label for="projectName" class="form-label">프로젝트명</label>
							<div>
								<input type="text" class="form-control text-gray-800 mb-2" id="projectTitle" name="pTitle" value="${ p.pTitle }" readonly>
							</div>	
						</div>
						<div class="col-12">
							<label for="projectWriter" class="form-label">생성자</label>
							<div>
								<input type="text" class="form-control text-gray-900 mb-2" id="projectWriter" name="pCreater" value="${ p.pCreater }" readonly>
							</div>
						</div>
						<div class="col-12">
							<label for="projectStatus" class="form-label mb-2">진행상황</label>
						</div>
						<div class="col-12" id="dropdown">
							<div class="dropdown mb-2">
								<button class="btn" type="button" id="projectStatus" data-bs-toggle="dropdown" aria-expanded="false" name="pStatus">진행전</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" id="status-dropdown-menu">
									<li id="before">진행전</li>
									<li id="ing">진행중</li>
									<li id="stop">보류</li>
									<li id="finish">완료</li>
								</ul>
							</div>
						</div>
						<div class="col-12">
							<label for="projectContent" class="form-label">프로젝트 내용</label>
							<textarea class="form-control text-gray-800 mb-2" id="projectContent" name="pContent" style="resize: none;" readonly>${ p.pContent }</textarea>
						</div>
						<div class="col-12">
							<label for="startDate" class="form-label">프로젝트 시작일</label>
							<input type="date" class="form-control text-gray-800 mb-2" id="startDate" name="pStartDate" value="${ p.pStartDate }" readonly>
						</div>
						<div class="col-12" id="projectBtn">
							<label for="endDate" class="form-label">프로젝트 종료일</label>
							<input type="date" class="form-control text-gray-800 mb-4" id="endDate" name="pEndDate" value="${ p.pEndDate }" readonly>
						</div>
						<div class="d-grid gap-2 col-12 d-md-block" align="center">
							<button type="submit" class="btn btn-primary mb-3">수정</button>
							<button type="button" class="btn btn-secondary mb-3" onclick="history.back();">취소</button>
						</div>
					</form>
					<div id="Participant" class="col-xl-3 col-md-6 mb-4">
						<div class="card shadow mb-4" id="memberList">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">참여자 목록</h6>
							</div>
							<div class="card-body">
								<div class="text-gray-900 p-3">참여자가 없습니다.</div>
								<div class="text-gray-900 p-3">
									<div class="psImg">
										<img src="icon.png" width="25" height="25">
									</div>
									<div class="psName">강건강</div></div>
								<div class="text-gray-900 p-3">
									<div class="d-grid gap-2 col-12 d-md-block" align="center">
										<button type="button" class="btn btn-dark" id="invite">초대하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				$(function() {		
					var status = document.getElementById('projectStatus');
					
					if(status.innerHTML == '진행전') {
						status.style.backgroundColor = '#FDAB3D';
						status.style.color = 'white';
					} else if(status.innerHTML == '진행중') {
						status.style.backgroundColor = '#28BA37';
						status.style.color = 'white';
					} else if(status.innerHTML == '보류') {
						status.style.backgroundColor = '#8B6FFF';
						status.style.color = 'white';
					} else if(status.innerHTML == '완료') {
						status.style.backgroundColor = '#3479FF';
						status.style.color = 'white';
					}
					
					if($('#before').text() == $('#projectStatus').text()) {
						$('#before').css('color', '#CCC');
						ing();
						stop();
						finish();
					} else if($('#ing').text() == $('#projectStatus').text()) {
						$('#ing').css('color', '#CCC');
						before();
						stop();
						finish();
					} else if($('#stop').text() == $('#projectStatus').text()) {
						$('#stop').css('color', '#CCC');
						before();
						ing();
						finish();
					} else if($('#finish').text() == $('#projectStatus').text()) {
						$('#finish').css('color', '#CCC');
						before();
						ing();
						stop();
					}
				});
				
				$('#invite').on('click', function() {
					window.open('inviteMember.pr', 'inviteForm', 'width=400, height=500');
				});
			</script>
			<script>
				function before() {
					$('#before').mouseenter(function() {
						$(this).css({'background':'#FDAB3D', 'color':'white', 'cursor':'pointer'});
					}).mouseout(function() {
						$(this).css({'background':'none', 'color':'black'});
					}).on('click', function() {
						location.href='projectStatusUpdate.pr?status=' + $('#before').text();
					});
				}
				
				function ing() {
					$('#ing').mouseenter(function() {
						$(this).css({'background':'#28BA37', 'color':'white', 'cursor':'pointer'});
					}).mouseout(function() {
						$(this).css({'background':'none', 'color':'black'});
					}).on('click', function() {
						location.href='projectStatusUpdate.pr?status=' + $('#ing').text();
					});
				}
				
				function stop() {			
					$('#stop').mouseenter(function() {
						$(this).css({'background':'#8B6FFF', 'color':'white', 'cursor':'pointer'});
					}).mouseout(function() {
						$(this).css({'background':'none', 'color':'black'});
					}).on('click', function() {
						location.href='projectStatusUpdate.pr?status=' + $('#stop').text();
					});
				}
				
				function finish() {
					$('#finish').mouseenter(function() {
						$(this).css({'background':'#3479FF', 'color':'white', 'cursor':'pointer'});
					}).mouseout(function() {
						$(this).css({'background':'none', 'color':'black'});
					}).on('click', function() {
						location.href='projectStatusUpdate.pr?status=' + $('#finish').text();
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
