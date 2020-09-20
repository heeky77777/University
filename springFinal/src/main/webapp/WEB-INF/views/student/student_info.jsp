<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <script>
    function preview() {
    	var fileTag = document.querySelector("input[name=file]");
    	console.log(fileTag.file);
    	if (fileTag.files.length > 0) {
    		var reader = new FileReader();
    		reader.onload = function(data) {//data는 읽은 파일의 내용
    			//미리보기 구현
    			var imgTag = document.querySelector("img[name=student_img]");
    			imgTag.src = data.target.result;
    		};
    		reader.readAsDataURL(fileTag.files[0]);//읽도록 지시
    	} else {//이미지 선택 취소
    		var imgTag = document.querySelector("img[name=student_img]");
    		imgTag.src = "";
    	}
    }
    </script>
   	
<div class="container-fluid">
	<div class="form">
		<div class="offset-md-4 col-md-4">
		
			<br><br>
			<h1 class="form-group" style="text-align: center"> 마이페이지 </h1><hr><br>

    		<form action="student_info" method="post" enctype="multipart/form-data">
		    <div class="form-group" align="center">
				<img src="${pageContext.request.contextPath}/student/studentImg/${studentDto.student_no}" name="student_img" class="rounded mx-auto d-block" border="0" width="150" height="150">
				<br><hr>
				<label >학생 사진 등록</label><br>
				<input type="hidden" name="student_no" value="${studentDto.student_no}">
				<input class="n-form n-theme" type="file" name="file" accept=".jpg, .png, .gif">
				<input class="btn btn-outline-info" type="submit" value="사진등록">
		    </div>
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
		    	<label>학년</label>  
		    	<input class="form-control" type="text" name="student_grade" value="${studentDto.student_grade}학년" readonly>
		    </div>
		    <div  class="form-group">	
		       	<label>학과</label> 
		       	<input class="form-control" type="text" name="major_no" value="${studentDto.major_no}학과" readonly>		    	
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
	            <input type="date" name="student_birth" id="student_birth" class="form-control" value="<fmt:formatDate value="${birth}" pattern="yyyy-MM-dd" />" readonly>
		    	
		   </div> 	
		   <div class="form-group">
		    	<label>연락처</label> 
		    	<input class="form-control" type="text" name="student_phone" value="${studentDto.student_phone}" readonly>
		   </div>
		   <div class="form-group"> 	
		    	<label>이메일 주소</label> 
		    	<input class="form-control" type="text" name="student_email" value="${studentDto.student_email}" readonly>
		   </div>
		    <div class="form-group">
		       	<label>우편번호</label>
		       	<input class="form-control" type="text" name="student_post" id="student_post" value="${studentDto.student_post}" readonly>
		   </div> 	
		   <div class="form-group"> 
		   		<label>기본주소</label>   	
		    	<input class="form-control" type="text" name="student_addr"  id="student_addr" value="${studentDto.student_addr}" readonly>			
	    	</div>
		   <div class="form-group">
		   		<label>상세주소</label>		    	
		    	<input class="form-control" type="text" name="student_extra_addr"  id="student_extra_addr" value="${studentDto.student_extra_addr}" readonly>
		   </div> 			    
		   <div class="form-group">
		    	<label>병역여부</label> 
		    	<input class="form-control" name="student_milliy" value="${studentDto.student_milliy}" readonly>		    	
		   </div> 	
		   <div class="form-group">
		    	<a class="form-control btn btn-primary btn-block" href="${pageContext.request.contextPath}/student/student_edit?student_no=${userinfo.student_no}" style="color:white">내정보수정하기</a>		    	
		    </div>		
		    <div class="form-group">
		    	<a class="btn_home form-control" href="${pageContext.request.contextPath}/member/main?student_no=${userinfo.student_no}" style="color:white">홈으로</a>		    	
		    </div>	   
		    </form>
		    
    	</div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    