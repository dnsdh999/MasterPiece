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
	
 	#detailList {
 		margin-top: 20px;
 		margin-bottom: 20px;
/*  		float: right; */
 	}
 	
 	#listContainer{
 		float: right:
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
						<h3>${ list[0].pTitle } 상세 일정</h3>
						<form action="fullCal.ca">
						<input type="hidden" id="pNo" name="pNo" value="${ list[0].projectNo }">
						
							<div class="card-body">
							일정 생성<button id="btn" class="btn-open-popup7"><i class="fas fa-plus"></i></button>
								<div id="listContainer">
									<div id="detailList">
										<input type="checkbox" id="checkAll" onclick="checkAll();">전체 선택
										<input type="hidden" id="result">
	<!-- 									<div class="card border-bottom-primary shadow h-100 py-2"> -->
	<!-- 										<div class="card-body"> -->
	<!-- 											<div class="row no-gutters align-items-center"> -->
	<!-- 												<div class="col mr-2"> -->
	<!-- 													<div class="text-s font-weight-bold text-primary text-uppercase mb-1"> -->
	<!-- 													<input type="checkbox" value="title"> 제목 -->
	<!-- 													</div> -->
	<!-- 													<div class="text-s mb-0 font-weight-bold text-gray-800"> -->
	<!-- 													내용 -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
									</div>
									<div id="done">
										
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
<!-------------------------------------------------------------------- 컨텐츠 영역 끝 -------------------------------------------------------------------->
<!-------------------------------------------------------------------- 스크립트 -------------------------------------------------------------------->
			<script>
				$(function(){
					detail();
				});
				
				var pNo = ${list[0].projectNo};
				
				function detail(){
					$.ajax({
						url: 'getDetail.pr',
						data: {pNo:pNo},
						dataType: 'json',
						success: function(data){
							console.log(data);
							
							var detail = '';
							$('#detailList').html('');
							
							if(data.length > 0){
								for(var i in data){
									detail += '<div class="col-lg-12 mb-2">';
									detail += '<div class="card border-bottom-primary shadow h-100 py-2">';
									detail += '<div class="card-body">';
									detail += '<div class="row no-gutters align-items-center">';
									detail += '<div class="col mr-2">';
									detail += '<div class="text-s font-weight-bold text-primary text-uppercase mb-1">';
									detail += '<input type="hidden" value="' + data[i].calendarNo + '">';
									detail += '<input type="checkbox" name="chkSelect" value="' + data[i].calendarNo + '" onclick="Chk()"> ';
									detail += data[i].calTitle;
									detail += '</div><div class="text-s mb-0 font-weight-bold text-gray-800">';
									detail += data[i].calContent;
									detail += "</div></div></div></div></div></div>";
								}
								$('#detailList').append(detail);
							} else {
								detail += '<div class="col-lg-12 mb-2">';
								detail += '<div class="card border-bottom-primary shadow h-100 py-2">';
								detail += '<div class="card-body">';
								detail += '<div class="row no-gutters align-items-center">';
								detail += '<div class="col mr-2">';
								detail += '<div class="text-s font-weight-bold text-primary text-uppercase mb-1">';
								detail += '상세 일정이 아직 없습니다.';
								detail += '</div><div class="text-s mb-0 font-weight-bold text-gray-800">';
								detail += "</div></div></div></div></div></div>";
								
								$('#detailList').append(detail);
							}
						},
						error: function(data){
							console.log(data);
						}
					});
				};
			</script>
			<script>
// 				function Chk(){
// 					var result = Array();
// 					var count = 0;
// 					var chkBox = $('.chkSelect');
// 					for(var i in chkBox){
// 						if(chkBox[i].checked == true){
// 							result[count] = chkBox[i].val();
// 							count++;
// 						}
// 					}
// 					$('#result').val(result);
// 				}
				
// 				function checkAll(){
// 					var chkBox = $('.chkSelect');
// 					var chkAll = $('#checkAll');
// 					for(var i in chkBox){
// 						chkBox[i].check = chkAll.checked;
// 					}
// 					Chk();
// 				}
				function Chk(){
					
					var chkBoxValues = [];
					
					$("input[name='checkSelect']:checked").each(function(i) {
				        chkBoxValues.push($(this).val());
				    });

					var chkBox = chkBoxValues[0];
					
					console.log(chkBox);
					
					$.ajax({
						url: 'finished.pr',
						data: {chkBox:chkBox},
						dataType: 'json',
						success: function(data){
							alert('수정완료');
						},
						error: function(data){
							console.log('error');
						}
					});
				}
			</script>
<!-------------------------------------------------------------------- 스크립트 끝 -------------------------------------------------------------------->
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
