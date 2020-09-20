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
        	        .hacademy-scheduler * {
            box-sizing: border-box;
        }

        .hacademy-scheduler {
            position: relative;
        }

        .hacademy-scheduler>.scheduler-row-header,
        .hacademy-scheduler>.scheduler-column-header,
        .hacademy-scheduler>.scheduler-task {
            position: absolute;
        }

        .hacademy-scheduler>.scheduler-row-header.border,
        .hacademy-scheduler>.scheduler-column-header.border,
        .hacademy-scheduler>.scheduler-task.border {
            border: 1px solid black;
        }

        .hacademy-scheduler>.scheduler-row-header>span,
        .hacademy-scheduler>.scheduler-column-header>span,
        .hacademy-scheduler>.scheduler-task>span {
            display: block;
            position: absolute;
            left: 50%;
            top: 50%;
            width: 100%;
            text-align: center;
            transform: translate(-50%, -50%);
            white-space: pre;
            text-overflow: ellipsis;
            overflow: hidden;
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
			<h1>시간표</h1>
			<div class="form-group form-inline">
					<form action="student_schedule" method="post">
	                       <input type="text" name="regist_date" id="regist_year" value="${now_year}" class="form-control" style="text-align: center; width: 30%">&nbsp;년도
	                       <select name="semester_type" id="semester_type" class="form-control" onchange="get_semester();">
	                         <option ${param.semester_type == '1학기' ? 'selected':''}>1학기</option>      
	                         <option ${param.semester_type == '2학기' ? 'selected':''}>2학기</option>      
	                       </select>&nbsp;&nbsp;&nbsp;
	                      	<input type="hidden" name="semester_no" id="semester_no">
	                      	<input type="hidden" name="student_no" value="${userinfo.student_no}">
							<input type="submit" value="강의조회"  class="btn btn-primary" style="background-color :#063e7a">
					</form>		
	        </div>
		<table class="table table-striped table-bordered table-hover table-condensed">
	        <thead>
	            <tr class="center">
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
	        		<td style="width: 10%; height: 150px;" class="center">
	    			<c:if test="${b != null}">
						<label style="color: green;">강의 이름 : ${b.class_sub_name}/</label>
						<label style="color: blue;">${b.class_sub_type}</label><br>
						<label style="color: red;">학점  ${b.class_sub_point}</label><br>
						<c:if test="${b.class_sub_time1 != 0}">
							<label>${b.class_sub_time1}교시</label>
						</c:if>
						<c:if test="${b.class_sub_time2 != 0}">
							<label>${b.class_sub_time2}교시</label>
						</c:if>
						<c:if test="${b.class_sub_time3 != 0}">
							<label>${b.class_sub_time3}교시</label>
						</c:if>
						<c:if test="${b.class_sub_time4 != 0}">
							<label>${b.class_sub_time4}교시</label>
						</c:if>
						<br>
						<label>강의실(${b.class_sub_room})</label>
	        		</c:if>
	        		</td>
			    </c:forEach>
			    </tr>
			</c:forEach>
	        </tbody>
		</table>


	</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>