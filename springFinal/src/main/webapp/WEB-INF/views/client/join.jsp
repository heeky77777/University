<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>

<script>
	function checkphone() {

		var input = document.querySelector("#stu_apply_phone")
		var span = document.querySelector(".result_1")

		var stu_apply_phone = input.value;

		axios(
				{

					url : "${pageContext.request.contextPath}/test/test8?stu_apply_phone="
							+ stu_apply_phone,
					//url: "${pageContext.request.contextPath}/test/test8?name="+name, 
					method : "get"
				}).then(function(response) {
			console.log(response.data);
			if (!response.data) {
				span.textContent = ""
			} else {
				span.textContent = "가입된 정보입니다."
			}
		});
	}
</script>
<div class="container-fluid">
	<div class="form">
		<div class="offset-md-4 col-md-4">
			<br>

			<h1 class="form-group" style="text-align: center">정보입력</h1>
			<br>

			<form action="join" method="post">

				<div class="form-group">
					<label>이름</label> <input class="form-control" type="text"
						name="stu_apply_name">
				</div>

				<div class="form-group">
					<label>성별 :</label> <select class="form-control"
						name="stu_apply_gender">
						<option value="1">남</option>
						<option value="2">녀</option>
					</select>
				</div>


				<div class="form-group">
					<label>생년월일 :</label> <input class="form-control" type="date" name="stu_apply_birth"
						required>
				</div>
				
				<div class="form-group">
					<label>전화번호</label> <input class="form-control" type="text" name="stu_apply_phone"
						onblur="checkphone()" id="stu_apply_phone" required> <span
						class="result_1"></span>
				</div>

				<div class="form-group">
					<label>이메일 :</label> <input class="form-control" type="text" name="stu_apply_email"
						required> <span></span>
				</div>

				<div class="form-group">
					<label>우편번호:</label> <input class="form-control" type="text"
						name="stu_apply_post"><br> <input
						class="form-control" type="button" value="우편번호 검색">
				</div>

				<div class="form-group">
					<label>주소:</label> <input class="form-control" type="text" name="stu_apply_addr"
						required>
				</div>
				<div class="form-group">
					상세주소: <input class="form-control" type="text" name="stu_apply_extra_addr" required>
				</div>

				<div class="form-group">
					<input class="form-control btn btn-primary btn-block" type="submit"
						value="등 록" style="background-color: #063e7a">

				</div>
			</form>
		</div>
	</div>
</div>
