<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>알림</title>

    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
    .align-items-center{
    	white-space : pre-line;
    }
    a{
    	height:120px;
    }
  	.sizingDiv{
    	height:140px;
    	vertical-align:middle;
    }
  	
  	
    .font-weight-bold{
    	margin-bottom:15px;
    }
    
    .bg-success{
    	margin-bottom:25px;
    }
    
    .closediv{
    	display:inline-block;
    }
    </style>
    </head>
    <body>

	
			<!-- Dropdown - Alerts -->
			<div
					aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">
					Alerts Center
				</h6>
				<c:forEach var="a" items="${ aList }">
				<a class="dropdown-item d-flex align-items-center" ondblclick="goDetail('${ a.projectNo }', '${ a.alarmType }');">
					<div class="mr-3">
						<c:if test="${ a.alarmStatus eq 'Y'}">
						<div class="icon-circle bg-warning">
						</c:if>
						<c:if test="${ a.alarmStatus eq 'N'}">
						<div class="icon-circle bg-success">
						</c:if>
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div class="sizingDiv" >
					<div class="small text-gray-500">${ a.alarmDate }</div><c:if test="${ a.alarmStatus eq 'Y'}"><button  class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span onclick="updateAlarmStatus(${ a.alarmNo });" aria-hidden="true">×</span>
                    </button></c:if>
						<span class="font-weight-bold">${ a.alarmContent }</span>
						
					</div>
				</a>
				</c:forEach>
				<!-- <a class="dropdown-item d-flex align-items-center" href="#">
	 				<div class="mr-3">
						<div class="icon-circle bg-success">
							<i class="fas fa-donate text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">2021-12-28</div>
							알림 내용 2
					</div>
				</a>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-warning">
							<i class="fas fa-exclamation-triangle text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">2021-12-28</div>
							알림 내용 3
						</div>
				</a>
				 -->
			</div>
		
	<script>
		function goDetail(projectNo, alarmType){
			alert(projectNo);
			alert(alarmType);
		}
		
		function updateAlarmStatus(alarmNo){
			location.href="updateAlarmStatus.al?alarmNo="+alarmNo;
		}

		 

	</script>
	
	
    <!-- Bootstrap core JavaScript-->
    <script src="resource/vendor/jquery/jquery.min.js"></script>
    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resource/js/sb-admin-2.min.js"></script>
    
    </body>
    
    