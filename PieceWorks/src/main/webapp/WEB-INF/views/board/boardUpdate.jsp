<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PIECE WORKS</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>

</head>
	
<style>
/* @import "compass/css3"; */

.custom-file-upload-hidden {
    display: none;
    visibility: hidden;
    position: absolute;
    left: -9999px;
}
.custom-file-upload {
color: black;
    display: block;
    width: auto;
    font-size: 16px;
    margin-top: 30px;
    label {
        display: block;
        margin-bottom: 5px;
    }
}

.file-upload-wrapper {
color: black;
    position: relative; 
    margin-bottom: 5px;
}
.file-upload-input {
    width: 495px;
    height:40px;
    color: black;
    font-size: 16px;
    padding: 11px 17px; 
    border: lightgray solid 1px;
    background-color: white; 
    @include transition(all 0.2s ease-in); 
    float: left; /* IE 9 Fix */
 	border-radius: 4px;
 	margin-right:10px;
}
.file-upload-button {
    cursor: pointer; 
    display: inline-block; 
  
    text-transform: uppercase;
    padding: 9px 15px; 
    border: none;
    margin-left: -1px;  
    
    float: left; /* IE 9 Fix */
    @include transition(all 0.2s ease-in);
   
}

#fileDiv{
	margin-top:-30px;
	margin-left:0px;
}

.text-right{ text-align: right; }

.comments-app{
  margin: 50px auto;
  max-width: 70%;
  padding: 0 50px;
  width: 100%;
}

.comments-app h1{
  color: #191919;
  margin-bottom: 1.5em;
  text-align: center;
  text-shadow: 0 0 2px rgba(152, 152, 152, 1);
}

.comment-form{  }
.comment-form .comment-avatar{  }

.comment-form .form{ margin-left: 100px; }

.comment-form .form .form-row{ margin-bottom: 10px; }
.comment-form .form .form-row:last-child{ margin-bottom: 0; }

.comment-form .form .input{
  background-color: #fcfcfc;
  border: none;
  border-radius: 4px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, .15);
  color: #555f77;
  font-family: inherit;
  font-size: 14px;
  padding: 5px 10px;
  outline: none;
  width: 100%;

  -webkit-transition: 350ms box-shadow;
  -moz-transition: 350ms box-shadow;
  -ms-transition: 350ms box-shadow;
  -o-transition: 350ms box-shadow;
  transition: 350ms box-shadow;
}

.comment-form .form textarea.input{
  height: 100px;
  padding: 15px;
}

.comment-form .form label{
  color: #555f77;
  font-family: inherit;
  font-size: 14px;
}

.comment-form .form input[type=submit]{
  background-color: #555f77;
  border: none;
  border-radius: 4px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, .15);
  color: #fff;
  cursor: pointer;
  display: block;
  margin-left: auto;
  outline: none;
  padding: 6px 15px;

  -webkit-transition: 350ms box-shadow;
  -moz-transition: 350ms box-shadow;
  -ms-transition: 350ms box-shadow;
  -o-transition: 350ms box-shadow;
  transition: 350ms box-shadow;
}

.comment-form .form .input:focus,
.comment-form .form input[type=submit]:focus,
.comment-form .form input[type=submit]:hover{
  box-shadow: 0 2px 6px rgba(121, 137, 148, .55);
}

.comment-form .form.ng-submitted .input.ng-invalid,
.comment-form .form .input.ng-dirty.ng-invalid{
  box-shadow: 0 2px 6px rgba(212, 47, 47, .55) !important;
}

.comment-form .form .input.disabled {
    background-color: #E8E8E8;
}


.comments{  }

.comment-form,
.comment{
  margin-bottom: 20px;
  position: relative;
  z-index: 0;
}

.comment-form .comment-avatar,
.comment .comment-avatar{
  border: 2px solid #fff;
  border-radius: 50%;
  box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
  height: 80px;
  left: 0;
  overflow: hidden;
  position: absolute;
  top: 0;
  width: 80px;
}

.comment-form .comment-avatar img,
.comment .comment-avatar img{
  display: block;
  height: auto;
  width: 100%;
}

