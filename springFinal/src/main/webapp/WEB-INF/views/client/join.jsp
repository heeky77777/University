<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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

	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("stu_apply_post").value = data.zonecode;
                document.getElementById("stu_apply_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("stu_apply_extra_addr").focus();
            }
        }).open();
    } 
</script>
<div class="container-fluid">
	<div class="form">
		<div class="offset-md-4 col-md-4">
			<br> <br>

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
						<option>남</option>
						<option>녀</option>
					</select>
				</div>


				<div class="form-group">
					<label>생년월일 :</label> <input id="Datepicker" class="form-control" type="text"
						name="stu_apply_birth" required>
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
				</div>

				<div class="form-group">
					<label>전화번호</label> <input class="form-control" type="text"
						name="stu_apply_phone" onblur="checkphone()" id="stu_apply_phone"
						required> <span class="result_1"></span>
				</div>

				<div class="form-group">
					<label>이메일 :</label> <input class="form-control" type="text"
						name="stu_apply_email" required> <span></span>
				</div>
				 <div class="form-group">
		       	<label>주소</label>
		   </div> 
				  <div>    	
		       	<input size=10 type="text" name="stu_apply_post" placeholder="우편번호" id="stu_apply_post">
		    	<input type="button" value="우편번호 검색" onclick="sample6_execDaumPostcode()" size=10>
	    	</div><br>
		   <div class="form-group">		    	
		    	<input class="form-control" type="text" name="stu_apply_addr" placeholder="기본주소" id="stu_apply_addr">		 	
			</div>
			<div class="form-group">   	
		    	<input class="form-control" type="text" name="stu_apply_extra_addr" placeholder="상세주소" id="stu_apply_extra_addr">
		   </div> 	
		   

				<div class="form-group">
					<input class="form-control btn btn-primary btn-block" type="submit"
						value="등 록" style="background-color: #063e7a">

				</div>
			</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
		</div>
	</div>
</div>