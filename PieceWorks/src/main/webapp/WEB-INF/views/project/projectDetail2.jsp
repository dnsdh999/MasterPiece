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
	
	.modal7 {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: none;
      background-color: rgba(0, 0, 0, 0.4);
    }
	
    .modal7.show {
      display: block;
    }

	.modal_body7 {
		text-align: center;
	}
	
	.modal_body8 {
		text-align: left;
	}
    .modal_body7 {
      position: absolute;
      top: 50%;
      left: 50%;

      width: 400px;
      height: 600px;

      padding: 40px;
      
      background-color: rgb(255, 255, 255);
      border-radius: 10px;
      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

      transform: translateX(-50%) translateY(-50%);
    }
	#card{
		position: sticky; 
		top: 5px; 
		display: inline-block;
	}
	
	.card {
		width: 500px;
		float: left;
		margin-right: 15px;
		margin-bottom: 15px;
	}
	
	#btn {
		border: 0px;
		background: none;
		color: #4e73df;
	}
	
	.label1 {
		width: 33.33333333%;
	}
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
				<div id="detail-content"  style="margin_bottom:500px;">
					<div id="projectDetail" class="container text-gray-800">
						<h3>${ p.pTitle } 상세 일정</h3>
<!-- 						<form action="detailInsert.pr" method="post" class="row g-3"> -->
							<div class="card-body">
							일정 생성<a id="btn" class="btn-open-popup7" href="fullCal.ca"><i class="fas fa-plus"></i></a>
								<div class="col-lg-12 mb-2">
									
									
								</div>
							</div>
<!-- 							<div class="modal7"> -->
<!-- 								<div class="modal_body7"> -->
<!-- 									<label class="label1" id="modalTitle">상세 일정 추가</label> -->
<!-- 									<div class="modal_body8"> -->
<!-- 										<br> -->
<!-- 										<label class="label1" id="title">일정명<input type="text" id="dTitle"></label> -->
<!-- 										<br> -->
<!-- 										<label class="label1" id="content">일정 상세<input type="text" id="dTitle"></label> -->
<!-- 										<br> -->
<!-- 										<label class="label1" id="category"></label> -->
<!-- 									</div> -->
<!-- 								</div> -->
								
<!-- 							</div> -->
						

					</div>
				</div>
<!-------------------------------------------------------------------- 컨텐츠 영역 끝 -------------------------------------------------------------------->
<!-------------------------------------------------------------------- 스크립트 -------------------------------------------------------------------->
			
			
<!-------------------------------------------------------------------- 스크립트 끝 -------------------------------------------------------------------->
<!-- End of Main content -->
			
			<!-- Footer -->
			
			
			<!-- Main Content 끝 -->
			</div>
		<!-- Content Wrapper 끝 -->
		</div>
	<!-- Page Wrapper 끝 -->    
	</div>
</body>
</html>
