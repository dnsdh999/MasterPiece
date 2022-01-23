<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<!-- Topbar -->
	<style>
		#msgStack{
		position: fixed;
    	right: 40px; bottom: 40px;
    	padding-top:500px;
    	}
    	
    	
	</style>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
 <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
	
	<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<c:choose>
					<c:when test="${ loginUser.reProfile eq null }">
						<img class="img-profile rounded-circle" id="profile" name="profile" style="margin-right: 10px" alt="프로필 사진" src="resource/img/undraw_profile.svg">
					</c:when>
					<c:otherwise>
						<img class="img-profile rounded-circle" id="profile" name="profile" style="margin-right: 10px" alt="프로필 사진" src="resource/profileFiles/${ loginUser.reProfile }">
					</c:otherwise>
				</c:choose>	
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">
					<c:out value="${ loginUser.nickName }"/> 님 환영합니다!
				</span>
			 </a>
			<!-- Dropdown - User Information -->
			<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
					<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						Logout
				</a>
			</div>
		</li>
		
		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none">
			<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-search fa-fw"></i>
			</a>
	                            
			<!-- Dropdown - Messages -->
		 	<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
			    	<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</li>
		<div id="msgStack" style="margin-top:30px;"></div>
		<!-- 
		<a class="dropdown-item d-flex align-items-center">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div>
					<div class="small text-gray-500">2021-12-29</div>
						<span class="font-weight-bold">남나눔님이 캘린더에 '프로젝트 시작일' 일정을 등록하였습니다.</span>
					</div>
				</a>
		 -->
	<script>
		function clicktoggle(){
			$.ajax({
				url:'getAlarmList.al',
				data:{projectNo:'${loginUser.currPno}'},
				dataType:'json',
				success:function(data){
					console.log(data);
					
					$alarmList = $("#alaramListDiv");
				    $alarmList.html("");
				    
					if(data.length>0){
						for(var i in data){
							$li = $([
								'<a class="dropdown-item d-flex align-items-center">'
		                        ,'<div class="mr-3">'
		                        ,'    <div class="icon-circle bg-primary">'
		                        ,'        <i class="fas fa-file-alt text-white"></i>'
		                        ,'            </div>'
		                        ,'			</div><div>'
		                        ,'				<div class="small text-gray-500">' + data[i].alarmDate +'</div>'
		                        ,'				<span class="font-weight-bold">'+ data[i].alarmContent +'</span>'				
		                        ,'            		</div>'
		                        ,'					</a>'
		                    ].join(''));   
		                  
		                    
		                    $alarmList.append($li);
						}

						
					}
				},
				error:function(data){
					console.log(data);
				}
			});
			
		}
		
		function getAlarmCount(){
			$.ajax({
				url:'getAlarmCount.al',
				data:{projectNo:'${loginUser.currPno}'},
				success:function(data){
					console.log(data);
					if(data.trim() > 0){
						document.getElementById('alertCount').innerHTML = data;
					}else{
						document.getElementById('alarmCounterControl').innerHTML = '';
						
					}
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		function showAllAlarm(){
			var newWindow = window.open('allAlarmList.al', '알림' , 'width=380, height=500, resizable=yes, scrollbars=yes, left=200, top=100');
			 newWindow.focus();
		}
		
		$(function(){
			getAlarmCount();
			
			setInterval(function(){
				getAlarmCount();
			}, 5000);
		});
	
		
		var sock = new SockJS("http://localhost:9580/pieceworks/alarm");
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		sock.onopen = onOpen;
	
		function sendMessage() {
			
		}
		
		
		function onMessage(msg) {
			
			var msgData = JSON.parse(msg.data);
			var msgContent = msgData.alarmContent;
			
			console.log(msgContent);
			
			$("#msgStack").html('');
			
		    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
		    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
		    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
		    toast += "</button><button type='button' class='btn-close' data-bs-dismiss='toast' aria-label='Close'></button>";
		    toast += "</div> <div class='toast-body'>" + msgContent + "</div></div>";
		    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
		    $(".toast").toast({"animation": true, "autohide": false});
		    $('.toast').toast('show');
		    
		}
		
		
		function onClose(evt) {
			console.log('나감');
		}
		
		
		function onOpen(evt) {
			console.log('들어옴');
		}
	
		function sendMsg(){
			console.log('전송클릭');
			sendMessage();
		}
		
	</script>
		<!-- Nav Item - Alerts -->
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" onclick="clicktoggle();" id="alertsDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="false" aria-expanded="true">
				<i class="fas fa-bell fa-fw"></i>
				<!-- Counter - Alerts -->
				<span id="alarmCounterControl">
				<span class="badge badge-danger badge-counter" id="alertCount"></span>
				</span>
			</a>
			<!-- Dropdown - Alerts -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="alertsDropdown">
				<h3 class="dropdown-header">
					Alerts Center
				</h3>
				<div id="alaramListDiv">
				<!-- <a class="dropdown-item d-flex align-items-center">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div>
					<div class="small text-gray-500">2021-12-29</div>
						<span class="font-weight-bold">남나눔님이 캘린더에 '프로젝트 시작일' 일정을 등록하였습니다.</span>
					</div>
				</a>
				<a class="dropdown-item d-flex align-items-center">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div>
					<div class="small text-gray-500">2021-12-29</div>
						<span class="font-weight-bold">남나눔님이 캘린더에 '프로젝트 시작일' 일정을 등록하였습니다.</span>
					</div>
				</a>-->
				</div>
				
				<a class="dropdown-item text-center small text-gray-500" onclick="showAllAlarm();">모든 알림 보기</a>
			</div>
		</li>
	
	</ul>
	
	</nav>
	<!-- End of Topbar -->


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃을 하시려면 아래의 '네' 버튼을 눌러주세요</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="loginView.me"> &nbsp; 네 &nbsp;</a>
                </div>
            </div>
        </div>
    </div>