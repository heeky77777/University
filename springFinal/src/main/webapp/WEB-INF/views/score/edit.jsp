<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<head>

<title>성적 수정 페이지</title>
<script>

</script>
</head>

<body>

<div class="container-fluid">
	<div class="row-empty">
	 		<div class="offset-2 col-8">
		<div><br><br>
			<h1 class="text-center">성적 수정</h1>
			<br>
		</div>	
	<br>
	
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
			<input type="hidden" name="class_sub_no" value="${SMCDto.class_sub_no}" >
				<td>${SMCDto.student_numb}</td>
				<td>${SMCDto.major_type}</td>
				<td>${SMCDto.student_name}</td>
				<td><select name="class_score" class="form-control" >
					<option ${SMCDto.class_score=='4'?'selected':''}>4</option>
					<option ${SMCDto.class_score=='3'?'selected':''}>3</option>
					<option ${SMCDto.class_score=='2'?'selected':''}>2</option>
					<option ${SMCDto.class_score=='1'?'selected':''}>1</option>
					<option ${SMCDto.class_score=='0'?'selected':''}>0</option>
					</select></td>
				<td><select name="class_score_type" class="form-control" >
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
			
				<div>
					<input type="submit" value="수정" class="btn btn-primary">  
				</div>
			</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
		</div>
	</div>
	
	</div>

</body>
=======
<title>성적 등록 페이지</title>
<script>

</script>
</head>

<body>

<div class="container-fluid">
	<div class="row-empty">
		<div>
			<h1>성적 등록</h1>
		</div>	
	
 	<div class="row">
		<div class="form group">
			<input type="text" class="form-control" name="major_no" >
			<input type="text" class="form control" name="semester_no" >
			<input type="text" class="form control" name="semester_no" >
			<input type="text" class="form-control" name="class_apply_no" >
			<button class="btn btn-primary" onclick=>조회</button>
	</div>
 
 	
		<div class="form-group">
			<form action="write" method="post">
			<table class="table">
				<thead>
					<tr>
						<th>학번</th>
						<th>학생이름</th>
						<th>점수</th>
						<th>등급</th>
					</tr>
						<c:forEach var="SMCDto" items="${StudentList}"> 
					<tr>
						<td>${classSc}</td>
						<td>학점<select name="class_score">
								<option value="4">4</option>
								<option value="3">3</option>
								<option value="2">2</option>
								<option value="1">1</option>
								<option value="0">0</option>
							</select></td>
						<td>성적<select name="class_score_type">
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
								<option value="D">D</option>
								<option value="F">F</option>
								</select></td>
					</tr>	
					</c:forEach>
				</thead>
			</table>
			
				<div>
					<input type="submit" value="수정"> 
				</div>
			</form>
		</div>
	</div>
	
	
	
	</div>
</div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

