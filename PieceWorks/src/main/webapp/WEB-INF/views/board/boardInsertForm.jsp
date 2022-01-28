<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	
	   <!--  <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>PIECE WORKS</title>
	
	    Custom fonts for this template
	    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    Custom styles for this template
	    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
		
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	  
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> -->
	</head>
	
	<style>
	 /* @import "compass/css3";  */
	
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
	    border: gray solid 1px;
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
	
	     <!-- Begin Page Content -->
	     <div class="container-fluid">
	
	     <!-- Page Heading -->
	     <h1 class="h3 mb-4 text-gray-800">게시글 작성</h1>

	     </div>
	                
	            <div style="margin-top:50px; margin-left:250px; margin-right:250px;">
	                <form class="was-validated" action="boardInsert.bo" enctype="multipart/form-data" method="post">
	                
	               <div class="form-row">
					    <div class="col-md-6 mb-3">
					      <label for="validationServer01">글 제목</label>
					      <input name="boardTitle" type="text" class="form-control is-valid" name="boardTitle" required>      
					    </div>
	    
	  			  </div>
				  <div class="form-row">
				    <div class="col-md-3 mb-3">
				      <label for="validationServer02">작성자</label>			     
				      <input type="text" class="form-control is-valid" id="boardWriter" value="${ loginUser.nickName }" required disabled>	      
				      <input type="hidden" name="boardWriter" value="${ loginUser.email }">
				    </div>
	  
					<div class="col-md-3 mb-3">
					   <label for="validationServer05">작성일</label>
					   <input type="text" class="form-control is-invalid" id="boardDate" aria-describedby="validationServer05Feedback" required name="reviewDate">   
					</div>
				  </div>
	  
<!-- 				   <div class="form-row" id="fileDiv">
					  <div class="mb-3">
						  <div class="custom-file-upload ">
						  	<label for="validationTextarea" >파일 첨부</label>
						   	<input type="file" id="file" name="file" multiple="multiple" />
						 </div>
					 </div>
				 </div> -->
				 
				 
				 
				  <div class="form-group" id="file-list">
			        <a href="#this" onclick="addFile()">+ 파일추가</a>
			        <div class="file-group">
			            <input multiple="multiple" type="file" name="file">
			            <a class="btn btn-secondary" href='#this' name='file-delete'>삭제</a>
			        </div>
			     </div> 


			    <br><br>
	     
				   <div class="mb-3" width="500px">
				    <label for="validationTextarea">글 내용</label>
				    <textarea name="boardContent" style="resize: none;" rows="20" class="form-control is-invalid" name="boardContent" placeholder="내용을 입력해주세요" required></textarea>		   
				  </div>
				  <div align="right" style="margin-bottom:50px;">				  
				  	 <input class="btn btn-info" type="submit" value="등록하기"> &nbsp;
				  	<button class="btn btn-primary" onclick="location.href='boardList.bo'">목록으로</button>
				  </div>

			 	</form>				  
			  </div>
	    </div>   
	              
     </div>
            <!-- End of Main Content -->
     
	<script type="text/javascript">
	
		function addFile() {
	        var str = "<div class='file-group'><br><input type='file' multiple='multiple' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
	      $("#file-list").append(str);
	        $("a[name='file-delete']").on("click", function(e) {
	            e.preventDefault();
	            deleteFile($(this));
	        });
	    }
	 
	    function deleteFile(obj) {
	        obj.parent().remove();
	    }
	
	    
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
			          $button = $('<button type="button" class="file-upload-button btn btn-secondary btn-sm">파일 첨부</button>'),
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
    <script src="resource/vendor/jquery/jquery.min.js"></script>
    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resource/js/sb-admin-2.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</body>

</html>