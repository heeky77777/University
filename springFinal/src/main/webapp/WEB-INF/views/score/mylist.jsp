 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
	
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
 href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css"> 	

<script>
$(function(){
    $("#tablesort").dataTable();
});   
</script>

<div class="container-fluid">
	<div class="row">
		<div class="offset-2 col-8">

	<br>
			
			<h1 class="form-group" style="text-align: center">학생 성적 정보</h1>
			<br>
			<table class="table table-sm table-hover"  id="tablesort">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>이름</th>
						<th>학번</th>
						<th>전공</th>
						<th>과목</th>
						<th>성적</th>
						
						<th>학점</th>
						
					</tr>
				</thead>
				<tbody style="text-align: center">
					<c:forEach var="smcDto" items="${mylist}">
						<tr>
							<td>${smcDto.student_name}</td>
							<td>${smcDto.student_numb}</td>
							<td>${smcDto.major_type}</td>
							<td>${smcDto.class_sub_name}</td>
							<td>${smcDto.class_score_type}</td>
							<td>${smcDto.class_score}</td>
							
						</tr>
						<c:set var= "sum" value="${sum + smcDto.class_score}"/>
					</c:forEach>
						<c:set var="count" value="${fn:length(mylist)}"/>
						
						<c:set var="avr" value="${sum/count}"/>
					
				</tbody>
			</table>
			<tr style="text-align: left;"> 성적 총 합계 :
					<td> <c:out value="${sum}"/> </td>
					
			</tr>
			
			<tr style="text-align: right;"> 성적 평균:
				<td> <c:out value="${avr}"/> </td>
			
			</tr>

					
			
		
			
			</form>
			
				
			
			
			
			

</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
</div>
</div>