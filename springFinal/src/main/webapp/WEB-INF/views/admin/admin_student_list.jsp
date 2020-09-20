<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>학생목록</title>
        <style>
        	.row-empty{
        		height: 20px;
        	}
        	 
        	.center{
        		text-align: center;
        	}
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
		<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" type="text/css"
		 href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">  
        
        <script>
        $(function(){
            $("#tablesort").dataTable();
        });   
        </script>
        
    </head>
	<script>
		
	</script>
	
	<body>
		<table class="table table-striped table-bordered table-hover control"  id="tablesort">
			<h1 align="center">학생목록</h1><hr>
        <thead>
            <tr align="center">
                <th>이름</th>
                <th>학번</th>
                <th>학년</th>
                <th>학과</th>                       
                <th></th>                 
            </tr>
        </thead>
        <tbody>
        <c:forEach var="studentDto" items="${student_list}">
        	<tr align="center">
                <td>${studentDto.student_name}</td>
                <td>${studentDto.student_numb}</td>
                <td>${studentDto.student_grade}</td>
                <td>${studentDto.major_no}</td>    
                <td>
                	<a href="${pageContext.request.contextPath}/admin/admin_student_edit?student_no=${studentDto.student_no}">수정</a>
                </td>           
            </tr>
        </c:forEach>       
		    	
		   
        </tbody>
			
		</table>
		<hr>
		<div style="text-align: center;">
			<a class="form-control btn btn-primary" href="${pageContext.request.contextPath}/member/main?student_no=${userinfo.student_no}" style="color:white; width: 30%;">홈으로</a>
		</div>		    	
	</body>
	

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>