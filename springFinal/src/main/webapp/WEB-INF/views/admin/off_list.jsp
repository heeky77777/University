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

<div class="container-fluid">
	<div class="row">
		<div class="offset-2 col-8">

			<table class="table table-sm table-hover">
				<thead class="thead-dark">
					<tr>
						<th>이름</th>
						<th>학과</th>
						<th>학번</th>
						<th>휴학</th>
						<th>휴학종류</th>
						<th>휴학 신청날짜</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="schoolOffDto" items="${list}">
						<tr>
							<td>${schoolOffDto.student_name}</td>
							<td>${schoolOffDto.major_no}</td>
							<td>${schoolOffDto.student_numb}</td>
							<td>${schoolOffDto.school_off_regist}</td>
							<td>${schoolOffDto.school_off_type}</td>
							<td>
							<fmt:parseDate value="${schoolOffDto.school_off_period }" var="time"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${time}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 검색창 -->
			<form action="union" method="post">

				<select name="type">
					<option value="student_name"
						${param.type == 'student_name' ? 'selected':''}>이름</option>
					<option value="major_no"
						${param.type == 'major_no' ? 'selected':''}>전공</option>
				</select> <input type="text" name="keyword" placeholder="검색어"
					value="${param.keyword}"> <input type="submit" value="검색">
			</form>
				
				</tbody>
				
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
		</div>
	</div>
</div>