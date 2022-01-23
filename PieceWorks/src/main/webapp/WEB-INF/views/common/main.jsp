<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PIECE WORKS MAIN</title>
    
    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resource/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resource/vendor/css/calbootstrap.min.css">
    <link rel="stylesheet" href='resource/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resource/vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="resource/css/main.css">
    
    <!-- 얘를 수정해야 modal창 안뜨는거 + 크기 줄어드는거 해결 가능 -->
    <link rel="stylesheet" href="resource/vendor/css/calbootstrap.min.css"> 
</head>
<style>
	.btn-link {
	    border: none;
	    outline: none;
	    background: none;
	    cursor: pointer;
	    color: #0000EE;
	    padding: 0;
	    text-decoration: underline;
	    font-family: inherit;
	    font-size: inherit;
	}
</style>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	
		<!-- SIDEBAR -->
		<%@include file="../common/main-sidebar.jsp" %>       
	
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
            <div id="content">
            
				<!-- TOPBAR -->
				<%@include file="../common/topbar.jsp" %>
	
<!-- 기능 작성 시작 부분 -->
					<!-- Begin Page Content -->
					<div class="container-fluid">
                	    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    	    <h1 class="h3 mb-0 text-gray-800">MAIN PAGE</h1>
                    	</div>

						<div class="row">
						
						<div class="col-xl-8">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h5 class="m-0 font-weight-bold text-primary">프로젝트 별 일정 요약</h5>
                                </div>
                                <!-- Card Body -->
                                <div>
                                    <div class="card-body">
                                        <div class="col-lg-12 mb-2">
                                        
                                        	<!-- 캘린더 container -->
					                        <div class="container">
											
										        <div id="wrapper">
										            <div id="loading"></div>
										            <div id="calendar"></div>
										        </div>
												<br>
											</div>
										    <!-- /캘린더 container -->  
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 참여 중인 프로젝트 목록 -->
                        <div class="col-xl-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h5 class="m-0 font-weight-bold text-primary">프로젝트 목록</h5>
                                </div>
                                <!-- Card Body -->
                                <div id="pList"></div>
                            </div>
                        </div>
						
						    <!-- 먼저 전체 화면에 대한 js불러온 후 -->
						    <!-- Bootstrap core JavaScript -->
						    <script src="resource/vendor/jquery/jquery.min.js"></script>
							<script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
							
							<!-- Core plugin JavaScript -->
						    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>
						
							<!-- Custom scripts for all pages -->
						    <script src="resource/js/sb-admin-2.min.js"></script>
							
							
							<!-- 캘린더 관련 js 불러와야 정상적으로 실행됨 -->
						    <script src="resource/vendor/js/jquery.min.js"></script>
						    <script src="resource/vendor/js/bootstrap.min.js"></script>
						    <script src="resource/vendor/js/moment.min.js"></script>
						    <script src="resource/vendor/js/fullcalendar.min.js"></script>
						    <script src="resource/vendor/js/ko.js"></script>
						    <script src="resource/vendor/js/select2.min.js"></script>
						    <script src="resource/vendor/js/bootstrap-datetimepicker.min.js"></script>
						    <script src="resource/js/mainPjCalendar.js"></script>
						    <script src="resource/js/addEvent.js"></script>
						    <script src="resource/js/editEvent.js"></script>
						    <script src="resource/js/etcSetting.js"></script>              
                   		</div>					
					</div>
					<!-- container-fluid 끝 -->
<!-- 기능 작성 끝 부분 -->
			
			</div>
			<!-- Main Content 끝 -->
					
				<!-- FOOTER -->
				<%@include file="../common/footer.jsp" %>
				
			</div>
			<!-- Content Wrapper 끝 -->
		</div>
		<!-- Page Wrapper 끝 -->    
		<script>
			$(function(){
				pList();
			});
			
			function pList(){
				$.ajax({
					url: 'pList.pr',
					type: 'post',
					dataType: 'JSON',
					success: function(data){
						console.log(data);
						
						var pList = '';
						$('#pList').html('');
						
						if(data.length > 0){
							for(var i in data){
								console.log(i);
								pList += '<div class="card-body">';
								pList += '<div class="col-lg-12 mb-2">';
								pList += '<div class="card border-bottom-primary shadow h-100 py-2">';
								pList += '<div class="card-body">';
								pList += '<div class="row no-gutters align-items-center">';
								pList += '<div class="col mr-2">';
								pList += '<div class="text-s font-weight-bold text-primary text-uppercase mb-1">';
								pList += '<form action="pDetailView2.pr" method="post">';
								pList += '<input type="hidden" name="pNo" value="' + data[i].projectNo + '">';
								pList += '<button type="submit" value="' + data[i].projectNo + '" class="btn-link font-weight-bold">';
								pList += '</form>' + data[i].pTitle;
								pList += '</div><div class="text-s mb-0 font-weight-bold text-gray-800">';
								pList += data[i].pStartDate + " ~ " + data[i].pEndDate;
								pList += "</div></div></div></div></div></div></div>";

								
							}
							$('#pList').append(pList);
						} else {
							$('#pList').html('<div class="card-body">'
												+ '<div class="col-lg-12 mb-2">'
												+ '<div class="row no-gutters align-items-center">'
												+ '<a style="text-align: center">진행 중인 프로젝트가 없습니다 </a>'
												+ '</div></div></div>');
						}
					},
					error: function(data){
						console.log(data);
					}
				});
			}
		
		</script>
</body>
</html>
