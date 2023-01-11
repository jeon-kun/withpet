<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.sql.*" %>
<html>
<style>


.login_success_area>a{
    font-size: 15px;
    font-weight: 900;
    display: inline-block;
    margin-top: 5px;
    background: #e1e5e8;
    width: 82px;
    height: 22px;
    line-height: 22px;
    border-radius: 25px;
    color: #606267;    
}
</style>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>withpet</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/pet.css" rel="stylesheet" />
        <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    </head>
    <body>
 <%@ include file="/WEB-INF/views/include/nav.jsp"%>
        <!-- Product section-->
        <form class="register-form" role="form" method="post" enctype="multipart/form-data">
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    	<input id="uploadFile" name="file" type="file" accept="image/*" class="form-control"  style="display: none" type = "file"  src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg">
							<button id="upload-btn" class="file-upload-btn" >
						
						<span class="upload-notice">코디 사진을 올려주세요</span>
						<span class="upload-notice">(*이미지 파일 1장만 가능)</span>	
						
						<!-- span 지우고 썸네일 이미지 덮어씌우기 -->
						<span id="img-result">
							<!-- img -->
						</span>
				</button>
                    </div>
                    <div class="col-md-6">
                        
                        <h1 class="display-5 fw-bolder">My PET ADD</h1>
                        <div class="fs-5 mb-5">
                             <div>name(이름)</div>
                            <input id = "name" name = "name" placeholder="이름을 입력해 주세요">
                            
                            <div>Sex (성별)</div>
                            <select id = "sex" name = "sex" >
                            <option value ="none" >-</option>
                            <option value="F">F</option>
                            <option value="M">M</option>
                            </select>
                            
                            <div>species(종)</div>
                            <input id = "species" name = "species" placeholder="종을 골라주세요">
                            
                            <div>age(나이)</div>
                            <input id = "age" name = "age"  placeholder= "나이를 입력해주세요" >
                            
                            <input type="hidden" name="mno" value='<c:out value="  ${member.mno}"/>'>
                            
                            
                          
                            
                                                        
                            
                            
                             
                           
                            
                            
                        </div>
                        
                        <div class="d-flex">
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" name = "register" id = "register-btn">
                                <i class="bi-cart-fill me-1"></i>
                                글쓰기
                            </button>
                            
             				 <button class="btn btn-outline-dark flex-shrink-0" type="submit" name = "cancle" id = "cancle-btn">
                                <i class="bi-cart-fill me-1"></i>
                                글쓰기 취소
                            </button>
                            
                            <!-- <input type="text" name="inputValue" id="inputValue" onchange="inputValueChange()" > -->
                        </div>
                    </div>
                </div>
            </div>
            </section>
            </form>
            
            <script>
 $(document).ready(function () {
	 
		var formData;
	    var fileInput;
	    var files;
	    var fileObj;
	    
	    
	});


	//버튼 클릭시 파일 업로드 실행
	$("#upload-btn").on("click", function (e) {
		e.preventDefault();
		$("#uploadFile").click();
		
	});


	//파일 업로드 on change
	$("input[type='file']").on("change", function(e) {
		alert("사진등록 완료");
		//썸네일 존재시 삭제
		if($("#remove-btn").length > 0){
			console.log("썸네일 존재시 삭제")
			$("#img-result").empty();	
			$(".thumbnail-btn").hide();
			$("span.upload-notice").show();
		}

		//formData; = new FormData();
	    fileInput = $('input[name="file"]');
	    files = fileInput[0].files;
	    fileObj = files[0];

	    
	  	//파일 확장자 체크
	    let regex = new RegExp("(.*?)\.(bmp|jpeg|jpg|gif|png)$"); //정규표현식
	    let maxSize = 5242880; //5MB
		
	    function fileCheck(fileName, fileSize) {
	    	
	        if (!regex.test(fileName)) {
	        	alert("사진 파일만 업로드할 수 있습니다.");	
	        	return false;
	        }
	        if(fileSize>maxSize){
	        	alert("5MB 이하의 크기만 업로드할 수 있습니다.");
	        	return false;
	        }
	        return true;
	    }
	    if (!fileCheck(fileObj.name, fileObj.fileSize)) {
	    	$('input[name="file"]').val("");
	    	$("#img-result").empty();
	    	$(".thumbnail-btn").hide();
			$("span.upload-notice").show();
	       return false;
	    }
	    

	  	//파일 확장자 검사 통과
	    //썸네일 이미지
	    var reader = new FileReader();
	    
	    reader.onload = function(event) {
	    	var img = document.createElement("img");
			 img.setAttribute("src", event.target.result)
			 img.setAttribute("style", "width:100%; height:100%;")
			 $("#img-result").empty();
			 document.querySelector("span#img-result").appendChild(img);
			 $(".thumbnail-btn").show();
			 $("span.upload-notice").hide();
		};
		reader.readAsDataURL(event.target.files[0])
		
	}); //end 파일 업로드 on change
 
	
//올리기 버튼 클릭
 $("#register-btn").on("click", function () {
 	
 	//파일 업로드
 	formData = new FormData();
 	formData.append("file", files[0]);
 	
 	console.log("파일은 " + files[0])

 	$.ajax({
 	    url:'/pet/upload',
 	    processData:false,
 	    contentType:false, //processData, contentType은 반드시 false
 	    data:formData,
 	    type:'post',
 	    dataType:'JSON',
 	    success:function(result) {
 	    	petImg = result; 
 	    	pet={
 		        "name" : $("input[name='name']").val(),
 		        "species" : $("input[name='species']").val(),
 		        "sex" :	$("#sex").val(),
 		        "age" : $("input[name='age']").val(),
 		        "mno" : $("input[name='mno']").val(),
 		        "filepath" : petImg.filepath,
 		        "filename" : petImg.filename,
 		        "uuid" :petImg.uuid
 			}
 	    	
 	    	
 	    	//코디 게시글 등록
 	    	$.ajax({           		  
 	    	    url:"/pet/registerpet",
 	    	    type:'post',
 	    	    data:JSON.stringify(pet),
 	    	    contentType:"application/json; charset=UTF-8",
 	    	    success: function (result, status, xhr) {
 	    	        
 	    	        alert("마이펫 등록 완료");
 	    	       self.location="/pet/mypet";
 	    	      
 	    	    },
 	    	    error: function (xhr, status, er) {
 	    	        console.log(xhr)
 	    	    }
 	    	}); //게시글 등록 ajax 끝    	
 	    },
 	    error : function(result, xhr) {
 	        console.log(xhr)
 	    }   
 	}); //end 파일 업로드 ajax 
 }) //end 올리기 버튼
            	

            
            /*글쓰기 취소  */
        	$("#cancle-btn").click(function(e) {
        		e.preventDefault();
        		location.href = "/pet/mypet";
        	});
            

/*  function inputValueChange(){
     var inputValue = document.getElementById('inputValue').value;
     var input = $("input[name = 'inputValue']").val()
     var name = $("input[name='name']").val()
 } */

            </script>
       
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resouces/js/pet.js"></script>
    </body>
</html>
