<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>

	$(document).ready(function(){
		$("#update").click(function(){
			if(confirm("수정하시겠습니까?")){
				document.update.action="{path}/professor/detail";
				document.update.submit();
			}	
		})
	})

</script>


<h1>교수 정보 상세 페이지</h1>

<form action="edit" method="post" name="update">
	<div>
	<label>이름</label>
	<input type="text" name="profe_name" value="${professorDto.profe_name}" required>
	</div>
	
	<div>
	<label>학과</label>
	<!-- <input type="text" value="학과" readonly> -->
	<select name="major_name" value="${professorDto.major_name}" required>
		<option>선택</option>
		<option value="">경영학과</option>
		<option value="">금융세무학</option>
		<option value="">문예창장학과</option>
		<option value="">도시공학과</option>
		<option value="">시스템공학과</option>
		<option value="">성악과</option>
	</select>
	</div>
	
	
	<div>
	<label>아이디</label>
	<input type="text" name="profe_id" value="${professorDto.profe_id}" onblur="checkId()"  required>
	<span id="result"></span>
	</div>
		
	<div>
	<label>비밀번호</label>
	<input type="text" name="profe_pw" value="${professorDto.profe_pw}"onblur="checkPw()"  required>
	<span></span>
	</div>
		
	<div>
	<label>비밀번호 재확인</label>
	<input type="text" name="profe_pw_check" class="pw_reinput" onblur="recheckPw()"  required>
	<span></span>
	</div>
	
	<div>
	<label>성별</label>
	<select name="profe_gender"  required>
		<option value="female">여성</option>
		<option value="male">남성</option>
	</select>
	</div>
	
	<div>
	<label>전화번호</label>
	<input type="text" name="profe_phone" value="${professorDto.profe_phone}" placeholder="'-제외한 전화번호" required>
	</div>
	
	<div>
	<label>이메일</label>
	<input type="text" name="profe_email" value="${professorDto.profe_email}" required><!-- onblur="checkEmail()" -->
	</div>
	
	<div>
	<label>주소</label>
	<input type="text" name="profe_post" placeholder="우편번호" required>
	<input type="text" name="profe_addr" placeholder="기본주소" required>
	<input type="text" name="profe_extra_addr" placeholder="상세주소" required>
	</div>
	
	<div>
	<label>사진</label>
	<input type="file" name="profe_img" accept="jpg, gif, png" onchange="preview();">
	<img>
	</div>
	
	<div>
	<input type="submit" value="수정">
	</div>
</form>	
	
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>