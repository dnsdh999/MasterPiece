<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<link rel="stylesheet" href="resource/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resource/vendor/css/calbootstrap.min.css">
    <link rel="stylesheet" href='resource/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resource/vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="resource/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    
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
												  <!-- 일자 클릭시 메뉴오픈 -->
											        <div id="contextMenu" class="dropdown clearfix">
											            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
											                style="display:block;position:static;margin-bottom:5px;">
											                <li><a tabindex="-1" href="#">진행중</a></li>
											                <li><a tabindex="-1" href="#">진행전</a></li>
											                <li><a tabindex="-1" href="#">완료</a></li>
											                <li class="divider"></li>
											                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
											            </ul>
											        </div>
											
											        <div id="wrapper">
											            <div id="loading"></div>
											            <div id="calendar"></div>
											        </div>
											
											
											        <!-- 일정 추가 MODAL -->
											        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
											            <div class="modal-dialog" role="document">
											                <div class="modal-content">
											                    <div class="modal-header">
											                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
											                                aria-hidden="true">&times;</span></button>
											                        <h4 class="modal-title"></h4>
											                    </div>
											                    <div class="modal-body">
																	<input type="hidden" id="eventId">
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
											                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"/>
											                            </div>
											                        </div>
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="creator">작성자</label>
											                                <input class="inputModal" id="nickName" value="${ loginUser.nickName }" readonly/>
											                                <input type="hidden" id="email" value="${ loginUser.email }"/>
											                            </div>
											                        </div>
											
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="edit-title">일정명</label>
											                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
											                                    required="required" />
											                            </div>
											                        </div>
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="edit-start">시작</label>
											                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
											                            </div>
											                        </div>
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="edit-end">끝</label>
											                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
											                            </div>
											                        </div>
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="edit-type">구분</label>
											                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
											                                    <option value="진행전">진행전</option>
											                                    <option value="진행중">진행중</option>
											                                    <option value="완료">완료</option>
											                                </select>
											                            </div>
											                        </div>
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="edit-color">색상</label>
											                                <select class="inputModal" name="color" id="edit-color">
											                                    <option value="#e74a3b" style="color:#e74a3b;">빨간색</option>
											                                    <option value="#4e73df" style="color:#4e73df;">파란색</option>
											                                    <option value="#858796" style="color:#858796;">회색</option>
											                                    <option value="#1cc88a" style="color:#1cc88a;">초록색</option>
											                                    <option value="#36b9cc" style="color:#36b9cc;">민트색</option>
											                                    <option value="#f6c23e" style="color:#f6c23e;">노란색</option>
											                                    <option value="#495057" style="color:#495057;">검정색</option>
											                                </select>
											                            </div>
											                        </div>
											                        <div class="row">
											                            <div class="col-xs-12">
											                                <label class="col-xs-4" for="edit-desc">설명</label>
											                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
											                                    id="edit-desc"></textarea>
											                            </div>
											                        </div>
											                    </div>
											                    <div class="modal-footer modalBtnContainer-addEvent">
											                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
											                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
											                    </div>
											                    <div class="modal-footer modalBtnContainer-modifyEvent">
											                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
											                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
											                    </div>
											                </div><!-- /.modal-content -->
											            </div><!-- /.modal-dialog -->
											        </div><!-- /.modal -->
											
											        <div class="panel panel-default">
											
											            <div class="panel-heading">
											                <h3 class="panel-title">필터</h3>
											            </div>
											
											            <div class="panel-body">
											
											                <div class="col-lg-6">
											                    <label for="calendar_view">등록자별</label>
											                    <div class="input-group">
											                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="${ loginUser.nickName }"
											                                checked>${ loginUser.nickName }</label>
											                    </div>
											                </div>
											
											            </div>
											        </div>
											        <!-- /필터 부분. 추후 삭제 및 js 랜더 지우기(js따로만들어야함) -->
											
											</div>
										    <!-- /캘린더 container -->  
                                        
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 참여 중인 프로젝트 목록. 추후 for문 돌려서 개수만큼 불러올 것 -->
                        <div class="col-xl-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h5 class="m-0 font-weight-bold text-primary">프로젝트 목록</h5>
                                </div>
                                <!-- Card Body -->
                                <div id="pList">
                                </div>
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
						    <script src="resource/js/main.js"></script>
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
								pList += '<button type="submit" value="' + data[i].projectNo + '" class="btn-link">';
								pList += '</form>' + data[i].pTitle;
								pList += '</div><div class="text-s mb-0 font-weight-bold text-gray-800">';
								pList += data[i].pStartDate + " ~ " + data[i].pEndDate;
								pList += "</div></div></div></div></div></div></div>";

								
							}
							$('#pList').append(pList);
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
