<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--     <header> -->
  <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!--     </header> -->

</html>
  
  
  
    <form action="send" method="post">
	<input type="text" name="email" placeholder="이메일" required>
	<br><br>
	<input type="text" name="title" placeholder="제목" required>
	<br><br>
	
	<input type= "button">
	<input type="submit" value="이메일 보내기">
</form>