.comment .comment-box{
  background-color: #fcfcfc;
  border-radius: 4px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, .15);
  margin-left: 100px;
  min-height: 60px;
  position: relative;
  padding: 15px;
}

.comment .comment-box:before,
.comment .comment-box:after{
  border-width: 10px 10px 10px 0;
  border-style: solid;
  border-color: transparent #FCFCFC;
  content: "";
  left: -10px;
  position: absolute;
  top: 20px;
}

.comment .comment-box:before{
  border-color: transparent rgba(0, 0, 0, .05);
   top: 22px;
}

.comment .comment-text{
  color: #555f77;
  font-size: 15px;
  margin-bottom: 25px;
}

.comment .comment-footer{
  color: #acb4c2;
  font-size: 13px;
}

.comment .comment-footer:after{
  content: "";
  display: table;
  clear: both;
}

.comment .comment-footer a{
  color: #acb4c2;
  text-decoration: none;

  -webkit-transition: 350ms color;
  -moz-transition: 350ms color;
  -ms-transition: 350ms color;
  -o-transition: 350ms color;
  transition: 350ms color;
}

.comment .comment-footer a:hover{
  color: #555f77;
  text-decoration: underline;
}

.comment .comment-info{
  float: left;
  width: 85%;
}

.comment .comment-author{ }
.comment .comment-date{ }

.comment .comment-date:before{
  content: "|";
  margin: 0 10px;
}

.comment-actions{
  float: left;
  text-align: right;
  width: 15%;
}


</style>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
	
		<!-- Sidebar -->
		<%@include file="../common/main-sidebar.jsp" %>
		<!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                 <%@include file="../common/topbar.jsp" %>
                <!-- End of Topbar -->
