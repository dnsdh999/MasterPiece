<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PIECE WORKS</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	.form-invite { border-radius: 5px; }
	
	.btn-invite {
		width: 30%;
		margin-left: 35%;
		color: #fff;
  		background-color: #4e73df;
  		border-color: #4e73df;
  		border-radius: 5px;
	}
	
	.btn-invite:hover {
	 	color: #fff;
  		background-color: #2e59d9;
  		border-color: #2653d4;
	} 
	
</style>
</head>
<body id="page-top"> 
	<div id="detail-content" >
		<div id="invite" class="container text-gray-800"><br>
			<h2>참여자 초대</h2>
			<hr>
			<form action="inviteMember.pr" method="post" id="inviteForm">
				<div class="form-group">
				<br>
				<label class="mb-2">이메일</label>
					<div class="putEmailArea">
						<input type="email" class="form-email form-control-user mb-3" name="pMember" placeholder="참여자 이메일 입력">
						<input type="hidden" name="${project.projectNo}">
					</div>
	            </div>
				<label class="addList mb-2">참여자 리스트</label>
				<div>
					<div id="addMemberBox">
						<c:if test="${ empty joinProject.pMember }">
							<div class="text-gray-900 p-2">참여자가 없습니다.</div>
						</c:if>
						<c:if test="${ !empty joinProject.pMember }">
							
						</c:if>
					</div>
				</div>
				<input type="submit" class="btn btn-invite" id="invite" value="초대">
			</form>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>