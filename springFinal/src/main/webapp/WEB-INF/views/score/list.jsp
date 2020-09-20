<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<title>성적 페이지</title>
<script>


</script>

	<div class="container-fluid">
		<div class="row">
			<div class="offset-2 col-8">
			<div><br><br>
				<h1 class="text-center">성적 확인</h1>
			</div><br>
	
	<form action="list" method="post" >
	<div class="form-group">
		<table class="table table-lg table-hover">
			<thead class="text-center">	
				<tr>
					<th>학번</th>
					<th>학과</th>
					<th>이름</th>
					<th>점수</th>
					<th>등급</th>
				</tr>
			</thead>
			
		<tbody class="form-group" style="text-align: center">
			<c:forEach var="SMCDto" items="${StudentList}">
			<tr>
				<td>${SMCDto.student_numb}</td>
				<td>${SMCDto.major_type}</td>
				<td>${SMCDto.student_name}</td>
				<td><select name="class_score" class="form-control" disabled>
					<option>선택</option>
					<option ${SMCDto.class_score=='4'?'selected':''}>4</option>
					<option ${SMCDto.class_score=='3'?'selected':''}>3</option>
					<option ${SMCDto.class_score=='2'?'selected':''}>2</option>
					<option ${SMCDto.class_score=='1'?'selected':''}>1</option>
					<option ${SMCDto.class_score=='0'?'selected':''}>0</option>
					</select></td>
				<td><select name="class_score_type" class="form-control" disabled>
					<option>선택</option>
					<option ${SMCDto.class_score_type=='A'?'selected':''}>A</option>
					<option ${SMCDto.class_score_type=='B'?'selected':''}>B</option>
					<option ${SMCDto.class_score_type=='C'?'selected':''}>C</option>
					<option ${SMCDto.class_score_type=='D'?'selected':''}>D</option>
					<option ${SMCDto.class_score_type=='F'?'selected':''}>F</option>
					</select></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>	
			<!-- <input type="submit" value="수정" class="btn btn-primary"> -->
<%-- 			<c:choose> --%>
<%-- 		<c:when test="${StudentList eq null}">  --%>
			<div class="row">
				<div class="col">
					<!-- <input type="submit" class=" btn btn-primary btn-block" value="수정"> -->
					 <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/score/insert?class_sub_no=${class_sub_no}" style="color:white">입력</a>
					 <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/score/edit?class_sub_no=${class_sub_no}" style="color:white">수정</a>
				</div>
		</div>
<%-- 		</c:when> --%>
<%-- 	<c:otherwise> --%>
			<!-- <input type="button" class=" btn btn-primary btn-block" value="취소"> -->
<%-- 	</c:otherwise> --%>
<%-- 	</c:choose> --%>
	</div>
	</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	</div>
		</div>
			</div>	
