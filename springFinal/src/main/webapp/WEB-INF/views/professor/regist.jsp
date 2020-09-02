<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>


 <head>
 <title>교수 등록 페이지</title>

 <script>
 
 //아이디 검사
 function checkId(){
	
	 var input = document.querySelector("input[name=profe_id]");
	 var span = documnet.querySelector("input[name=profe_id]+span");
	 var profeId = input.value;
	 var regex = /^[a-z0-9]{5,15}$/g; //정규식
	 var isRight=regex.test(profeId);//정규식에 맞는지 검사 
	 

	 if(profeId.equals("admin")){//관리자 계정이라면
		 span.textContent = "관리자 계정입니다."
	 }
	 else{//관리자 계정이 아니라면
		 
		if(isRight){//정규표현식에 맞는 아이디라면
			
			axios({
				url:"${pageContext.request.contextPath}/professor/regist?profe_id="+profe_id,
				method:"get"
			})
			.then(function(response){
				console.log(response.data);
				if(!response.data){//결과가 없으면 : 사용 가능
					span.textContent = "사용 가능한 아이디입니다.";	
				}
				else{//결과 있으면 : 사용 불가
					span.textContent="이미 사용중인 아이디입니다.";
				}
				
			});
				else{//정규표현식이 안맞으면
					span.textContent="5~15자리의 영어 소문자와 숫자로만 입력하세요.";
		}
	 	
	 }
 }
 
 //비밀번호 검사
 function checkPw(){
	 var input = document.querySelector("input[name=profe_pw]");
	 var span = document.querySelector("input[name=profe_pw]+span");
	 var profePw = input.value;
	 var regex = /^[a-zA-Z0-9]{8,16}$/g;
	 var isRight=regex.test(profePw);
	 
	 if(!isRight){//틀림
	 	span.textContent = "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력하세요.";
	 }
	 else{//정상
	 	span.textContent="사용 가능한 비밀번호입니다.";
	 }
 }
 
 //비밀번호 재검사
 function recheckPw(){
	 var pw = document.querySelector("input[name=profe_pw]").value;
	 var pw2 = document.querySelector(".pw-reinput").value;
	 var span = document.querySelector(".pw-reinput+span");
	 
	 var isRight = pw==pw2;
	 if(!isRight){//다름
	 	span.textContent = "비밀번호가 동일하지 않습니다.";
	 	}
	 else{//동일
	 	span.textContent="비밀번호가 동일합니다.";
	 	}
 }
 
 //이메일 형식 검사
 function checkEmail(){
	
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
 }
 
 //핸드폰검사
 //할까말까
 
 //이미지 선택시 실행할 미리보기 함수
 function preview(){
	 
	 var fileTag=document.querySelector("input[name=profe_img]");
 
	 console.log(fileTag.files);
	 
	 if(fileTag.files.length>0){
		 var reader = new FileReader();
		 reader.onload = function(data){//data는 읽은 파일의 내용
		//미리보기 구현
		var imgTag = document.querySelector("img");
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
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 </head>
 <body>
 <main>
 	<article>
 	<div>
<h1>교수 정보 입력</h1>
</div>
 <form action="regist_result" method="post">
	
	<div>
	<label>이름</label>
	<input type="text" name="profe_name"  required>
	</div>
	
	<div>
	<label>학과</label>
	<!-- <input type="text" value="학과" readonly> -->
	<select name="major_name" required>
		<option value="">선택</option>
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
	<input type="text" name="profe_id" onblur="checkId()"  required>
	<span id="result"></span>
	</div>
		
	<div>
	<label>비밀번호</label>
	<input type="text" name="profe_pw" onblur="checkPw()"  required>
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
	<input type="text" name="profe_phone" placeholder="'-제외한 전화번호" required>
	</div>
	
	<div>
	<label>이메일</label>
	<input type="text" name="profe_email"  onblur="checkEmail()" required>
	<span></span>
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
	<input type="submit" value="등록">
	</div>
</form>	
	</article>
</main>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>