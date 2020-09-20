<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
 href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">   
 
 <script>
 $(function(){
	    $("#tablesort").dataTable();
	});  
 </script>
<div class="container-fluid">
	<div class="row">
		<div class="offset-2 col-8">
			<br>
				<h1 class="form-group" style="text-align: center">입학신청 정보리스트</h1>
			<br>	
			<table class="table table-sm table-hover" id="tablesort">
				<thead class="thead-dark">
					<tr>
						
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>상세주소</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="studentinfoDto" items="${list}">
						<tr>
							
							<td>${studentinfoDto.stu_apply_name}</td>
							<td>${studentinfoDto.stu_apply_gender}</td>
							<td>
							<fmt:parseDate value="${studentinfoDto.stu_apply_birth}" var="time"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${time}" pattern="yyyy-MM-dd" />
							</td>
							<td>${studentinfoDto.stu_apply_phone}</td>
							<td>${studentinfoDto.stu_apply_email}</td>
							<td>${studentinfoDto.stu_apply_post}</td>
							<td>${studentinfoDto.stu_apply_addr}</td>
							<td>${studentinfoDto.stu_apply_extra_addr}</td>
							<td>
								<a href="${pageContext.request.contextPath}/student/student_join?stu_apply_no=${studentinfoDto.stu_apply_no}">회원가입</a>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
<!-- 			</table> -->

<!-- 			<!-- 검색창 -->
<!-- 			<form action="union" method="post"> -->

<!-- 				<select name="type"> -->
<!-- 					<option value="stu_apply_name" -->
<%-- 						${param.type == 'stu_apply_name' ? 'selected':''}>이름</option> --%>
<!-- 					<option value="stu_apply_phone" -->
<%-- 						${param.type == 'stu_apply_phone' ? 'selected':''}>전화번호</option> --%>
<!-- 				</select> <input type="text" name="keyword" placeholder="검색어" -->
<%-- 					value="${param.keyword}"> <input type="submit" value="검색"> --%>

<!-- 				</tr> -->
<!-- 				</tbody> -->
				</table>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>