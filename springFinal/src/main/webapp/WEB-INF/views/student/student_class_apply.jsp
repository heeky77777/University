<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	 	<head>
	        <meta charset="UTF-8">
	        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	        <title>Document</title>
	        <style>
	        	.row-empty{
	        		height: 20px;
	        	}
	        	 
	        	.center{
	        		text-align: center;
	        	}
	        </style>
	        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
	        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	    </head>
	    <script>
	    function get_semester(){
	    	
	    	var regist_year = document.querySelector("#regist_year").value;
	    	console.log(regist_year);
	    	var semester_type = document.querySelector("#semester_type").value;
	    	console.log(semester_type);
	    	
	    	
	    	axios({			
				url:"${pageContext.request.contextPath}/apply/get_semester?semester_start="+regist_year+"&semester_type="+semester_type, 
				method:"get"
			}).then(function(response){
				
				var semester_no =  document.querySelector("#semester_no");
				semester_no.value = response.data.semester_no;
				console.log(semester_no.value);
	    	})
	    	
	    	var major_type = document.querySelector("#major_type").value;
	    	
	    	
	    	axios({			
				url:"${pageContext.request.contextPath}/apply/get_major?major_type="+major_type,
				method:"get"
			}).then(function(response){
				
				var major_no =  document.querySelector("#major_no");
				major_no.value = response.data.major_no;
				console.log(major_no.value);
	    	})
	    	
	    	
	    }
	    
// 		function get_list(){
// 			var regist_year = document.querySelector("#regist_year").value;
// 			console.log(regist_year);
// 	    	var major_no = document.querySelector("#major_no").value;
// 	    	console.log(major_no);
// 	    	var semester_no = document.querySelector("#semester_no").value;
// 	    	console.log(semester_no);
	    	
	    	
// 	    	axios({			
// 				url:"${pageContext.request.contextPath}/apply/subject_list?regist_date=" + regist_year + "&major_no=" + major_no + "&semester_no=" + semester_no, 
// 				method:"get"
// 			}).then(function(response){
// 				console.log(response.data);
				
// 				for(var i=0; i < response.data.length; i++){
// 					//h3 태그를 만들어서 정보를 설정하고 div에 추가
// 					var h3 = document.createElement("h3");
// 					var name = response.data[i].name;
// 					var score = response.data[i].score;
// 					h3.textContent = name + " : "+score+"점";
// 					div.appendChild(h3);
// 				}
// 	    	})
	    	
// 		}
		
	    window.onload=get_semester;
	    
	    </script>
	    
			<h1>강의신청</h1>
			
		
			<div class="form-group form-inline">
					<form action="subject_list" method="post">
	                       <input type="text" name="regist_date" id="regist_year" value="${now_year}" class="form-control">
	                          <label>년도</label>
	                       <select id="semester_type" class="form-control" onchange="get_semester();">
	                         <option>1학기</option>      
	                         <option>2학기</option>      
	                       </select>&nbsp;&nbsp;&nbsp;
	                      <select id="major_type" class="form-control" onchange="get_semester();">
	                          <option>경영학과</option>
	                          <option>금융세무학과</option>
	                          <option>도시공학과</option>
	                          <option>시스템공학과</option>
	                          <option>문예창작학과</option>
	                          <option>성악과</option>
	                      </select>
	                      <input type="hidden" name="major_no" id="major_no">&nbsp;&nbsp;&nbsp;
	                      <input type="hidden" name="semester_no" id="semester_no">
<!-- 	                      <button class="btn btn-secondary btn-sm" onclick="get_list();">강의조회</button> -->
							<input type="submit" value="강의조회">
					</form>		
	                  </div>
                    
                  
                  <div class="form-group form-inline">
                      
                  </div>
		<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th>강의 명</th>
						<th>담당교수</th>
						<th>학점</th>
						<th>이수구분</th>
						<th>강의시간</th>
						<th>신청가능인원</th>
						<th></th>
		 			</tr>
				</thead>
				<tbody>
				<c:forEach var="classSubjectDto" items="${apply_list}"> 
					<form action="student_class_apply" method="post">
					<tr>
						<input type="hidden" name="class_sub_no" id="class_sub_no" value="${classSubjectDto.class_sub_no}">
						<input type="hidden" name="major_no" id="major_no" value="${classSubjectDto.major_no}">
						<input type="hidden" name="student_no" id="student_no" value="${userinfo.student_no}">
						<input type="hidden" name="subject_apply_name" id="subject_apply_name" value="${classSubjectDto.class_sub_name}">
						<td>${classSubjectDto.class_sub_name}</td>
						<td>${classSubjectDto.profe_name}</td>
						<td>${classSubjectDto.class_sub_point}</td>
						<td>${classSubjectDto.class_sub_type}</td>
						<td>${classSubjectDto.class_sub_week} ${classSubjectDto.class_sub_time} (${classSubjectDto.class_sub_room})</td>
						<td>${classSubjectDto.class_sub_person}</td>
						<td>
							<input type="submit" value="강의신청">
						</td>
					</tr>
					</form>
				</c:forEach>
				</tbody>
		</table>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>