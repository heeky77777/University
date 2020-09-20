<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		function checkNumb(){
			var input = document.querySelector("input[name=student_numb]");
			var span_red = document.querySelector(".bool_red");
			var span_blue = document.querySelector(".bool_blue");
			
		
		if(!input.value){
			return;
		}
			
			
		axios({			
			url:"${pageContext.request.contextPath}/student/student_numb?student_numb="+input.value, 
			method:"get"		
		}).then(function(response){
			console.log(response.data);
			if(!response.data){
				span_blue.textContent = "사용이 가능한 학번입니다";
				span_red.textContent ="";
			}
			else{
				span_red.textContent = "이미 등록된 학번입니다";
				span_blue.textContent = "";
			}
		});
		
	}
		function error_page(){
			var url = location.search.substr(location.search.indexOf("?") + 1);
			console.log(url);
			if(url!="") {
				alert("이미 등록된 학생입니다");
			}
			
		}
		 window.onload=error_page;
		 
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
		                document.getElementById("student_post").value = data.zonecode;
		                document.getElementById("student_addr").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("student_extra_addr").focus();
		            }
		        }).open();
		    } 
		 
	</script>
<div class="container-fluid">
	<div class="form">
		<div class="offset-md-4 col-md-4">
			<br><br>
			<h1 class="form-group" style="text-align: center"> 학 생 등 록 </h1><hr><br><br>

    		<form action="student_join" method="post">
		    <div class="form-group">
		    	<label>학생이름</label>  
		    	<input class="form-control" type="text" name="student_name">
		    </div>
		    
		    <div class="form-group">    
		    	<label>학번</label>  
		    	<input class="form-control" type="text" name="student_numb" onblur="checkNumb();">
		    	<span class="bool_red" style="color:red"></span>
		    	<span class="bool_blue" style="color:blue"></span>
		    </div>
		    <div class="form-group">    
		    	<label>학생 비밀번호</label>
		    	<input class="form-control" type="password" name="student_pw">
		    </div>
		    <div class="form-group">    
		    	<label>학년</label>  
		    	<select class="form-control" name="student_grade">
		    			<option value="1">1학년</option>
		    			<option value="2">2학년</option>
		    			<option value="3">3학년</option>
		    			<option value="4">4학년</option>
		    	</select>	
		    </div>
		    <div  class="form-group">	
		       	<label>학과</label> 
		    	 <select name="major_no" id="major_no" class="form-control" required onchange="get_semester();">
                    <option value="" ${param.majorSearch == '' ? 'selected':''}>학과 선택</option>
                    <c:forEach var="majorDto" items="${majorList}">
                     <option ${param.major_type == '${majorDto.major_type}' ? 'selected':''}>${majorDto.major_type}</option>
                    </c:forEach>
     			</select>
		   </div>
		   <div class="form-group">
		    	<label>학기</label> 
		    		<select class="form-control" name="semester_no">
		    			<option>1학기</option>
		    			<option>2학기</option>
		    		</select>
		   </div>
		   <div class="form-group">
		    	<label>학적상태</label> 
		    		<select class="form-control" name="student_state">
		    			<option>재학</option>
		    			<option>휴학</option>
		    			<option>복학</option>
		    		</select>
		   </div>	
		   <div class="form-group">
		   		<label>성별</label>
		    	   <select class ="form-control" name="student_gender">
		    			<option>남자</option>
		    			<option>여자</option>
		    		</select>
		   </div> 	
		   <div class="form-group">	
		    	<label>생년월일</label> 
		    	<input class="form-control" type="date" name="student_birth">
		   </div> 	
		   <div class="form-group">
		    	<label>연락처</label> 
		    	<input class="form-control" type="text" name="student_phone" placeholder="- 제외하고 입력하세요" >
		   </div>
		   <div class="form-group"> 	
		    	<label>이메일 주소</label> 
		    	<input class="form-control" type="text" name="student_email">
		   </div>
		    <div class="form-group">
		       	<label>주소</label>
		      	<input class="form-control" type="text" name="student_post" placeholder="우편번호" id="student_post"><br>
		    	<input class="form-control" type="button" value="우편번호 검색" onclick="sample6_execDaumPostcode()" size=10 style="background-color:#D6E0F0">
	    	</div> 
		   <div class="form-group">		    	
		    	<input class="form-control" type="text" name="student_addr" placeholder="기본주소" id="student_addr">		 	
			</div>
			<div class="form-group">   	
		    	<input class="form-control" type="text" name="student_extra_addr" placeholder="상세주소" id="student_extra_addr">
		   </div> 	
		   
		   <div class="form-group">
		    	<label>병역여부</label> 
		    	<select class="form-control" name="student_milliy">
		    		<option>미필</option>
		    		<option>군필</option>
		    	</select><br><hr>
		   </div> 	
		   <div class="form-group">
		    	<input class="form-control btn btn-primary btn-block" type="submit" value="등 록" style="background-color :#063e7a">
		    </div>
		    </form>
		    
    	</div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>