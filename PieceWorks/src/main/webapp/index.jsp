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
<p><button onclick="location.href='login.me'">Login</button></p>
<p><button id="chattingDetailForm">chattingDetailForm</button></p>
<p><button onclick="location.href='calendarTest3.ca'">캘린더 테스트</button></p>

</body>
<script>
document.getElementById('chatList').onclick = function(){
	window.open('chatList.ch', 'chattingList', 'width=500,height=460');
}
</script>


<script type="text/javascript">
	$('#chattingDetailForm').click(function(){
		window.open("chattingDetailForm.ch?chatWriter='aaa@naver.com'&anotherUserId='bbb@naver.com'&chatNo=10","채팅","width=400,height=500","toolbat=no,menubar=no, scrollbars=no,resizable=no","_blank");
	});
</script>
</html> 


