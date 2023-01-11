<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
#register{
	margin-left: 370px;
	margin-top : 50px;
	margin-bottom: -30px;
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
        
                        <div class="d-flex">
                            <button class="btn btn-outline-dark flex-shrink-0"  id = "register">
                                <i class="bi-cart-fill me-1"></i>
                                글쓰기
                            </button>
                        </div>
                                
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" />
                    	<c:forEach items="${ petlist}" var = "list">
                    	
                    	<div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img data-filepath="${list.filepath}" class = thumb src='' data-uuid="${list.uuid}" 
	                    			data-filename="${list.filename}" style="width : 253px; height : 150px;">

	                    	이름 : <c:out value = "${list.name}"/>
	                    	<br>
	                    	성별 : <c:out value="${list.sex}"/>
	                    	<br>
	                    	나이 : <c:out value="${list.age}"/>
	                    	<br>
	                    	 종 : <c:out value="${list.species}"/>
                    	
                    	</div>
                    	</div>
                    	
                    	
                    	</c:forEach>
                    
                    </div>

                </div>
            </div>
            </section>
            
<!--                                 <div class="col-md-6">
                        <div class="small mb-1"></div>
                        <h1 class="display-5 fw-bolder"></h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through"></span>
                            <span></span>
                        </div>
                       
                    </div> -->
            
            <script>
            /* 상품 등록 폼 */
            $("#register").on("click", function(e) {

            	e.preventDefault();

            	self.location="/pet/register";
            		

            });
            
            //이미지 불러오기
    		var aa = (function loadThumbnail() {
    			var uploadResultArr = $('.thumb');
    			
    			$(uploadResultArr).each(function (i, obj) {
    				//섬네일 파일을 불러오기 위한 경로
    				var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
    				// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
    				$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
    				})
    			})();
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
