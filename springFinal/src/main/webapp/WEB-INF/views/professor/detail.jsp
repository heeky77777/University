<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>


 <title>교수 정보</title>
 <head>
<script>
//이미지 선택시 실행할 미리보기 함수
function preview() {

	var fileTag = document.querySelector("input[name=file]");

	console.log(fileTag.file);

	if (fileTag.files.length > 0) {
		var reader = new FileReader();
		reader.onload = function(data) {//data는 읽은 파일의 내용
			//미리보기 구현
			var imgTag = document.querySelector("img[name=profe_img]");
			imgTag.src = data.target.result;

		};
		reader.readAsDataURL(fileTag.files[0]);//읽도록 지시
	} else {//이미지 선택 취소
		var imgTag = document.querySelector("img[name=profe_img]");
		imgTag.src = "";
	}
}
</script>
 </head>
 
 <body onload="javascript:semester();gender()"> 
 
 <div class="container-fluid">	
 	<div>
<h1 class="text-center">교수 정보</h1>
</div>
<div class="row">
			<div class="col-6 offset-3">
				<!-- 사진입력 -->
					<div class="form-group">
						<form action="detail" method="post" enctype="multipart/form-data">
						<label>사진</label>
						<br>
						<img src="${pageContext.request.contextPath}/professor/profeImg/${profe_file_no}" name="profe_img" class="rounded mx-auto d-block" border="0" width="200" height="200"/>
						<br>
						<input type="file" class="form-control-file" name="file" accept=".jpg, .gif, .png"  multiple onchange="preview()">
						<input type="hidden" name="profe_no" value="${profeinfo.profe_no}">
						
						<input type="submit" value="등록">
						</form>
					</div> 

			<input type="hidden" name="profe_no" value="${professorDto.profe_no}" >
	
			<div class="form-group">
				<label>이름</label>
				<input type="text" class="form-control" name="profe_name" value="${professorDto.profe_name}" readonly>
			</div>
	
			<div class="radio">
				<label>학기</label>
				<input type="radio" id="first" name="semester_no" value="${semester_type}" disabled> <!--db에 나온그대로 가져와야해서 semester_type-->
				<label for="first">1학기</label>
				<input type="radio" id="second" name="semester_no" value="${semester_type}" disabled>
				<label for="second">2학기</label>
				<script>
					function semester(){
					  $('input[name="semester_no"]').each(function(){
						var thisVal=$(this).val();
						if(thisVal.length>0){
							$(this).attr("checked",true);
							}
					 	 })
					  }
				</script>
				</div>
					
	
				<div class="form-group">
					<label>학과</label>
					<input type="text" class="form-control" name="major_no" value="${major_type}" readonly>
				</div>
				
				
				<div class="form-group">
				<label>아이디</label>
				<input type="text" class="form-control" name="profe_id" value="${professorDto.profe_id}" readonly>
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
	
		<div class="radio">
		<label>성별</label>
	<input type="radio" id="female" name="profe_gender" value="여성" disabled> <!--중복방지 네임통일-->
	<label for="gender">여성</label>
	<input type="radio" id="male" name="profe_gender" value="남성" disabled>
	<label for="gender2">남성</label> 
 	<script>
		//체크한 항목 고정
	function gender(){
	  $('input[name="profe_gender"]').each(function(){
		var thisVal=$(this).val();
		if(thisVal.length>0){
			$(this).attr("checked",true);
			}
	 	 })
	  }
	</script> 
	</div>
	
	<div class="form-group">
	<label>생년월일</label>
		<fmt:parseDate value="${professorDto.profe_birth}" var="birth" pattern="yyyy-MM-dd HH:mm:ss"/>
		 <input type="text" id="Datepicker" name="profe_birth" class="form-control" value="<fmt:formatDate value="${birth}" pattern="yyyy-MM-dd"/>" readonly>	
	</div>

	
	<div class="form-group">
	<label>전화번호</label>
	<input type="text" class="form-control" name="profe_phone" value="${professorDto.profe_phone}" readonly>
	</div>
	
	<div class="form-group">
	<label>이메일</label>
	<input type="text" class="form-control" name="profe_email" value="${professorDto.profe_email}" readonly><!-- onblur="checkEmail()" -->
	</div>
	
	<div class="form-group">
	<label>주소</label>
	<input type="text" class="form-control" name="profe_post" value="${professorDto.profe_post}" readonly>
	<input type="text" class="form-control" name="profe_addr" value="${professorDto.profe_addr}" readonly>
	<input type="text" class="form-control" name="profe_extra_addr" value="${professorDto.profe_extra_addr}" readonly>
	</div>
	
	
	<div>
	<c:choose>
		<c:when test="${professorDto.profe_auth ne '학생'}"> 
			<div class="row">
				<div class="col">
					<!-- <input type="submit" class=" btn btn-primary btn-block" value="수정"> -->
					 <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/professor/edit?profe_no=${profeinfo.profe_no}" style="color:white">수정</a>
				</div>
				<div class="col">
					<input type="button" class=" btn btn-primary btn-block" value="취소">
				</div>
		</div>
		</c:when>
	<c:otherwise>
			<input type="button" class=" btn btn-primary btn-block" value="취소">
	</c:otherwise>
	</c:choose>
	</div>
</div>
</div>
</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>