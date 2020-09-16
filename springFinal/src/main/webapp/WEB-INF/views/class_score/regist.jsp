<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<head>
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
	
 	<<div class="row">
		<div class="form group">
			<input type="text" class="form-control" name="major_no" value="${profeInfo." readonly>
			<input type="text" class="form control" name="semester_no" value="" readonly>
			<input type="text" class="form control" name="semester_no" value="" readonly>
			<input type="text" class="form-control" name="class_apply_no" value="" readonly>
			<button class="btn btn-primary">조회</button>
	</div>
 
		<div class="form-group">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<%-- <c:forEach var="subjectApplyDto" items="${list}"> --%>
					
					
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	</div>
</div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>