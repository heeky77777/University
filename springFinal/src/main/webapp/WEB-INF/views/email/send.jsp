<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
	

  <div class="container-fluid">
	<div class="form">
		<div class="offset-md-4 col-md-4">
			<br>

			<h4 class="form-group" style="text-align: center">지원자 정보 입력 메일링</h4>
			<br>
  
  	
    <form action="send" method="post">
    
    <div class="form-group">
    <label>이메일 : </label>
    <br>
	<input class="form-control" type="text" name="email" placeholder="이메일" required>
	</div>
	
	<div class="form-group">
	<label>제목 : </label>
	<br>
	<input class="form-control" type="text" name="title" placeholder="제목" required>
	<br><br>
	
	</div>
	
	
	<input class="form-control" type="submit" value="이메일  보내기">
	
</form>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	</div>
	</div>