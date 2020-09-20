<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<script>
    // 목표 : .sidebar에 .active를 추가하거나 제거한다
    // - 추가하거나 제거한다 = 토글한다 = toggle 명령을 사용
         function toggleSidebar() {
            var sidebar = document.querySelector(".sidebar");
            sidebar.classList.toggle("active"); // 클래스 리스트이므로 .을 안찍어도 됨
        }
        function sidebar_toggle(){
            var sidebar_toggle = document.querySelector(".sidebar_toggle");
            sidebar_toggle.classList.toggle("active");
        }
        function sidebar_toggle2(){
            var sidebar_toggle2 = document.querySelector(".sidebar_toggle2");
            sidebar_toggle2.classList.toggle("active");
        }
        function sidebar_toggle3(){
            var sidebar_toggle3 = document.querySelector(".sidebar_toggle3");
            sidebar_toggle3.classList.toggle("active");
        }
        function sidebar_toggleAll(){
            
            var sidebar_toggle = document.querySelector(".sidebar_toggle");
            sidebar_toggle.classList.remove("active");
            
            var sidebar_toggle2 = document.querySelector(".sidebar_toggle2");
            sidebar_toggle2.classList.remove("active");
            
            var sidebar_toggle3 = document.querySelector(".sidebar_toggle3");
            sidebar_toggle3.classList.remove("active");
        }
    </script>
<body>
    <aside class="sidebar">
        <ul class="list-group " style="width:100%">
            <li class="up_background" style="height: 100px; width: 250px;">
                <img src="${pageContext.request.contextPath}/resources/img/slogo.png" width="240px" height="100px">
            </li>

            <c:if test="${userinfo.student_auth eq '학생'}">
                <a class="nav-link nav-list-list" href="#" onclick="sidebar_toggle();">학생</a>
                    <ul class="nav flex-column sidebar_toggle nav-item-list"> 
                        <li class="nav-item " style="margin-left: 30px;">
                            <a class="nav-link" href="${pageContext.request.contextPath}/student/student_info?student_no=${userinfo.student_no}" style="color:white">학생정보</a>
                        </li>
                        <li class="nav-item" style="margin-left: 30px;">
                            <a class="nav-link" href="${pageContext.request.contextPath}/student/student_class_apply" style="color:white">수강신청</a>
                        </li>
                        <li class="nav-item" style="margin-left: 30px;">
                            <a class="nav-link" href="${pageContext.request.contextPath}/student/st_class_apply_list" style="color:white">내 수강신청 목록</a>
                        </li>
                        <li class="nav-item" style="margin-left: 30px;">
                             <a class="nav-link" href="${pageContext.request.contextPath}/student/student_schedule?student_no=${userinfo.student_no}" style="color:white">시간표</a>
                        </li>
                        <li class="nav-item" style="margin-left: 30px;">
                            <a class="nav-link" href="${pageContext.request.contextPath}/score/mylist?student_no=${userinfo.student_no}" style="color:white">성적확인</a>
                        </li>
                        <li class="nav-item" style="margin-left: 30px;">
                            <a class="nav-link" href="${pageContext.request.contextPath}/schoolonoff/off?student_no=${userinfo.student_no}" style="color:white">휴학신청</a>
                        </li>
                        <li class="nav-item" style="margin-left: 30px;">
                            <a class="nav-link" href="${pageContext.request.contextPath}/schoolonoff/on?student_no=${userinfo.student_no}" style="color:white">복학신청</a>
                        </li>

                    </ul>
                </c:if>
                
                <c:if test="${profeinfo.profe_auth eq '교수'}">    
	                <a class="nav-link nav-list-list" href="#" onclick="sidebar_toggle2();">교수</a>
	                    <ul class="nav flex-column sidebar_toggle2 nav-item-list">
	                        <li class="nav-item" style="margin-left: 30px;">
	                            <a class="nav-link" href="${pageContext.request.contextPath}/professor/detail?profe_no=${profeinfo.profe_no}" style="color:white">교수정보</a>
	                        </li>
	                        <li class="nav-item" style="margin-left: 30px;">
	                            <a class="nav-link" href="${pageContext.request.contextPath}/class_subject/regist" style="color:white">강의등록</a>
	                        </li>
	                        <li class="nav-item" style="margin-left: 30px;">
	                            <a class="nav-link" href="${pageContext.request.contextPath}/class_subject/list" style="color:white">강의목록</a>
	                        </li>
	                        <li class="nav-item" style="margin-left: 30px;">
	                            <a class="nav-link" href="${pageContext.request.contextPath}/class_subject/profeApplyList" style="color:white">수강목록</a>
	                        </li>
	                    </ul>
	                 </c:if>
	                 
                 <c:if test="${admininfo.admin_auth eq '관리자'}">               
	                 <a class="nav-link nav-list-list" href="#" onclick="sidebar_toggle3();">관리자</a>
		                    <ul class="nav flex-column sidebar_toggle3 nav-item-list">
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="${pageContext.request.contextPath}/client/list" style="color:white">입학학생 신청관리</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="${pageContext.request.contextPath}/client/join" style="color:white">학생 회원가입</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="${pageContext.request.contextPath}/professor/regist" style="color:white">교수 회원가입</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_student_list" style="color:white">학생 정보관리</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                             <a class="nav-link" href="#" style="color:white">회원관리</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/major_add" style="color:white">학과등록</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/classSubList" style="color:white">강의목록</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="#" style="color:white">휴학/복학관리</a>
		                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/off_list" style="color:white">휴학관리</a>
		                        </li>
		                        <li class="nav-item" style="margin-left: 30px;">
		                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/on_list" style="color:white">복학관리</a>
		                        </li>
		                    </ul>
	                    </c:if>
	                    
                    <div class="nav-empty">
                        
                    </div>
        </ul>
    </aside>
    <section class="container2">
        <div class="up_background container-fluid">
 
          	<button class="btn_slide" style="text-align: left;" onclick="toggleSidebar();">&#8801;</button>
<!-- 	            <form action="logout" method="post"> -->
					<c:if test="${userinfo.student_auth eq '학생'}">             
	                	<span class="col-8 title_font" style="text-align: right;">${userinfo.student_name}님 환영해요</span>
	                </c:if>
	                <c:if test="${admininfo.admin_auth eq '관리자'}">	                
	                	<span class="col-8 title_font" style="text-align: right;">${admininfo.admin_auth}님 환영해요</span>
	                </c:if>
	                <c:if test="${profeinfo.profe_auth eq '교수'}">	                
	                	<span class="col-8 title_font" style="text-align: right;">${profeinfo.profe_name}교수님 환영해요</span>
	                </c:if>
<!-- 	                <span class="col-4 title_font" style="text-align: center;">KH 대학교 -->
<%-- 	                <c:if test="${userinfo != null || admininfo != null}"> --%> 

	                <c:if test="${userinfo != null || profeinfo != null || admininfo != null}">	                
	                	<a href="${pageContext.request.contextPath}/member/logout"><img src="${pageContext.request.contextPath}/resources/img/logout2.png" width="35px" height="30px" style="margin-bottom: 12px;"></a>
	                </c:if>
<!-- 	                </span> -->
	                
<!-- 	        	</form> -->


