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
	    	
	    }
	    
	window.onload=get_semester;
	</script>
	<body>
		<table class="table table-striped table-bordered table-hover">
			<h1>시간표</h1>
			<div class="form-group form-inline">
					<form action="student_schedule" method="post">
	                       <input type="text" name="regist_date" id="regist_year" value="${now_year}" class="form-control">
	                          <label>년도</label>
	                       <select name="semester_type" id="semester_type" class="form-control" onchange="get_semester();">
	                         <option ${param.semester_type == '1학기' ? 'selected':''}>1학기</option>      
	                         <option ${param.semester_type == '2학기' ? 'selected':''}>2학기</option>      
	                       </select>&nbsp;&nbsp;&nbsp;
	                      	<input type="hidden" name="semester_no" id="semester_no">
	                      	<input type="hidden" name="student_no" value="${userinfo.student_no}">
							<input type="submit" value="강의조회"  class="btn btn-primary" style="background-color :#063e7a">
					</form>		
	        </div>
        <thead>
            <tr>
            	<th></th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th> 
            </tr>
        </thead>
        <tbody>
        <c:forEach var = "schedule" items="${schedule}">
    		<tr>
    		<c:forEach var = "b" items="${schedule}">
        		<td>
					${b.class_sub_name}
        		</td>
		    </c:forEach>
		    </tr>
		</c:forEach>
        </tbody>

		</table>
	</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>