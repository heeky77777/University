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
		    	<input class="form-control" type="text" name="student_name" value="${userinfo.student_name}">
		    </div>
		    <div class="form-group">
				<label>학생 사진 등록</label><br>
				<input class="form-group" type="file" name="student_file_no">
		    </div>
		    <div class="form-group">    
		    	<label>학번</label>  
		    	<input class="form-control" type="text" name="student_numb" onblur="checkNumb();" value="${userinfo.student_numb}">
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
		    	<select class="form-control" name="major_no">
		    			<option>경영학과</option>
		    			<option>어문학과</option>
		    			<option>성악과</option>
		    			<option>시스템공학과</option>
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
		   </div> 	
		   <div>    	
		       	<input size=10 type="text" name="student_post" placeholder="우편번호" id="student_post">
		    	<input type="button" value="우편번호 검색" onclick="sample6_execDaumPostcode()" size=10>
	    	</div><br>
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

    