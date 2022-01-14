<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>프로그램 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
  
    <style>
    	.h3 { margin-left: 9%; }
    	
         table { 
             border-collapse: collapse; 
             background: white; 
         } 
         table th { 
             border-bottom: 1px solid #e3e3e3; 
             text-align: center; 
             font-size: 15px; 
         } 
         table td { 
             border-bottom: 1px solid #e3e3e3; 
             text-align: center; 
             font-size: 15px; 
         } 
        .create {
            float: right;
        }
       
        .paging-area {
            justify-content: center;
            display: flex;
        }
    </style>
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
	<div class="title">
    	<h1 class="h3 mb-4 text-gray-800">프로그램 목록</h1>
    </div>
    <!-- Begin Page Content -->
    <div class="container-fluid" style="width:80%">
    	<div class="row">
    		<div class="col-12 col-md-12 col-lg-12">
    			<div class="card">
    				<div class="card-body">
						<table class="table" id="tb">
							<tr>
								<th style="width: 300px;">프로젝트 명</th>
					            <th style="width: 100px;">생성자</th>
					            <th style="width: 110px;">진행상황</th>
					            <th style="width: 170px;">시작 날짜</th>
							</tr>
							<c:forEach var="p" items="${ list }">
							<tr>
								<td align="center">${ p.pTitle }</td>
								<td align="center">${ p.pNickName }</td>
								<td align="center">${ p.pStatus }</td>
								<td align="center">${ p.pStartDate }</td>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="6" align="right" id="buttonTab">
									<button class="btn btn-primary create" onclick="location.href='pInsertView.pr';">새 프로젝트 생성</button>
								</td>
							</tr>
							</table>
							
							<!-- 페이징 처리 -->
							<div class="paging-area">
								<div class="buttons">
									<nav aria-label="Page navigation example">
										<ul class="pagination">
											<!-- 이전 버튼 -->
											<c:if test="${ pi.currentPage <= 1 }">
						                        <li class="page-item disabled">
						                        	<a class="page-link" aria-label="Previous">
						                        		<i class="fas fa-angle-left"></i>
					                                </a>
					                            </li>
						                     </c:if>
					                         <c:if test="${ pi.currentPage > 1 }">
						            	        <c:url var="before" value="pListView.pr">
						            	        	<c:param name="page" value="${ pi.currentPage - 1 }"/>
						            	        </c:url>
						            	        <li class="page-item">
						            	        	<a class="page-link" href="${ before }" aria-label="Previous">
						            	        		<i class="fas fa-angle-left"></i>
						            	        	</a>
						            	        </li>
						            	      </c:if>
						            	      <!-- 페이지 -->
						            	      <c:forEach var="page" begin="${ pi.startPage }" end="${ pi.endPage }">
						            	      	<c:if test="${ page eq pi.currentPage }">
	                                            	<li class="page-item">
	                                            		<a class="page-link">${ page }</a>
	                                            	</li>
	                                            </c:if>
												<c:if test="${ page ne pi.currentPage }">
								                	<c:url var="pagination" value="pListView.pr">
								                    	<c:param name="page" value="${ page }"/>
													</c:url>
							                        <li class="page-item">
							                        	<a class="page-link" href="${ pagination }">${ page }</a>
							                        </li>
							                    </c:if>
						                      </c:forEach>
						                      <c:if test="${ pi.currentPage >= pi.maxPage }">
												<li class="page-item disabled">
						                        	<a class="page-link" aria-label="Next">
						                            	<i class="fas fa-angle-right"></i>
						                            </a>
						                         </li>
												</c:if>
												<c:if test="${ pi.currentPage < pi.maxPage }">
													<c:url var="after" value="pListView.pr">
														<c:param name="page" value="${ pi.currentPage + 1 }" />
													</c:url>
													<li class="page-item">
	                                                    <a class="page-link" href="${ after }" aria-label="Next">
	                                                        <i class="fas fa-angle-right"></i>
	                                                    </a>
	                                                </li>
												</c:if>
						                </ul>
									</nav>
								</div>
							</div>
							<!-- 페이징 처리 끝-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			$('#tb tbody td').mouseenter(function(){
				$(this).parent().css({'color':'grey','font-weight':'bold', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css({'color':'black', 'font-weight':'normal'});
			}).click(function(){
				var pNo = $(this).parent().children().eq(0).text();
				location.href="pDetailView.pr?projectNo=" + pNo + '&page=' + ${pi.currentPage};
			});
		});
	</script>
<!-------------------------------------------------------------------- 컨텐츠 영역 -------------------------------------------------------------------->
<!-- End of Main content -->
			
			<!-- Footer -->
			<c:import url="../common/footer.jsp" />
			
			<!-- Main Content 끝 -->
			</div>
		<!-- Content Wrapper 끝 -->
		</div>
</body>
</html>