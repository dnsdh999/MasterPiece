<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='resource/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='resource/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='resource/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='resource/fullcalendar/packages/list/main.css' rel='stylesheet' />
<script src='resource/fullcalendar/packages/core/main.js'></script>
<script src='resource/fullcalendar/packages/interaction/main.js'></script>
<script src='resource/fullcalendar/packages/daygrid/main.js'></script>
<script src='resource/fullcalendar/packages/timegrid/main.js'></script>
<script src='resource/fullcalendar/packages/list/main.js'></script>
<script src='resource/js/calendar.js'></script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	
		<!-- SIDEBAR -->
		<%@include file="../common/project-sidebar.jsp" %>       
	
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
                    	    <h1 class="h3 mb-0 text-gray-800">[프로젝트 이름] 일정 및 캘린더</h1>
                    	</div>

						<div class="row">
						
							<div id='calendar'></div>
						
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
</body>

</html>