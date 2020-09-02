<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>교수 등록 페이지</h1>

<form action="regist" method="post">
	<input type="text" name="profe_name" placeholder="이름" required><br><br>
	<input type="text" name="profe_id" placeholder="ID" required><br><br>
	<input type="text" name="profe_pw" placeholder="비밀번호" required><br><br>
	성별<select name="profe_gender"  required>
		<option value="female">여성</option>
		<option value="male">남성</option>
	</select><br><br>
	<input type="text" name="profe_phone" placeholder="'-'포함한 전화번호" required><br><br>
	<input type="text" name="profe_email" placeholder="이메일주소" required><br><br>
	<input type="text" name="profe_post" placeholder="우편번호" required><br><br>
	<input type="text" name="profe_addr" placeholder="기본주소" required><br><br>
	<input type="text" name="profe_extra_addr" placeholder="상세주소" required><br><br>
	<input type="file" name="profe_img" accept="jpg, gif, png"><br><br>
	<input type="submit" value="등록">
</form>