<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<p>메인페이지</p>
<p><button onclick="location.href='chattest.ch'">실시간 채팅 테스트</button></p>
<p><button onclick="location.href='chatForm.ch'">채팅폼</button></p>
<p><button id="chatList">채팅리스트</button></p>
<p><button onclick="location.href='common.com'">Common Form</button></p>
<p><button onclick="location.href='project.com'">Project Sidebar</button></p>
<p><button id="chattingDetailForm">chattingDetailForm</button></p>
<p><button onclick="location.href='loginView.me'">Login</button></p>

</body>
<script>
document.getElementById('chatList').onclick = function(){
	window.open('chatList.ch', 'chattingList', 'width=500,height=460');
}
</script>


<script type="text/javascript">
	$('#chattingDetailForm').click(function(){
		var roomId = prompt("방번호");
		var userId = prompt("로그인한아이디");
		window.open("chattingDetailForm.ch?chatNo="+roomId + "&chatWriter="+userId,"채팅","width=400,height=500","toolbat=no,menubar=no, scrollbars=no,resizable=no","_blank");
	});
</script>
</html> 


