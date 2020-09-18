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

			<h1 class="form-group" style="text-align: center">정보입력</h1>
			<br>
  
  
    <form action="send" method="post">
	<input type="text" name="email" placeholder="이메일" required>
	<br><br>
	<input type="text" name="title" placeholder="제목" required>
	<br><br>
	
	<input type= "button">
	<input type="submit" value="이메일 보내기">
</form>