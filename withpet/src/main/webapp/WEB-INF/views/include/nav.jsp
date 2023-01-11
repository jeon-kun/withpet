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
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    </head>
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/main">With PET</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                
              <c:if test="${ member != null }">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">                
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="member/main">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Pet</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/pet/mypet" type="submit">My PET</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/pet/find">Find PET</a></li>
                                <li><a class="dropdown-item" href="#!">PET Album</a></li>
                            </ul>
                        </li>
                    </ul>
               </c:if> 
                
                <c:if test = "${member == null }">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">                
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/member/login">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/member/login">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">PET</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/member/login" type="submit">My PET</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/member/login">Find PET</a></li>
                                <li><a class="dropdown-item" href="/member/login">PET Album</a></li>
                            </ul>
                        </li>
                    </ul>
               </c:if> 
                    
                    <form class="d-flex">
                     <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <c:if test = "${member == null }">
                        <button class="btn btn-outline-dark" type="submit">
                           <a href ="/member/login">로그인</a>
                        </button>
                    </c:if> 
                    
                                    <!-- 로그인한 상태 -->
                <c:if test="${ member != null }">
                    <div class="login_success_area">
						

                        <span>회원 : ${member.name}</span>
                        <a id="gnb_logout_button">로그아웃</a>
                    </div>
                     <c:if test="${member.authority == 'ROLE_ADMIN' }">
                          <li class="nav-item"><a class="nav-link" href="/admin/main">관리자페이지</a></li>
                     </c:if>
                   		   <li class="nav-item"><a class="nav-link" href="#!">마이페이지</a></li>
                 </c:if>
					</ul>
                    </form>
                </div>
            </div>
        </nav>
        
        <script>
 
        /* gnb_area 로그아웃 버튼 작동 */
        $("#gnb_logout_button").click(function(){
           
            $.ajax({
                type:"POST",
                url:"/member/logout",
                success:function(data){
                    alert("로그아웃 성공");
                    document.location.reload();     
                    self.location="/main";
                } 
            }); // ajax 
        });
    
		</script>
</body>
</html>