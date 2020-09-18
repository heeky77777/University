<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
	crossorigin="anonymous"></script>

<script>



function error_page(){
	var url = location.search.substr(location.search.indexOf("?") + 1);
	console.log(url);
	if(url=='error') {
		history.replaceState({}, null, location.pathname);
		alert("이미 휴학 신청이 완료되었습니다.");
	}
	
}
 window.onload=error_page;

 function apply_check(){
     
     var result = confirm("정말 신청하시겠습니까??");
      if (!result){ 
//           document.form.submit();
         return false;
      }
      else{
         document.form.submit();
         }
      }

 
</script>

<div class="container-fluid">
	<div class="row">
		<div class="offset-2 col-8">

	<br>
			
			<h1 class="form-group" style="text-align: center">휴학신청</h1>
			<br>
			<table class="table table-sm table-hover">
				<thead class="thead-dark">
					<tr>
						<th>이름</th>
						<th>학번</th>
						<th>전공</th>
						<th>성별</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>${userinfo.student_name}</td>
						<td>${userinfo.student_numb}</td>
						<td>${userinfo.major_no}</td>
						<td>${userinfo.student_gender}</td>

					</tr>

				</tbody>
			</table>
			
			
			<form action="off" method="post">
				<input type="hidden" name="student_no" value="${userinfo.student_no}">
				<div class="form-group">
					<label>휴학 신청기간:</label> <select class="form-control"
						name="school_off_regist">
						<option>1년</option>
						<option>2년</option>
						
					</select>
					<label>휴학 종류:</label> <select class="form-control"
						name="school_off_type">
						<option>일반 휴학</option>
						<option>군 휴학</option>
						
					</select>
				</div>

				<div class="form-group">
					<label>휴학 신청 날짜 :</label> <input class="form-control" type="date" name="school_off_period"
						required>
				</div>
	 <div class="form-group">
		    	<input class="form-control btn btn-primary btn-block" type="submit" onclick= "apply_check()" value="등 록" style="background-color :#063e7a">
		    </div>
			
			</form>
			<div>
				<a href="${pageContext.request.contextPath}/schoolonoff/list?student_no=${userinfo.student_no}">자신의 휴학신청 정보 보기</a>
			</div>
			
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>