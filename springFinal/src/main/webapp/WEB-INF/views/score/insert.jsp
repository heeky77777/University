<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
	<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<head>
<title>성적 페이지</title>
<script>


</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row-empty">

			<div class="offset-2 col-8">
			<div><br><br>
				<h1 class="text-center">성적 입력</h1>
			</div><br>
	
	<div class="form-group">
			<form action="${pageContext.request.contextPath}/score/insert/${class_sub_no}/${subject_apply_no}" method="post">
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
				<td><input type="hidden" name="student_no" value="${SMCDto.student_no}"></td>
				<td>${SMCDto.student_name}</td>
				<td>${SMCDto.student_numb}</td>
				<td>${SMCDto.class_sub_name}</td>
				<td><select name="class_score" class="form-control">
					<option>선택</option>
					<option>4</option>
					<option>3</option>
					<option>2</option>
					<option>1</option>
					<option>0</option>
					</select></td>
				<td><select name="class_score_type" class="form-control">
					<option>선택</option>
					<option>A</option>
					<option>B</option>
					<option>C</option>
					<option>D</option>
					<option>F</option>
					</select></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>	
				<input type="submit" value="입력" class="btn btn-primary">
				</form>
	</div>
		<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
					<div>	
				</div>	
			</div>
		</div>	
	</div>
</body>

