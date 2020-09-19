<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	

//비밀번호 검사
function checkPw() {
	var input = document.querySelector("input[name=profe_pw]");
	var span = document.querySelector("input[name=profe_pw]+span");
	var profePw = input.value;
	var regex = /^[a-zA-Z0-9]{8,16}$/g;
	var isRight = regex.test(profePw);

	if (!isRight) {//틀림
		span.textContent = "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력하세요.";
	} else {//정상
		span.textContent = "사용 가능한 비밀번호입니다.";
	}
}

//비밀번호 재검사
function recheckPw() {
	var input = document.querySelector("input[name=profe_pw]");
	var pw = input.value;
	var input2 = document.querySelector("input[name=profe_pw_check]");
	var pw2 = input2.value;
	console.log(pw2);
	var span = document.querySelector("input[name=profe_pw_check]+span");

	var isRight = pw == pw2;
	if (!isRight) {//다름
		span.textContent = "비밀번호가 동일하지 않습니다.";
	} else {//동일
		span.textContent = "비밀번호가 동일합니다.";
	}
}


//핸드폰검사
function checkPhone() {
	var input = document.querySelector("input[name=profe_phone]");
	var span = document.querySelector("input[name=profe_phone]+span");
	var phone = input.value;

	var regex = /^010\d{4}\d{4}$/;
	var isRight = regex.test(phone);

	if (!isRight) {//정규표현식이 맞지 않음
		span.textContent = "번호를 올바르게 입력하세요.";
	} else {//옳은 형식의 번호
		span.textContent = "";
	}
}

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

//우편번호 찾기 및 주소 입력 자바스크립트
function findAddr() {
	new daum.Postcode(
			{
				oncomplete : function(data) {

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}

					} else {
						// document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.querySelector("input[name=profe_post]").value = data.zonecode;
					document.querySelector("input[name=profe_addr]").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.querySelector("input[name=profe_extra_addr]")
							.focus();
				}
			}).open();

	$(document).ready(function(){
		$("#update").click(function(){
			if(confirm("수정하시겠습니까?")){
				document.update.action="{path}/professor/detail";
				document.update.submit();
			}	
		})
	})

</script>

<body onload="javascript:semester();gender();major()">

<div class="container-fluid">
<div>
<h1 class="text-center">교수 정보 수정 페이지</h1>
</div>

<div class="row">
			<div class="col-6 offset-3">
			<form action="edit" class="form" method="post" id="update">
			<input type="hidden" name="profe_no" value="${professorDto.profe_no}">
	
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control"  name="profe_name" value="${professorDto.profe_name}" >
	</div>
	
	<div class="form-group">
		<label>학기</label>
			<input type="radio" id="first" name="semester_no" value="${semester_type}" > <!--db에 나온그대로 가져와야해서 semester_type-->
		<label for="first">1학기</label>
			<input type="radio" id="second" name="semester_no" value="${semester_type}">
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
	<select name="major_no" class="form-control" required>
		<option>선택</option>
		<option ${professorDto.major_no=='21'?'selected':''}>경영학과</option>	
		<option ${professorDto.major_no=='22'?'selected':''}>금융세무학과</option>
		<option ${professorDto.major_no=='25'?'selected':''}>문예창장학과</option>
		<option ${professorDto.major_no=='23'?'selected':''}>도시공학과</option>
		<option ${professorDto.major_no=='24'?'selected':''}>시스템공학과</option>
		<option ${professorDto.major_no=='14'?'selected':''}>성악과</option>
	</select>
	</div>
	
	
	<div class="form-group">
	<label>아이디</label>
	<input type="text" name="profe_id" class="form-control" value="${professorDto.profe_id}" onblur="checkId()"  readonly>
	<span id="result"></span>
	</div>
		
	<div class="form-group">
	<label>비밀번호</label>
	<input type="password" name="profe_pw" class="form-control" value="${professorDto.profe_pw}"onblur="checkPw()"  required>
	<span></span>
	</div>
		
	<div class="form-group">
	<label>비밀번호 재확인</label>
	<input type="text" name="profe_pw_check" class="pw_reinput form-control" onblur="recheckPw()"  required>
	<span></span>
	</div>
	
	<div class="form-group">
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
		  
	</script> 
	</div>
	
	<!-- 	<div class="form-group">
						<label>생년월일</label>
						 <input type="text" id="Datepicker" class="form-control" name="profe_birth" class="form-control" required>
						<script type="text/javascript">
							$(function() {
								$("#Datepicker").datepicker({
									showOn : "button",
									dateFormat : 'yy-mm-dd', //날짜 형식 변환
									maxDate : new Date, //미래 날짜 비활성화
									minDate : '1920-01-01',//최소 날짜 설정
									changeMonth : true, //월 이동
									changeYear : true, //년 이동
									nextText : '다음 달',
									prevText : '이전 달',
									showButtonPanel : true, //닫기버튼 생성
									closeText : '닫기'

								})
							});
						
						</script>
						<strong>법정생년월일을 선택하세요</strong><br>
					</div> -->
	
	<div class="form-group">	
		<label>전화번호</label>
		<input type="text" class="form-control" name="profe_phone" value="${professorDto.profe_phone}" placeholder="'-제외한 전화번호" required>
	</div>
	
	<div class="form-group">
		<label>이메일</label>
		<input type="text" class="form-control" name="profe_email" value="${professorDto.profe_email}" required><!-- onblur="checkEmail()" -->
	</div>
	
	<div class="form-group">
		<label>주소</label>
		<input type="text" class="form-control" name="profe_post" value="${professorDto.profe_post}" required>
		<input type="text" class="form-control" name="profe_addr"  value="${professorDto.profe_addr}" required>
		<input type="text" class="form-control" name="profe_extra_addr" value="${professorDto.profe_extra_addr}" required>
	</div>
	

		<div>
	<c:choose>
		<c:when test="${professorDto.profe_auth ne '학생'}"> 
			<div class="row">
				<div class="col">
					<input type="submit" class=" btn btn-primary btn-block" id="update" value="수정">
				</div>
				<div class="col">
					<input type="button" class=" btn btn-primary btn-block" value="취소">
					<!-- a태그 넣기 -->
				</div>
			</div>
		</c:when>
	<c:otherwise>
			<input type="button" class=" btn btn-primary btn-block" value="취소">
	</c:otherwise>
	</c:choose>
	</div>
</form>	
</div>
</div>

</div>	
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>