<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script>

	$(function() {

		$('.applyList-btn').click(function() {
			location.href = "${pageContext.request.contextPath}/class_subject/profeApplyList";
		})
		
	})
	
	


</script>

<style>

	.row-empty {
	    height: 20px;
	}
	
	.attendRegist-btn,
	.applyList-btn {
	    background-color: #063E7A;
	    border-color: #063E7A;
	}

	.attendRegist-btn:hover,
	.applyList-btn:hover {
	    background-color: #1D5798;
	}
	
	.btn,
	.form-control {
	    margin: 5px;
	}
	
	.form-group {
	    margin-bottom: 10px;
	}
</style>


<div class="container-fluid">
	
	<div class="row-empty"></div>

	<div>
		<h1>출결목록<h1>
	</div>
	
	
	<div class="row-empty"></div>
	
	<div class="text-center">
		<form action="${pageContext.request.contextPath}/attendance/attendList/${class_sub_no}/${subject_apply_no}" method="post">
	
			<div class="text-right">
				<button type="button" class="btn btn-primary applyList-btn">수강 목록</button>
				<button type="submit" class="btn btn-primary attendRegist-btn">출결 등록</button>
			</div>
			<div class="row-empty"></div>
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<c:forEach var="subjectApplyDto" items="${applyDateList}">
							<fmt:parseDate value="${subjectApplyDto.searchDate}" var="searchDate" pattern="yyyy-MM-dd" />
							<th>
								<fmt:formatDate value="${searchDate}" pattern="MM/dd" />
							</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="studentDto" items="${attendanceStuList}">
						<tr>
							<td>${studentDto.student_name}</td>
							<c:forEach var="attendanceDto" items="${attendanceTypeList}">
								<c:set value="${studentDto.student_no}" var="student_no" />
								<c:set value="${attendanceDto.student_no}" var="attend_stu_no" />
									<c:if test="${student_no == attend_stu_no}">
										<td>
											<input type="hidden" name="attend_no" value="${attendanceDto.attend_no}">
	<!-- 				                		<select class="form-control" name="attend_type" onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;"> -->
					                		<select class="form-control" name="attend_type">
					                			<option value="–" ${attendanceDto.attend_type == '–' ? 'selected' : '' }>&ndash;</option>
					                			<option ${attendanceDto.attend_type == '출석' ? 'selected' : '' }>출석</option>
					                			<option ${attendanceDto.attend_type == '지각' ? 'selected' : '' }>지각</option>
					                			<option ${attendanceDto.attend_type == '결석' ? 'selected' : '' }>결석</option>
					                		</select>
										</td>
									</c:if>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>

</div>


<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>