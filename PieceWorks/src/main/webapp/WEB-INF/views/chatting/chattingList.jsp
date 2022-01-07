<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ChattingForm</title>

    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resource/css/chatting-css.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>
<style>
	.topchatbar{
		display: flex;
		max-width : 50%;
		margin: 0;
		padding-left : 0.75rem;
		padding-right : 0.75rem;
		justify-content: space-between;
		font-size: 25px;
		margin-bottom: 15px;
		
	}
	.topchatbar .chatadd{
		color : white;
	}
	
	.card-body{
		width: auto;
		margin: 0 10px;
		padding-top : 0px;
		display: flex;
		/*justify-content: space-between;*/
	}
	.chatpreview{
		
		width: auto;
		margin: 0 10px;
		padding : 0 20px 0 20px;
		display: flex;
		/*justify-content: space-between;*/
		
	}
	
	#chat-more-button{
		position: absolute;
		display : none;
		width: 70px;
		background-color: white;
		border: 1px solid black;
	}
	.col-lg-6 {
    flex: 0 0 90%;
    max-width: 90%;
}
.topchatbar{
	    max-width: 90%;
}
	
	.inbox_people{
		width:100%;
	}
	
	.recent_heading{
		margin-top:10px;
	}
	
	.chatadd{
		margin-top:-5px;
		margin-right:-5px;
	}
	
	.timemargin{
		margin-right:23px;
	}
	.unreadMessage{
	color:white;
	border-radius:10px;
	text-align:center;
	width:20px;
	background-color:red;
	display:inline-block;
	margin-left:5px;
	}
	
	.unread{
	display:inline-block;
	}
	.chatTitle{
	display:inline-block;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.2.0/lodash.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function getChattingList(){
	
	
	$.ajax({
		url:'getChatList.ch',
		dataType:'json',
		success:function(data){
			console.log(data);
			
			$chatList = $("#wholeChatList");
		    $chatList.html("");
		    
			if(data.length>0){
				for(var i in data){
					$li = $([
						'<div class="chat_list"  ondblclick="chatDeatilGo('+ data[i].chatNo + ')">'
                        ,'<div class="chat_people">'
                        ,'    <div class="chat_img"></div>'
                        ,'        <div class="chat_ib">'
                        ,'            <h5 class="innerh5">'
                        ,'				<div class="chatTitle"></div><div class="unread"></div>'
                        ,'				<span class="chat_date"><div class="chat_dateDiv"></div><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"'
                        ,'				role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'				
                        ,'            		more'
                        ,'					</a>'	
                        ,'        <span class="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="navbarDropdown">'
                        ,'			<div class="outRoom"></div>'
                        ,'			<div class="modifyRoom"></div>'
                        ,'			<div class="deleteRoom"><div>'	
                        ,'    	</span></span></h5>'
                        ,'		<p class="chatmeg"></p>'		
                        ,'</div></div></div>'
                    ].join(''));   
                  
					$li.find(".chat_list").attr("onclick", 'chatDetailGo(' + data[i].chatNo + ')');

                	if(data[i].joinMember.length > 2){
                		$li.find(".chat_img").html('<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">');
                	}else{
                		$li.find(".chat_img").html('<img src="https://mblogthumb-phinf.pstatic.net/20151212_254/julielove450_1449914547821gAtcQ_PNG/20151212_1850201.png?type=w2" alt="sunil">');
                	}
                	
                	var chatMemStr = "";
                	if(data[i].chatTitle == null){
                		for(var j in data[i].joinMember){
                			if("${ loginUser.email }" != data[i].joinMember[j].chatMember){
                				chatMemStr += data[i].joinMember[j].memberName + " ";
                			}
                		}
                		$li.find(".chatTitle").text(chatMemStr);
                	}else{
                		$li.find(".chatTitle").text(data[i].chatTitle);
                	}
                	
                	if(data[i].unreadCount > 0){
                		$li.find(".unread").html('<div class="unreadMessage">' + data[i].unreadCount + '</div>');
                	}
                	
                	if(data[i].sendDate >= "${ today }"){
                		$li.find(".chat_dateDiv").text(data[i].sendTime);
                	}else{
                		$li.find(".chat_dateDiv").text(data[i].sendDate);
                	}
                	
                	$li.find(".outRoom").html('<a class="dropdown-item" id="chatExit" data-toggle="modal" data-target="#chatExitModal">나가기</a>');
                    
                    if(data[i].joinMember.length > 2 && "${ loginUser.email }" == data[i].chatCreator){
                    	$li.find('.modifyRoom').html('<a class="dropdown-item" id="chatNameChange" data-toggle="modal" data-target="#chatNameChangeModal"  onclick="modifyRoomName(' + data[i].chatNo + ', `' + data[i].chatTitle + '`)"' + '>이름수정</a>');
                    }																																						
                    
                    
                    if("${ loginUser.email }" == data[i].chatCreator){
                    	$li.find('.deleteRoom').html('<a class="dropdown-item" id="chatDelete" data-toggle="modal" data-target="#chatDeleteModal">삭제</a>');
                    }
                    
                    $li.find(".chatmeg").text(data[i].chatMessage);
                    
                    $chatList.append($li);
				}

				
			}else{
				
				
				
			}
			
		},
		error:function(data){
			console.log(data);
		}
	});
}

$(function(){
	getChattingList();
	
	setInterval(function(){
		getChattingList();
	}, 5000);
});


function chatDeatilGo(num){
	document.getElementById("chatNumber").value = num;
	 var newWindow = window.open('chattingDetailForm.ch', '채팅' , 'width=400, height=500, resizable=yes, scrollbars=yes, left=200, top=100');
	 newWindow.focus();
	 frm.target="채팅";
	 frm.submit();
}

function modifyRoomName(num, title){
	if(title == 'undefined'){
		document.getElementById("exampleModalLabelchange").value = '새로운 채팅방 이름 입력';
	}else{
		document.getElementById("exampleModalLabelchange").value = title;
	}
	
	document.getElementById("chatNumber").value=num;

	//if(yesorno == true){
	//	location.href="chattingInvite.ch?emails="+chk_id+"&roomName="+roomName+"&memberNames="+memberName;
	//	alert("채팅방이 생성되었습니다.");
	//}
}

function updateChatName(){
	var chatNum = document.getElementById("chatNumber").value;
	var chatTitle = document.getElementById("exampleModalLabelchange").value;
	
	var yesorno = confirm(chatTitle + "로(으로) 채팅방 이름을 변경하시겠습니까?");
	if(yesorno == true){
	location.href="updateChatTitle.ch?chatNo="+chatNum+"&chatTitle="+chatTitle;
	}
	
}
</script>
<body id="page-top">
	<form action="chattingDetailForm.ch" method="post" name="frm">
	<input type="hidden" id="chatNumber" name="chatNo">
	</form>
	
	<div class="inbox_people">
	  <div class="headind_srch">
		<div class="recent_heading">
		  <h4>채팅</h4>
		</div>
		<div class="srch_bar">
		  <div class="stylish-input-group">
<!-- 			 <input type="text" class="search-bar"  placeholder="Search" > -->
			<div class="chatadd">
						<div class="my-2"></div>
                                    <a href="#" class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                          	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
  <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
</svg>
                                        </span>
                                        <span class="text" id="chatAdd" data-toggle="modal" data-target="#chatAddModal">채팅방 만들기</span>
                                    </a>
					</div>
			</div>
		</div>
	  </div>
	  <div id="wholeChatList">
	</div>
	  </div>
		
		


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
	 <!-- chatAdd Modal-->
	    <div class="modal fade" id="chatAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방 만들기</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="modal-body">
							<div class="input-group">
	                            <input type="text" id="chatRoomName" class="form-control bg-light border-0 small" placeholder="채팅방 이름 ..."
	                                aria-label="Search" aria-describedby="basic-addon2">
	                        </div>
	                        
	                        <div class="dropdown-divider"></div>
	                        
	                        <div>
					<input type="checkbox" name="checkChat" value="zz@zz" class="projectmem">
					<input type="hidden" value="건강강" name="memname">
						<svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
					건강강</div>
					<div class="dropdown-divider"></div>
					<div><input type="checkbox" name="checkChat" value="xx@xx" class="projectmem">
					<input type="hidden" value="대담도" name="memname">
						<svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
					대담도</div>
					<div class="dropdown-divider"></div>
					<div><input type="checkbox" name="checkChat" value="aa@aa" class="projectmem">
					<input type="hidden" value="미미문" name="memname">
						<svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
					미미문
				</div>
				<div class="dropdown-divider"></div>
					<div><input type="checkbox" name="checkChat" value="ee@ee" class="projectmem">
					<input type="hidden" value="윤오남" name="memname">
						<svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
					윤오남
				</div>
				<div class="chatBottom" align="right"><input class="chatAllBottom" type="checkbox" name="allCheck">전체선택 </div>
				<script type="text/javascript">
					$('.chatAllBottom').click(function(){
						
						if($('.chatAllBottom').prop("checked")){
							$('input[type=checkbox]').prop('checked',true);
						}else{
							$('input[type=checkbox]').prop('checked',false);
						}
					});	
				</script>
	                        
					</div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" onclick="invite();">초대하기</a>
	                </div>
	                
	                <script>
	                	function invite(){
	                		var chk_id = [];
	                		var memberName = [];
	                		
	                		$(".projectmem:checked").each(function(){
	                			var id = $(this).val();
	                			var name = $(this).next().val();
	                			memberName.push(name);
	                			chk_id.push(id);
	                			});
	                		
	                		var roomName = document.getElementById("chatRoomName").value;
	                	
	                		var yesorno = confirm("입력한 정보로 채팅방을 생성하시겠습니까?");
	                		if(yesorno == true){
	                			location.href="chattingInvite.ch?emails="+chk_id+"&roomName="+roomName+"&memberNames="+memberName;
	                			alert("채팅방이 생성되었습니다.");
	                		}
	                	}
	                </script>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 나가기 Model -->
	    <div class="modal fade" id="chatExitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방을 나가시겠습니까?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" href="login.html">나가기</a>
	                </div>
	               
	            </div>
	        </div>
	    </div>
	    
	    <!-- 채팅방 이름수정 Model -->
	    <div class="modal fade" id="chatNameChangeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방 이름 수정</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="input-group">
	                            <input type="text" class="form-control bg-light border-0 small" placeholder="채팅방 이름..."
	                                aria-label="Search" aria-describedby="basic-addon2" value="채팅방 이름" id="exampleModalLabelchange">
	                        </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
	                    <a class="btn btn-primary" onclick="updateChatName();">수정</a>
	                </div>
	               
	            </div>
	        </div>
	    </div>
	    
	    <!-- 채팅 삭제 Model -->
	    <div class="modal fade" id="chatDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방을 삭제하시겠습니까?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" href="login.html">삭제하기</a>
	                </div>
	               
	            </div>
	        </div>
	    </div>
		    <!-- Bootstrap core JavaScript-->
		    <script src="resource/vendor/jquery/jquery.min.js"></script>
		    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		    <!-- Core plugin JavaScript-->
		    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		    <!-- Custom scripts for all pages-->
		    <script src="resource/js/sb-admin-2.min.js"></script>

<!-- 인클루드 넣을자리 -->

</body>
</html>