<!-- 기능 작성부분 -->
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">게시글 수정</h1>

                </div>
                
                <div style="margin-top:50px; margin-left:19%; margin-right:18%;">
               	<form action="boardUpdate.bo" enctype="multipart/form-data" method="post">
               		<input type="hidden" name="boardNo" value="${ board.boardNo }">
               		<input type="hidden" name="page" value="${ page }"> 		
                
	                 <div class="form-row">
					    <div class="col-md-6 mb-3">
					      <label for="validationServer01">글 제목</label>
					      <input name="boardTitle" type="text" class="form-control" style="background:white;"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${ board.boardTitle }"  required>
					     
					    </div>
					    
					  </div>
					  <div class="form-row">
					    <div class="col-md-3 mb-3">
					      <label for="validationServer02">작성자</label>
					      <input name="boardWriter" type="text" style="background:white;"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="validationServer02" value="${board.nickName }" required disabled> 
					    </div>
	  
					    <div class="col-md-3 mb-3">
					      <label for="validationServer05">작성일</label>
					      <input name="boardDate" type="text" class="form-control" style="background:white;" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="validationServer05" aria-describedby="validationServer05Feedback" required disabled value="${ board.boardDate }"> 
					    </div>
					  </div>
					  <div class="form-row" id="fileDiv">
						  <div class="mb-3">
						  <div class="custom-file-upload ">
							  <label for="validationServer01">첨부파일</label>
							   <div class="card" style="width: 600px;">				   					 	
							  <ul class="list-group list-group-flush">
							  	<!--------------------           파일                         -------------------- -->
							    <li class="list-group-item"> <!-- 파일추가 가능 -->
							  	 <input type="file" disabled>
							  	  <div class="form-group" id="file-list">
							        <a href="#this" onclick="addFile()" id="addFile">+ 파일추가</a>
							        <div class="file-group">
							            <input multiple="multiple" type="file" name="file"><a href='#this' class='addFile-delete'>삭제</a>
							        </div>
							     </div> 
							  	  </li>		
							  	  <c:if test="${ !empty fileBox }"> 
							  	  	<li class="list-group-item"><!-- 업로드한 파일이 있으면 보여주기 -->
								    		원본 파일<br>
								    		<c:forEach var="f" items="${fileBox}" >				    		
											    <a href="${ pageContext.servletContext.contextPath }/resource/buploadFiles/${ f.fChangeName }"
											    	download="${ f.fOriginName }">${ f.fOriginName }
											    </a>
											    <input type="hidden" value="${ f.fileNo }">
											    <a href='#this' class='originFile-delete'>삭제</a><br>							    		
											</c:forEach>
									</li>
								</c:if>						   
						  	</ul>
							</div>
						   </div>
						</div>
					 </div>
     
				  <div class="mb-3" width="500px">
				    <label for="validationTextarea"><b>글 내용</b></label>
				    
				    <textarea name="boardContent" style="resize: none; background:white;" rows="20" class="form-control" aria-label="Sizing example input" 
				    			aria-describedby="inputGroup-sizing-default" id="validationTextarea" required>${board.boardContent }</textarea>
				    <div align="right" style="margin-top:30px;  margin-bottom:50px">			    
				    <input class="btn btn-primary" type="submit" value="수정"> &nbsp;
				    <c:url var="boardList" value="boardList.bo">
						<c:param name="page" value="${ page }"/>
					</c:url>			
				   <button class="btn btn-danger" type="button" onclick="deleteBoard();">삭제</button>				   
				   </div>
				 </div>				 
				 <input type="hidden" id="deleteFilesNo" name="deleteFilesNo"> <!-- 어떤 파일번호를 가진 파일이 삭제됐는지 확인하기위해 추가 -->			
				</form>			
				<button class="btn btn-secondary" style="margin-left:90%;" onclick="location.href='boardList.bo'">목록으로</button>
			</div>


		<script>
		//파일 부분
		function addFile() {
	        var str = "<div class='file-group'><input type='file' multiple='multiple' name='file'><a href='#this' class='addFile-delete'>삭제</a></div>";
	      $("#file-list").append(str);
	    }
		
		$(document).on('click', '.addFile-delete', function(){
			$(this).parent().remove();
		});
		
		$(document).on('click', '.originFile-delete', function(){
			$('#deleteFilesNo').val($('#deleteFilesNo').val() + "/" + $(this).prev().val());
			
			$(this).next().remove(); //다음 요소를 지운다
			$(this).prev().remove(); //이전요소를 지운다
			$(this).prev().remove();
			$(this).remove();
		});

       	function deleteBoard(){
			var bool = confirm('정말 삭제하시겠습니까?');
		}
		       
		      
		 </script>
		<script>
			function deleteComm(){
				var bool = confirm("댓글을 삭제하시겠습니까?");
				if(bool == true){
					
				}else{
					
				}
			}
		</script>
		
		<script>
			function downloadFile(a){
				   console.log('안녕');
				   confirm(a + "(을)를 다운받으시겠습니까?");
			}
			
			function updateBoard(){
				alert('수정 function');
			}
		</script>
		
		<!-- <script>
		
		(function(){
			  'use strict';
			  
			  angular
			    .module('commentsApp', [])
			    .controller('CommentsController', CommentsController);
			  
			  // Inject $scope dependency.
			  CommentsController.$inject = ['$scope'];
			  
			  // Declare CommentsController.
			  function CommentsController($scope) {
			    var vm = this;
			    
			    // Current comment.
			    vm.comment = {};
		
			    // Array where comments will be.
			    vm.comments = [];
		
			    // Fires when form is submited.
			    vm.addComment = function() {
			      // Fixed img.
			      vm.comment.avatarSrc = 'http://lorempixel.com/200/200/people/';
		
			      // Add current date to the comment.
			      vm.comment.date = Date.now();
		
			      vm.comments.push( vm.comment );
			      vm.comment = {};
		
			      // Reset clases of the form after submit.
			      $scope.form.$setPristine();
			    }
		
			    // Fires when the comment change the anonymous state.
			    vm.anonymousChanged = function(){
			      if(vm.comment.anonymous)
			        vm.comment.author = "";
			    }
			  }
		
			})();
		
		</script>
 -->
