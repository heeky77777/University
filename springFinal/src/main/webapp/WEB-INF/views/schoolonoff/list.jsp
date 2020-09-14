<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>


<div class="container-fluid">
	<div class="row">
		<div class="offset-2 col-8">

	<br>
			
			<h1 class="form-group" style="text-align: center">휴학신청 정보</h1>
			<br>
			<table class="table table-sm table-hover">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>이름</th>
						<th>학번</th>
						<th>전공</th>
						<th>성별</th>
						<th>휴학종류</th>
						<th>휴학기간</th>
						<th>휴학시작날짜</th>
					</tr>
				</thead>
				<tbody style="text-align: center">

					<tr>
						<td>${userinfo.student_name}</td>
						<td>${userinfo.student_numb}</td>
						<td>${userinfo.major_no}</td>
						<td>${userinfo.student_gender}</td>
						<td>${userlist.school_off_type}</td>
						<td>${userlist.school_off_regist}</td>
						<td>${userlist.school_off_period}</td>
					</tr>

				</tbody>
			</table>
			
			
		
			
			</form>
			
			
				
			
			
			
			

</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>