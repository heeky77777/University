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
	    
		function now_apply() {
			
			var socket;
			
				var uri = "ws://localhost:8080/spring97/go";
				socket = new WebSocket(uri);
				
//		 		연결이 되었는지 안되었는지 확인할 수 있도록 예약 작업(콜백)을 설정
				socket.onopen = function(){
					console.log("연결되었씁닏강");
				};
				
				socket.onmessage = function(e){
				console.log(e.data);
				
					if(e.data==("waitting")){
					location.href ='${pageContext.request.contextPath}/student/student_apply_wait';
					}
					
			};	
			
			
		}
	    
	    function get_semester(){
	    	
	    	var url = location.search.substr(location.search.indexOf("?") + 1);
	    	var findString ="error";
			console.log(url);
			if(url.indexOf(findString) != -1) {
				history.replaceState({}, null, location.pathname);
				alert("신청된 강의 입니다.");
			}
			
	    	
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
		function apply_check(){
      
        	var result = confirm("정말 신청하시겠습니까??");
            if (!result){ 
//                 document.form.submit();
            	return false;
            }
            else{
            	document.form.submit();
            	}
            }
		
// 		function apply_class(){
			
// 			var class_sub_no = document.querySelector("#semester_no").value;
// 			var major_no = document.querySelector("#major_no").value;
// 			var student_no = document.querySelector("#student_no").value;
// 			var subject_apply_name = document.querySelector("#subject_apply_name").value;
			
// 			axios({			
// 				url:"${pageContext.request.contextPath}/apply/apply_class?class_sub_no=" + class_sub_no + "&major_no=" + major_no + "&student_no=" + student_no + "&subject_apply_name=" + subject_apply_name, 
// 				method:"get"
// 			}).then(function(response){
// 				console.log(response);
// 	    	})	
// 		}
	    window.onload=get_semester;
	    
	    </script>
	    <body onload="now_apply();">
			<h1>강의신청</h1>
			<div class="form-group form-inline">
					<form action="subject_list" method="post">
	                       <input type="text" name="regist_date" id="regist_year" value="${now_year}" class="form-control">
	                          <label>년도</label>
	                       <select name="semester_type" id="semester_type" class="form-control" onchange="get_semester();">
	                         <option ${param.semester_type == '1학기' ? 'selected':''}>1학기</option>      
	                         <option ${param.semester_type == '2학기' ? 'selected':''}>2학기</option>      
	                       </select>&nbsp;&nbsp;&nbsp;
	                       <select name="major_type" id="major_type" class="form-control" required onchange="get_semester();">
                                <option value="" ${param.majorSearch == '' ? 'selected':''}>학과 선택</option>
                                <c:forEach var="majorDto" items="${majorList}">
	                                <option ${param.major_type == majorDto.major_type ? 'selected':''}>${majorDto.major_type}</option>
                                </c:forEach>
                            </select>
	                      <input type="hidden" name="major_no" id="major_no">&nbsp;&nbsp;&nbsp;
	                      <input type="hidden" name="semester_no" id="semester_no">
	                      <input type="hidden" name="student_no" value="${userinfo.student_no }">
<!-- 	                      <button class="btn btn-secondary btn-sm" onclick="get_list();">강의조회</button> -->
							<input type="submit" value="강의조회"  class="btn btn-primary" style="background-color :#063e7a">
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
<%-- 				<c:forEach var="classSubjectDto" items="${classList}">  --%>
<!-- 					<form action="student_class_apply" method="post"> -->
<!-- 					<tr> -->
<%-- 						<input type="hidden" name="class_sub_no" id="class_sub_no" value="${classSubjectDto.class_sub_no}"> --%>
<%-- 						<input type="hidden" name="major_no" id="major_no" value="${classSubjectDto.major_no}"> --%>
<%-- 						<input type="hidden" name="student_no" id="student_no" value="${userinfo.student_no}"> --%>
<%-- 						<input type="hidden" name="subject_apply_name" id="subject_apply_name" value="${classSubjectDto.class_sub_name}"> --%>
<%-- 						<td>${classSubjectDto.class_sub_name}</td> --%>
<%-- 						<td>${classSubjectDto.profe_name}</td> --%>
<%-- 						<td>${classSubjectDto.class_sub_point}</td> --%>
<%-- 						<td>${classSubjectDto.class_sub_type}</td> --%>
<!-- 						<td> -->
<%-- 							<c:set var="class_sub_time2" value="${classSubjectDto.class_sub_time2}"/> --%>
<%-- 		                            	<c:set var="class_sub_time3" value="${classSubjectDto.class_sub_time3}"/> --%>
<%-- 		                            	<c:set var="class_sub_time4" value="${classSubjectDto.class_sub_time4}"/> --%>
<%-- 		                            	${classSubjectDto.class_sub_week} ${classSubjectDto.class_sub_time1}  --%>
<%-- 		                            	<c:if test="${class_sub_time2 != 'null'}"> --%>
<%-- 		                            		${classSubjectDto.class_sub_time2}  --%>
<%-- 		                            	</c:if> --%>
<%-- 		                            	<c:if test="${class_sub_time3 != 'null'}"> --%>
<%-- 		                            		${classSubjectDto.class_sub_time3}  --%>
<%-- 		                            	</c:if> --%>
<%-- 		                            	<c:if test="${class_sub_time4 != 'null'}"> --%>
<%-- 		                            		${classSubjectDto.class_sub_time4}  --%>
<%-- 		                            	</c:if> --%>
<%-- 		                            	(${classSubjectDto.class_sub_room}) --%>
<!-- 						</td> -->
<%-- 						<td>${classSubjectDto.class_sub_person}</td> --%>
<!-- 						<td> -->
<%-- <%-- 						<c:if test="${sub_check != null}"> --%>
<!-- <!-- 							<input type="submit" value="강의신청" onclick="return apply_check();"  class="btn btn-primary btn-block regist-btn">	 --> 
<!-- <!-- 							<button class="btn btn-primary" onclick="apply_class();">강의신청</button> -->
<%-- <%-- 						</c:if> --%>
<%-- <%-- 						<c:otherwise> --%>
<!-- <!-- 							<span class="btn btn-primary btn-block regist-btn">신청완료</span> -->
<%-- <%-- 						</c:otherwise> --%>
							
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					</form> -->
<%-- 				</c:forEach> --%>
				</tbody>
		</table>
	</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>