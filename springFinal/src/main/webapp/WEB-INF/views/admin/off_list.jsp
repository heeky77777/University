<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
 href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">	


<script>


$(function() {
	
	/* var stu_state=$('#student_state').val();
	if(stu_state !="휴학"){
		$('.modify-btn').show;
	}
	 */
	
	$('.modify-btn').click(function() {
		var student_state=$(this).next().val();
		var student_no = $(this).data("no");
		
		axios({
			url:"${pageContext.request.contextPath}/adminRest/update?student_no=" + student_no,
			method: "get"
		}).then(function(response){
			
			alert("휴학신청을 승낙하셨습니다.")
			
			location.href="${pageContext.request.contextPath}/admin/off_list"
		});
		
	});
	
	$('.cancel-btn').click(function() {
		var student_no = $(this).data("no");
		
		axios({
			url:"${pageContext.request.contextPath}/adminRest/delete?student_no=" + student_no,
			method: "get"
		}).then(function(response){
			alert("휴학신청이 철회되었습니다")
			location.href="${pageContext.request.contextPath}/admin/off_list"
		});
		
	});	
});

$(function(){
    $("#tablesort").dataTable();
});	
	
	
	</script>
<!-- 	<style>
	
	.modify-btn{
		display: none;
	
	}
	
	</style> -->

<div class="container-fluid">
	<div class="row">
	
		<div class="offset-2 col-8">
			<br>
				<h1 style="text-align: center">휴학신청 전체리스트</h1>
			<br>
			<table class="table table-sm table-hover" id="tablesort" >
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>이름</th>
						<th>학과</th>
						<th>학번</th>
						<th>휴학</th>
						<th>휴학종류</th>
						<th>휴학 신청날짜</th>
						<th>승인</th>
						<th>취소</th>
					</tr>
				</thead>
				<tbody>

					<!-- <form action="off_list" method="post" name="update"> -->
						<c:forEach var="schoolOffDto" items="${list}">
							<tr style="text-align: center">
								<td>${schoolOffDto.student_name}</td>
								<td>${schoolOffDto.major_no}</td>
								<td>${schoolOffDto.student_numb}</td>
								<td>${schoolOffDto.school_off_regist}</td>
								<td>${schoolOffDto.school_off_type}</td>
								<td><fmt:parseDate
										value="${schoolOffDto.school_off_period }" var="time"
										pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
										value="${time}" pattern="yyyy-MM-dd" /></td>

								<td>
									<input type="hidden" value="${schoolOffDto.student_no}" name="student_no" >
									
									
										<c:if test="${schoolOffDto.student_state eq '재학'}">
										<button type="submit" class="btn btn-primary btn-sm modify-btn" data-no="${schoolOffDto.student_no}" >승인</button>
										</c:if>
										
									
									<input type="hidden" value="${schoolOffDto.student_state}" id="student_state">
								</td>
								<td>
								<input type="hidden" value="${schoolOffDto.student_no}" name="student_no">
									<button type="submit" class="btn btn-danger btn-sm cancel-btn" data-no="${schoolOffDto.student_no}">취소 및 삭제</button>
										
								</td>

							</tr>
						</c:forEach>
					</form>
				</tbody>
			</table>

			<!-- 검색창 -->
			<form action="union" method="post">

				<select name="type">
					<option value="student_name"
						${param.type == 'student_name' ? 'selected':''}>이름</option>
					<option value="major_no"
						${param.type == 'major_no' ? 'selected':''}>전공</option>
				</select> <input type="text" name="keyword" placeholder="검색어"
					value="${param.keyword}"> <input type="submit" value="검색">
			</form>

			</tbody>

		</div>
			<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	</div>
</div>
