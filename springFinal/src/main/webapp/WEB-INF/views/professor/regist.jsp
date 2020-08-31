<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <head>
 <title>교수 등록 페이지</title>
 <script>
 
 //아이디 검사
 function checkId(){
	 var profeId = document.querySelector("input[name=profe_id]").value;
	 
	 
	 var isRight = /^[a-z0-9]{8,20}$/
	 //var isRight = len>=8&&len<=20;
	 
	 if(!isRight){//틀림
		 var span = document.querySelector("input[name=profe_id]+span");
		 span.textContent = "아이디는 8~20자 이내의 영문 소문자와 숫자로 작성하세요."
	 }
	 else{//정상
		 var span = documnet.querySelector("input[name=profe_pw]+span");
	 	span.textContent = "";
	 	
		 }
 }
 
 //비밀번호 검사
 function checkPw(){
	 var profePw = document.querySelector("input[name=profe_pw]").value;
	 var isRight = /^[a-zA-Z0-9]{8,16}$/
	 
	 if(!isRight){//틀림
		 var span = document.querySelector("input[name=profe_pw]+span");
	 	span.textContent = "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력";
	 }
	 else{//정상
		var span = document.querySelector("input[name=profe_pw]+span");
	 	span.textContent="";
	 }
 }
 
 //비밀번호 재검사
 function recheckPw(){
	 var pw = document.querySelector("input[name=profe_pw]").value;
	 var pw2 = document.querySelector(".pw-reinput").value;
	 
	 var isRight = pw==pw2;
	 if(!isRight){//다름
		 var span = document.querySelector(".pw-reinput+span");
	 	span.textContent = "비밀번호가 동일하지 않습니다.";
	 	}
	 else{//동일
		 var span = document.querySelector(".pw-reinput+span");
	 	span.textContent="";
	 	}
 }
 
 //이미지 선택시 실행할 미리보기 함수
 function preview(){
	 
	 var fileTag=document.querySelector("input[name=profe_img]");
 
	 console.log(fileTag.files);
	 
	 if(fileTag.files.length>0){
		 var reader = new FileReader();
		 readder.onload = function(data){//data는 읽은 파일의 내용
		//미리보기 구현
		var imgTag = documnet.querySelector("img");
		 imgTag.src = data.target.result;
		 
		 };
		 reader.readAsDataURL(fileTag.files[0]);//읽도록 지시
	 }
	 else{//이미지 선택 취소
		 var imgTag = document.querySelector("img");
	 	imgTag.src="";
	 	}
 }
 </script>
 </head>
 <body>
 
<h1>교수 정보 입력</h1>

<form action="regist" method="post">
	<input type="text" name="profe_name"  placeholder="이름" required>
	<input type="text" name="major_name" value="학과" required>
	<input type="text" name="profe_id"  onblur="checkId();" placeholder="ID" required>
	<span></span>
	<br><br>
	<input type="text" name="profe_pw" onblur="checkPw();" placeholder="비밀번호" required>
	<span></span>
	<br><br>
	<input type="text" name="profe_pw_check" class="pw_reinput" onblur="recheckPw();" placeholder="비밀번호 재확인"" required>
	<span></span>
	<br><br>
	성별<select name="profe_gender"  required>
		<option value="female">여성</option>
		<option value="male">남성</option>
	</select><br><br>
	<input type="text" name="profe_phone" placeholder="'-'포함한 전화번호" required><br><br>
	<input type="text" name="profe_email" placeholder="이메일주소" required><br><br>
	<input type="text" name="profe_post" placeholder="우편번호" required><br><br>
	<input type="text" name="profe_addr" placeholder="기본주소" required><br><br>
	<input type="text" name="profe_extra_addr" placeholder="상세주소" required><br><br>
	<input type="file" name="profe_img" accept="jpg, gif, png" onchange="preview();">
	<img>
	<br><br>
	<input type="submit" value="등록">
</form>
</body>