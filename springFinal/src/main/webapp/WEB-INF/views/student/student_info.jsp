<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
   	
<div class="container-fluid">
	<div class="form">
		<div class="offset-md-4 col-md-4">
			<br><br>
			<h1 class="form-group" style="text-align: center"> 마이페이지 </h1><hr><br><br>

    		<form action="student_info" method="post">
		    <div class="form-group">
		    	<label>학생이름</label>  
		    	<input class="form-control" type="text" name="student_name" value="${userinfo.student_name}" readonly>
		    </div>
		    <div class="form-group">
				<label>학생 사진 등록</label><br>
				<input class="form-group" type="file" name="student_file_no" readonly>
		    </div>
		    <div class="form-group">    
		    	<label>학번</label>  
		    	<input class="form-control" type="text" name="student_numb" onblur="checkNumb();" value="${userinfo.student_numb}" readonly>
		    	<span class="bool_red" style="color:red"></span>
		    	<span class="bool_blue" style="color:blue"></span>
		    </div>		    
		    <div class="form-group">    
		    	<label>학년</label>  
		    	<input class="form-control" type="text" name="student_grade" value="${userinfo.student_grade}학년" readonly>
		    </div>
		    <div  class="form-group">	
		       	<label>학과</label> 
		       	<input class="form-control" type="text" name="major_no" value="${userinfo.major_no}학과" readonly>		    	
		   </div>
		   <div class="form-group">
		    	<label>학기</label> 
		    	<input class="form-control" type="text" name="semester_no" value="${userinfo.semester_no}" readonly>		    		
		   </div>
		   <div class="form-group">
		    	<label>학적상태</label> 
		    	<input class="form-control" type="text" name="student_state" value="${userinfo.student_state}" readonly>		    		
		   </div>	
		   <div class="form-group">
		   		<label>성별</label>
		   		<input class="form-control" type="text" name="student_gender" value="${userinfo.student_gender}" readonly>		    	  
		   </div> 	
		   <div class="form-group">	
		    	<label>생년월일</label> <!-- 시간 안나오게 설정하는방법 알아보기 -->
		    	<input class="form-control" type="date" name="student_birth" value="${userinfo.student_birth}" readonly>
		   </div> 	
		   <div class="form-group">
		    	<label>연락처</label> 
		    	<input class="form-control" type="text" name="student_phone" value="${userinfo.student_phone}" readonly>
		   </div>
		   <div class="form-group"> 	
		    	<label>이메일 주소</label> 
		    	<input class="form-control" type="text" name="student_email" value="${userinfo.student_email}" readonly>
		   </div>
		    <div class="form-group">
		       	<label>우편번호</label>
		       	<input class="form-control" type="text" name="student_post" id="student_post" value="${userinfo.student_post}" readonly>
		   </div> 	
		   <div class="form-group"> 
		   		<label>기본주소</label>   	
		    	<input class="form-control" type="text" name="student_addr"  id="student_addr" value="${userinfo.student_addr}" readonly>			
	    	</div>
		   <div class="form-group">
		   		<label>상세주소</label>		    	
		    	<input class="form-control" type="text" name="student_extra_addr"  id="student_extra_addr" value="${userinfo.student_extra_addr}" readonly>
		   </div> 	
		    
		   <div class="form-group">
		    	<label>병역여부</label> 
		    	<input class="form-control" name="student_milliy" value="${userinfo.student_milliy}" readonly>		    	
		   </div> 	
		   <div class="form-group">
		    	<a class="form-control btn btn-primary btn-block" href="${pageContext.request.contextPath}/student/student_edit" style="color:white">내정보수정하기</a>
		    	
		    </div>
		    </form>
		    
    	</div>
    </div>
</div>

    