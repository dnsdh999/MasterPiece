<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--     <title>FullCalendar</title> -->
    
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
				<%@include file="../common/project_topbar.jsp" %>
	
<!-- 기능 작성 시작 부분 -->
					<!-- Begin Page Content -->
					<div class="container-fluid">
                	    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    	    <h1 class="h3 mb-0 text-gray-800">${ list[0].pTitle } 일정</h1>
                    	    <input type="hidden" id="pNo" name="pNo" value="${ list[0].projectNo }">
                    	</div>

						<div class="row">
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
<!-- 						                                    <option value="#858796" style="color:#858796;">회색</option> -->
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
						                    <label for="calendar_view">진행도별</label>
						                    <div class="input-group">
						                        <select class="filter" id="type_filter" multiple="multiple">
						                            <option value="진행전">진행전</option>
						                            <option value="진행중">진행중</option>
						                            <option value="완료">완료</option>
						                        </select>
						                    </div>
						                </div>
						            </div>
						        </div>
						        <!-- /.filter panel -->
						    </div>
						    <!-- /.container -->
						    
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
</body>

</html>