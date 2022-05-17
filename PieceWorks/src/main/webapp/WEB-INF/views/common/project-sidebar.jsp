<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PIECE WORKS</title>

    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
  
	<style>
	.unreadMessage{
	color:white;
	border-radius:10px;
	text-align:center;
	background-color:red;
	display:inline-block;
	margin-left:8px;
	padding-left:4px;
	padding-right:3px;
	padding-top:1px;
	}
	
	.umControl{
	display:inline-block;
	}
	</style>
    <!-- Custom styles for this template-->
<!--     <link href="resource/css/sb-admin-2.min.css" rel="stylesheet"> -->
</head>



        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" style="height: 180px;">
                <img src="resource/img/logo_transparent.png" width="180px"> <!--  style="cursor: pointer" onclick="location.href='index.jsp'"-->
            </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <li class="nav-item active">
            <a class="nav-link" href="main.com">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>MAIN</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            MENU
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-user"></i>
                <span>내 정보</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">MY INFOMATIONS</h6>
                    <a class="collapse-item" href="myPageView.me">프로필</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-folder"></i>
                <span>프로젝트</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">DETAILS</h6>
                    <a class="collapse-item" href="pDetailViewBack.pr">상세 내역 및 일정</a>
                    <a class="collapse-item" href="fullCal.ca">캘린더</a>
<!--                     <a class="collapse-item" id="prjinvite">초대하기</a> -->
                   
                    <a class="collapse-item" id="chatList">채팅
                    	<div class="umControl" id="umControl">
                    		<div id="unreadMessage" class="unreadMessage"></div>
                    	</div>
                    </a>
                   
                    <a class="collapse-item" href="boardList.bo">게시판</a>
                    <a class="collapse-item" href="fileList.bo">파일함</a>
                </div>
            </div>
        </li>
	
		<script>
			$(function(){
				getPChatAlarmCount();
				
				setInterval(function(){
					getPChatAlarmCount();
				}, 5000);
			});
	
			
			document.getElementById('chatList').onclick = function(){
				window.open('chatList.ch', 'chattingList', 'width=500,height=560');
			}
			
			function getPChatAlarmCount(){
				$.ajax({
					url:'getPChatAlarmCount.ch',
					data:{projectNo:'${loginUser.currPno}'},
					success:function(data){
						console.log(data);
						if(data.trim() > 0){
							if(document.getElementById('umControl').innerHTML == ''){
								document.getElementById('umControl').innerHTML = '<div id="unreadMessage" class="unreadMessage"></div>';
							}
							document.getElementById('unreadMessage').innerHTML = data;
						}else{
							document.getElementById('umControl').innerHTML = '';
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			document.getElementById('prjinvite').onclick = function(){
				window.open('invitePrj.pr', '초대하기', 'width=500,height=260');
			}
		
		</script>
		
        <!-- Divider -->
        <hr class="sidebar-divider">

	        <!-- Sidebar Toggler (Sidebar) -->
	        <div class="text-center d-none d-md-inline">
	            <button class="rounded-circle border-0" id="sidebarToggle"></button>
	        </div>
        </ul>
        <!-- End of Sidebar -->
    

    <!-- Bootstrap core JavaScript-->
    <script src="resource/vendor/jquery/jquery.min.js"></script>
    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resource/js/sb-admin-2.min.js"></script>

<!-- </html> -->