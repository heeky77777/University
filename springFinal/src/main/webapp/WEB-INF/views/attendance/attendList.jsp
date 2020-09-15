<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script>
	
	/* $(function() {
		$('.attendRegist-btn').click(function() {
			location.href="${pageContext.request.contextPath}/attendance/attendRegist/" ;
		})
	}) */


</script>

<<style>

	.row-empty {
	    height: 20px;
	}

</style>


<div class="container-fluid">
	
	<div class="row-empty"></div>

	<div>
		<h1>출결목록<h1>
	</div>
	
	<div class="text-right">
		<button class="btn btn-primary btn-sm attendRegist-btn">출결 등록</button>
	</div>
	<div class="">
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<c:forEach var="attendanceDto" items="${attendanceList}">
						<fmt:parseDate value="${attendanceDto.attend_date}" var="checkDate" pattern="yyyy-MM-dd HH:mm:ss" />
						<th>
							<fmt:formatDate value="${checkDate}" pattern="MM-dd" />
						</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="attendanceDto" items="${attendanceList}">e
					<tr>
						<td>${attendanceDto.student_name}</td>
						<td>${attendanceDto.attend_type}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



</div>




<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>