<p></p><p></p>
            </div>    
               
            </div>
            <!-- End of Main Content -->
	<script>
	
	$(function () {
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var date = now.getDate();
        $('input[name=reviewDate]').val(year + '-' + month + '-' + date);
        $('input[name=reviewDate]').css('color', 'gray');
    });
	
	//Reference: 
	//https://www.onextrapixel.com/2012/12/10/how-to-create-a-custom-file-input-with-jquery-css3-and-php/
	;(function($) {

			  // Browser supports HTML5 multiple file?
			  var multipleSupport = typeof $('<input/>')[0].multiple !== 'undefined',
			      isIE = /msie/i.test( navigator.userAgent );

			  $.fn.customFile = function() {

			    return this.each(function() {

			      var $file = $(this).addClass('custom-file-upload-hidden'), // the original file input
			          $wrap = $('<div class="file-upload-wrapper">'),
			          $input = $('<input type="text" class="file-upload-input" readonly/>'),
			          // Button that will be used in non-IE browsers
			          //$button = $('<button type="button" class="file-upload-button btn btn-secondary btn-sm">파일 첨부</button>'),
			          // Hack for IE
			          $label = $('<label class="file-upload-button" for="'+ $file[0].id +'">파일 첨부</label>');

			      // Hide by shifting to the left so we
			      // can still trigger events
			      $file.css({
			        position: 'absolute',
			        left: '-9999px'
			      });

			      $wrap.insertAfter( $file )
			        .append( $file, $input, ( isIE ? $label : $button ) );

			      // Prevent focus
			      $file.attr('tabIndex', -1);
			      $button.attr('tabIndex', -1);

			      $button.click(function () {
			        $file.focus().click(); // Open dialog
			      });

			      $file.change(function() {

			        var files = [], fileArr, filename;

			        // If multiple is supported then extract
			        // all filenames from the file array
			        if ( multipleSupport ) {
			          fileArr = $file[0].files;
			          for ( var i = 0, len = fileArr.length; i < len; i++ ) {
			            files.push( fileArr[i].name );
			          }
			          filename = files.join(', ');

			        // If not supported then just take the value
			        // and remove the path to just show the filename
			        } else {
			          filename = $file.val().split('\\').pop();
			        }

			        $input.val( filename ) // Set the value
			          .attr('title', filename) // Show filename in title tootlip
			          .focus(); // Regain focus

			      });

			      $input.on({
			        blur: function() { $file.trigger('blur'); },
			        keydown: function( e ) {
			          if ( e.which === 13 ) { // Enter
			            if ( !isIE ) { $file.trigger('click'); }
			          } else if ( e.which === 8 || e.which === 46 ) { // Backspace & Del
			            // On some browsers the value is read-only
			            // with this trick we remove the old input and add
			            // a clean clone with all the original events attached
			            $file.replaceWith( $file = $file.clone( true ) );
			            $file.trigger('change');
			            $input.val('');
			          } else if ( e.which === 9 ){ // TAB
			            return;
			          } else { // All other keys
			            return false;
			          }
			        }
			      });

			    });

			  };

			  // Old browser fallback
			  if ( !multipleSupport ) {
			    $( document ).on('change', 'input.customfile', function() {

			      var $this = $(this),
			          // Create a unique ID so we
			          // can attach the label to the input
			          uniqId = 'customfile_'+ (new Date()).getTime(),
			          $wrap = $this.parent(),

			          // Filter empty input
			          $inputs = $wrap.siblings().find('.file-upload-input')
			            .filter(function(){ return !this.value }),

			          $file = $('<input type="file" id="'+ uniqId +'" name="'+ $this.attr('name') +'"/>');

			      // 1ms timeout so it runs after all other events
			      // that modify the value have triggered
			      setTimeout(function() {
			        // Add a new input
			        if ( $this.val() ) {
			          // Check for empty fields to prevent
			          // creating new inputs when changing files
			          if ( !$inputs.length ) {
			            $wrap.after( $file );
			            $file.customFile();
			          }
			        // Remove and reorganize inputs
			        } else {
			          $inputs.parent().remove();
			          // Move the input so it's always last on the list
			          $wrap.appendTo( $wrap.parent() );
			          $wrap.find('input').focus();
			        }
			      }, 1);

			    });
			  }

	}(jQuery));

	$('input[type=file]').customFile();
	</script>

            <!-- Footer -->
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

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

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</body>

</html>