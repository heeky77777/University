<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>


 <title>교수 정보</title>
 <head>

 </head>
 
 <body>
 <main>
 	<article>
 	
 	<div>
<h1>교수 정보</h1>
</div>
 <form action="edit" method="post" enctype="multipart/form-data">
<input type="hidden" name="profe_no" value="${professorDto.profe_no}" >
	<div>
	<label>이름</label>
	<input type="text" name="profe_name" value="${professorDto.profe_name}" readonly>
	</div>
	
	<div>
	<label>학기</label>
	<input type="radio" id="first" name="${professorDto.semester_no}" value="998" disabled> <!--중복방지 네임통일-->
	<label for="1">1</label>학기
	<input type="radio" id="second" name="${professorDto.semester_no}" value="999" disabled>
	<label for="2">2</label>학기
	</div>
	
	
	<div>
	<label>학과</label>
	<input type="text" name="major_no" value="${professorDto.major_no}" readonly>
<!-- 	<select name="major_no"  readonly>
		<option>선택</option>
		<option value="21">경영학과</option>
		<option value="22">금융세무학과</option>
		<option value="25">문예창작과</option>
		<option value="23">도시공학과</option>
		<option value="24">시스템공학과</option>
		<option value="14">성악과</option>
	</select> -->
	</div>
	
	
	<div>
	<label>아이디</label>
	<input type="text" name="profe_id" value="${professorDto.profe_id}" readonly>
	</div>
		
<%-- 	<div>
	<label>비밀번호</label>
	<input type="text" name="profe_pw" value="${professorDto.profe_pw}" readonly>
	<span></span>
	</div>
		
	<div>
	<label>비밀번호 재확인</label>
	<input type="text" name="profe_pw_check" class="pw_reinput" onblur="recheckPw()"  required>
	<span></span>
	</div> --%>
	
	<div>
	<label>성별</label>
	<select name="profe_gender"  required>
		<option value="여성">여성</option>
		<option value="남성">남성</option>
	</select>
	</div>
	
	<div>
	<label>전화번호</label>
	<input type="text" name="profe_phone" value="${professorDto.profe_phone}" readonly>
	</div>
	
	<div>
	<label>이메일</label>
	<input type="text" name="profe_email" value="${professorDto.profe_email}" readonly><!-- onblur="checkEmail()" -->
	</div>
	
	<div>
	<label>주소</label>
	<input type="text" name="profe_post" value="${professorDto.profe_post}" readonly>
	<input type="text" name="profe_addr" value="${professorDto.profe_addr}" readonly>
	<input type="text" name="profe_extra_addr" value="${professorDto.profe_extra_addr}" readonly>
	</div>
	
	<div>
	<label>사진</label>
	<input type="file" name="file" accept=".jpg, .gif, .png"  multiple onchange="preview()">
	<!-- <img> 미리보기 위치-->
	</div> 
	
	<div>
	<input type="submit" value="수정">
	</div>
</form>	

	</article>
</main>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>