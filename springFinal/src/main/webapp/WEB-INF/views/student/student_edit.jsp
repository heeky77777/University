<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    
    <script>
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
			<h1 class="form-group" style="text-align: center"> 내 정보 수정 </h1><hr><br><br>

    		<form action="student_edit" method="post">
    		<input type="hidden" name="student_no" value="${studentDto.student_no}">
		    <div class="form-group">
		    	<label>학생이름</label>  
		    	<input class="form-control" type="text" name="student_name" value="${studentDto.student_name}" readonly>
		    </div>		    
		    <div class="form-group">    		    
		    	<label>학번</label>  
		    	<input class="form-control" type="text" name="student_numb" onblur="checkNumb();" value="${studentDto.student_numb}" readonly>
		    	<span class="bool_red" style="color:red"></span>
		    	<span class="bool_blue" style="color:blue"></span>
		    </div>		    
		    <div class="form-group">    
		    	<label>학생 비밀번호</label>
		    	<input class="form-control" type="password" name="student_pw" value="${studentDto.student_pw}">
		    </div>
		    <div class="form-group">    
		    	<label>학년</label>  
		    	<input class="form-control" type="text" name="student_grade" value="${studentDto.student_grade}" readonly>
		    </div>
		    <div  class="form-group">	
		       	<label>학과</label> 
		       	<input class="form-control" type="text" name="major_no" value="${studentDto.major_no}" readonly>		    	
		   </div>
		   <div class="form-group">
		    	<label>학기</label> 
		    	<input class="form-control" type="text" name="semester_no" value="${studentDto.semester_no}" readonly>		    		
		   </div>
		   <div class="form-group">
		    	<label>학적상태</label> 
		    	<input class="form-control" type="text" name="student_state" value="${studentDto.student_state}" readonly>		    		
		   </div>	
		   <div class="form-group">
		   		<label>성별</label>
		   		<input class="form-control" type="text" name="student_gender" value="${studentDto.student_gender}" readonly>		    	  
		   </div> 	
		   <div class="form-group">	
		    	<label>생년월일</label> <!-- 시간 안나오게 설정하는방법 알아보기 -->
		    	<fmt:parseDate value="${studentDto.student_birth}" var="birth" pattern="yyyy-MM-dd HH:mm:ss" />
		    	<input type="date" name="student_bitrh" id="student_bitrh" class="form-control" value="<fmt:formatDate value="${birth}" pattern="yyyy-MM-dd" />" readonly>
		   </div> 	           
		   <div class="form-group">
		    	<label>연락처</label> 
		    	<input class="form-control" type="text" name="student_phone" value="${studentDto.student_phone}">
		   </div>
		   <div class="form-group"> 	
		    	<label>이메일 주소</label> 
		    	<input class="form-control" type="text" name="student_email" value="${studentDto.student_email}">
		   </div>		     	
		   <div class="form-group">    	
		       	<input class="form-control" type="text" name="student_post" placeholder="우편번호" id="student_post" value="${studentDto.student_post}">
	       	</div>
	       	<div class="form-group">
		    	<input class="form-control" type="button" value="우편번호 검색" onclick="sample6_execDaumPostcode()" style="background-color:#D6E0F0">
	    	</div>
		   <div class="form-group">		    	
		    	<input class="form-control" type="text" name="student_addr" value="${studentDto.student_addr}" id="student_addr">		 	
			</div>
			<div class="form-group">   	
		    	<input class="form-control" type="text" name="student_extra_addr" value="${studentDto.student_extra_addr}" id="student_extra_addr">
		   </div> 			    
		   <div class="form-group">
		    	<label>병역여부</label> 
		    	<input class="form-control" name="student_milliy" value="${studentDto.student_milliy}" readonly>		    	
		   </div><hr>
		   <div class="form-group">
		    	<input class="form-control btn btn-primary btn-block" type="submit" value="등 록" style="background-color :#063e7a">
		    </div>
		    <div class="form-group">
		    	<a class="form-control btn btn-primary btn-block" href="${pageContext.request.contextPath}/student/student_info?student_no=${userinfo.student_no}" style="color:white">이전으로</a>		    	
		    </div>	
		    </form>		    
    	</div>
    </div>
</div>

    