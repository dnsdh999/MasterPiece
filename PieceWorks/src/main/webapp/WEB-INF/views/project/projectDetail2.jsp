<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script src="${ contextPath }/resources/js/jquery-3.6.0.min.js"></script>  -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
	.h3 { margin-left: 1%; }
		
	#projectDetail {
		float: left;
	}
	
	#detail-content {
		display: flex; 
		flex-wrap: wrap; 
		justify-content: space-evenly;
	}
	
	label {font-weight: bold;}
	
  	#detailList { 
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
	
	#Participant { 
		float: right; 
		text-align: center;
		margin-right: 5%;
	}
	
	.card {
		width: 600px;
		float: left;
		margin-right: 15px;
		margin-bottom: 15px;
	}
	
	#memberList {
		width: 400px;
		float: right;
	}
	
	#btn {
		border: 0px;
		background: none;
		color: #4e73df;
	}

	#msgStack{
		position: fixed;
    	right: 40px; bottom: 40px;
    	padding-top:500px;
   	}
    	
	
 	.img-profile { 
		height: 2rem;
    	width: 2rem;
    	border-radius: 50%;
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
	<div id="page-wrapper">
	
	<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- SIDEBAR -->
		<c:import url="../common/project-sidebar.jsp" />      
	
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
            <div id="content">
            
				<!-- TOPBAR -->
<%-- 				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
	
	<!-- Topbar -->
	
	
<!-- 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
 	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script> -->
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

<!-------------------------------------------------------------------- 컨텐츠 영역 -------------------------------------------------------------------->
<!-- 			<div class="container-fluid"> -->
<!-- 				<div id="detail-content" > -->
<!-- 					<div id="projectDetail" class="container text-gray-800"> -->
<%-- 						<h3>${ list[0].pTitle } 상세 일정</h3> --%>
<!-- 						<br> -->
<!-- 						<form action="fullCal.ca" method="post"> -->
<%-- 						<input type="hidden" id="pNo" name="pNo" value="${ list[0].projectNo }"> --%>
						
<!-- 							<div class="card-body"> -->
<!-- 							일정 생성 & 일정 수정<button type="submit" id="btn" class="btn-open-popup7"><i class="fas fa-plus"></i></button> -->
<!-- 								<div id="listContainer"> -->
<!-- 									<div id="detailList"> -->
<!-- 										<input type="checkbox" id="checkAll" onclick="checkAll();">전체 선택 -->
<!-- 										<input type="hidden" id="result"> -->
<!-- 									</div> -->
<!-- 								<div id="done"></div> -->
<!-- 							</div> -->
<!-- 								<div id="done"></div> -->
<!-- 							</div> -->
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
				<div class="container-fluid">
                	    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    	    <h1 class="h3 mb-0 text-gray-800">${ list[0].pTitle } 상세 내용</h1>
                    	    <div style="text-align: right;">${ list[0].pContent }</div>
                    	</div>
<!--                     	<br> -->
                    	
                    	<div class="row">
                    	
                    		<form action="fullCal.ca" method="post"> 
							<input type="hidden" id="pNo" name="pNo" value="${ list[0].projectNo }">
							
								<div class="card-body">
<!-- 								일정 생성 & 일정 수정<button type="submit" id="btn" class="btn-open-popup7"><i class="fas fa-plus"></i></button> -->
									<button type="submit" class="btn btn-info btn-icon-split">
										<span class="icon text-white-600">
											<i class="fas fa-plus"></i>
										</span>
										<span class="text">일정 생성 & 일정 수정</span>
									</button>
									
				<div class="title">
					<h3 class="h3 mb-4 text-gray-800">${ list[0].pTitle } 상세 일정</h3>
				</div>
				<div id="detail-content" >
					<div id="projectDetail" class="container text-gray-800">
						<form action="fullCal.ca">
							<input type="hidden" id="pNo" name="pNo" value="${ list[0].projectNo }">
							<div>
								<div class="card-body">
									일정 생성<button id="btn" class="btn-open-popup7"><i class="fas fa-plus"></i></button>
									<div id="listContainer">
										<div id="detailList">
											<input type="checkbox" id="checkAll" onclick="checkAll();">전체 선택
											<input type="hidden" id="result">
										</div>
									<div id="done"></div>
								</div>
									<div id="done"></div>
								</div>
							</form>
                    	</div>
                    </div>
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
										<div id="done"></div>
									</div>
								</div>
							</div>
						</form>
							<div id="Participant" class="col-xl-3 col-md-4 mb-4">
								<div class="card shadow mb-4" id="memberList">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">참여자 목록</h6>
								</div>
								<div class="card-body">
								<c:forEach var="p" items="${ list }">
									<c:choose>
										<c:when test="${ p eq null }">
											<div class="text-gray-900 p-3">참여자가 없습니다.</div>
										</c:when>
										<c:when test="${ p ne null }">
	<%-- 									<c:otherwise> --%>
											<div class="text-gray-900 p-3">
												<div class="psImg">
												<c:choose>
													<c:when test="${ member.reProfile eq null }">
														<img class="img-profile rounded-circle" id="profile" name="profile" alt="프로필 사진" src="resource/img/undraw_profile.svg">
													</c:when>
													<c:otherwise>
														<img class="img-profile rounded-circle" id="profile" name="profile" alt="프로필 사진" src="resource/profileFiles/${ member.reProfile }">
													</c:otherwise>
												</c:choose>	
												</div>
												<div class="psName">${ p.pNickName }</div>
											</div>
	<%-- 									</c:otherwise> --%>
										</c:when>
									</c:choose>
								</c:forEach>
									<div class="text-gray-900 p-3">
										<div class="d-grid gap-2 col-12 d-md-block" align="center">
											<button type="button" class="btn btn-dark" id="invite" data-toggle="modal" data-target="#projectMemberAddModal">초대하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						<!-- 초대하기 model -->
						 <div class="modal fade" id="projectMemberAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				        	aria-hidden="true">
				         <div class="modal-dialog" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="exampleModalLabel">프로젝트 초대하기</h5>
				                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
				                        <span aria-hidden="true">×</span>
				                    </button>
				                    <div class="dropdown-divider"></div>
				                </div>
				                <div class="modal-body">
					                <div class="input-group">
					                	<input type="text" id="emailSearch" class="form-control bg-light border-0 small" placeholder="이메일검색 ..."
					                           aria-label="Search" aria-describedby="basic-addon2">
					                </div>
					                <div id="addMemberList">
					                <c:forEach var="p" items="${ Memberlist }">
					             		<div class="text-gray-900 p-3">
					              		   <input type="checkbox" name="userEmail" value="${ p.email }">
												<div class="psImg">
													<c:choose>
														<c:when test="${ Member.reProfile eq null }">
															<img class="pImg" id="profile" name="profile" alt="프로필 사진" src="resource/img/undraw_profile.svg">
													 </c:when>
														 <c:otherwise>
																<img class="pImg" id="profile" name="profile" alt="프로필 사진" src="resource/profileFiles/${ Member.reProfile }">
														 </c:otherwise>
													</c:choose>
												</div>
												<div class="psName">${ p.email }</div>
										</div>
					                 </c:forEach>
									</div>
								</div>
				                <div class="chatBottom" align="right"><input class="chatAllBottom" type="checkbox" name="allCheck">전체선택 </div>
								<div class="modal-footer">
				                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				                    <span  id="addMember" class="btn btn-primary">초대하기</span>
				                </div>
				            </div>
				        </div>
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
// 									detail += '<input type="checkbox" name="chkSelect" value="' + data[i].calendarNo + '" onclick="Chk()"> ';
									detail += data[i].calTitle;
									detail += '</div><div class="text-s mb-0 text-gray-800">';
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
				
				$('.chatAllBottom').click(function(){
					if($('.chatAllBottom').prop("checked")){
						$('input[type=checkbox]').prop('checked',true);
					}else{
						$('input[type=checkbox]').prop('checked',false);
					}
				});	
				
				$('#emailSearch').keyup(function(){
					var email = $('#emailSearch').val();
					var projectNo = "${projectNo}";
					console.log(email);
					$.ajax({
						url:'emailSearch',
						data:{email:email,projectNo:projectNo},
						success:function(data){
							console.log(data);
							$('#addMemberList').empty();
							 for ( var i in data) {
								$('#addMemberList').append("<div class='text-gray-900 p-3'><input type='checkbox' name='userEmail' value="+data[i].email+"> <div class='psImg'>"
										+(data[i].reProfile==null?"<img class='pImg' id='profile' name='profile' alt='프로필 사진' src='resource/img/undraw_profile.svg'>"
												: "<img class='pImg' id='profile' name='profile' alt='프로필 사진' src='resource/profileFiles/"+data[i].reProfile+"'>")+
										"</div> <div class='psName'>"+data[i].email+"</div></div>");
							} 
						},
						error:function(data){
							console.log(data);
						}
					});
				});
			</script>
<!-------------------------------------------------------------------- 스크립트 끝 -------------------------------------------------------------------->
<!-- End of Main content -->
			<!-- Main Content 끝 -->
			</div>
			
			<!-- Main Content 끝 -->
			</div>
			
			<!-- Footer -->
			<c:import url="../common/footer.jsp" />
		
		<!-- Content Wrapper 끝 -->
			<!-- Footer -->
			<c:import url="../common/footer.jsp" />
			
			<!-- Content Wrapper 끝 -->
			</div>
		<!-- Wrapper 끝 -->    
		</div>
	<!-- Page Wrapper 끝-->
	</div>
</body>
</html>