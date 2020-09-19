<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<head>
<title>교수 등록 페이지</title>

<style>

	.form-group>.col{
		width:0%;
		
	}
</style>
<script>
	//아이디 검사
	function checkId() {

		var input = document.querySelector("input[name=profe_id]");
		var span = document.querySelector("input[name=profe_id]+span");
		var profeId = input.value;
		var regex = /^[a-z0-9]{5,15}$/g; //정규식
		var isRight = regex.test(profeId);//정규식에 맞는지 검사 
		var sys = "admin";

		if (profeId.indexOf(sys) != -1) {//관리자 계정이라면
			span.textContent = "관리자 계정입니다."
		} else {//관리자 계정이 아니라면

			if (isRight) {//정규표현식에 맞는 아이디라면

				axios(
						{
							url : "${pageContext.request.contextPath}/rest_professor/check_id?profe_id="+ encodeURIComponent(profeId),
							method : "get"
						}).then(function(response) {
					console.log(response.data);
					if (!response.data) {//결과가 없으면 : 사용 가능
						span.textContent = "사용 가능한 아이디입니다.";
					} else {//결과 있으면 : 사용 불가
						span.textContent = "이미 사용중인 아이디입니다."; 
					}

				})
			} else {//정규표현식이 안맞으면
				span.textContent = "5~15자리의 영어 소문자와 숫자로만 입력하세요.";
			}

		}
	}

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

	//이메일 형식 검사
	/*  function checkEmail(){
	
	 var regex=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 var input=document.querySelector("input[name=profe_email]");
	 var span=document.querySelector("input[name=profe_email]+span");
	 var profeEmail=input.value;
	 var isRight=regex.test(profeEmail);
	
	 if(isRight){//정규표현식이 맞다면
	
	 axoios({
	 url:"",
	 method:"get"
	
	 })
	 .then(function(response){
	
	 if(!response.data){
	 span.textContent="사용이 가능합니다.";
	 }else{
	 span.textContent="이미 사용중인 이메일입니다.";	
	 }
	 })
	 }
	 else{//정규식이 안맞으면
	 span.textContent="이메일이 형식에 맞지 않습니다.";
	 }
	 } */

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
		
			function error_page(){
				var url = location.search.substr(location.search.indexOf("?") + 1);
				console.log(url);
				if(url == 'error') {
					alert("이미 등록된 교수입니다");
				}
			
				}
				 window.onload=error_page;
	}
</script>
</head>

<body>

	<div class="container-fluid">
				<div>
					<h1 class="text-center">교수 필수 정보 입력</h1>
				</div>

		<div class="row">
			<div class="col-6 offset-3">
				<form action="regist" class="form" method="post" enctype="multipart/form-data">

					<div class="form-group">
						<label>이름</label> 
						<input type="text" class="form-control" name="profe_name" required>
					</div>

					<div class="radio">
						<label>학기</label>
						 	<input type="radio" id="first" name="semester_no" value="998"> <!--중복방지 네임통일-->
						<label for="first">1학기</label>
							 <input type="radio" id="second" name="semester_no" value="999">
						<label for="second">2학기</label>
					</div>


					<div class="form-group">
						<label>학과</label> 
						<select name="major_no" class="form-control" required>
							<option>선택</option>
							<option value="21">경영학과</option>
							<option value="22">금융세무학과</option>
							<option value="25">문예창작과</option>
							<option value="23">도시공학과</option>
							<option value="24">시스템공학과</option>
							<option value="14">성악과</option>
						</select>
					</div>

					<div class="form-group">
						<label>아이디</label>
						<input type="text" name="profe_id" id="profe_id" class="form-control" onblur="checkId()" placeholder="5~15자리의 영어 소문자와 숫자를 입력하세요" required>
						<span id="idCheck"></span>
					</div>

					<div class="form-group">
						<label>비밀번호</label>
						 <input type="password" name="profe_pw" onblur="checkPw()" class="form-control" placeholder="8~16자의 영문 대소문자와 숫자로만 입력하세요" required>
						 <span id="pwCheck"></span>
					</div>

					<div class="form-group">
						<label>비밀번호 재확인</label>
						 <input type="password" name="profe_pw_check" onblur="recheckPw()" class="form-control" placeholder="비밀번호를 확인하세요" required>
						 <span id="reCheck"></span>
					</div>
					
					<div class="radio">
						<label>성별</label>
							<input type="radio" id="female" name="profe_gender" value="여성"><!--중복방지 네임통일-->
						<label for="gender">여성</label> 
							<input type="radio" id="male" name="profe_gender" value="남성">
						<label for="gender2">남성</label><br>
						<small class="form-text text-muted">성별은 변경 불가입니다.</small>
					</div>

					<div class="form-group">
						<label>생년월일</label>
						 	<input type="text" id="Datepicker" name="profe_birth" class="form-control" required>
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
							})
						</script>
						<strong>법정생년월일을 선택하세요</strong><br>
					</div>


					<div class="form-group">
						<label>전화번호</label>
						 <input type="text" name="profe_phone" 	onblur="checkPhone()" class="form-control" 	placeholder="'-제외한 전화번호" required>
					  <span id="numCheck"></span>
					</div>

					<div class="form-group">
						<label>이메일</label>
						 <input type="text" name="profe_email" 	class="form-control" required>
					</div>

					<div class="form-group">
						<label>주소&nbsp;</label> 
							<input type="button" onclick="findAddr()" class="btn btn-secondary btn-sm" value="우편번호 검색"><br>
							<input type="text" name="profe_post" class="form-control" placeholder="우편번호" required>
						<div class="row">
							<div class="col">
								<input type="text" 	name="profe_addr" class="form-control" placeholder="기본주소" required>
							</div>
							<div class="col">
								<input type="text" name="profe_extra_addr" 	class="form-control" placeholder="상세주소" required>
							</div>
						</div>					
					</div>

				

					<div class="row-empty">
							<button type="submit" class=" btn btn-primary btn-block">등록</button>
	
				
					</div>
					
				</form>
			</div>
		
		</div>
	</div>

</body>
</html>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>