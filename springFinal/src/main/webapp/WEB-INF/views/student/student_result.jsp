<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
   integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A=="
   crossorigin="anonymous"></script>


<div class="container-fluid">
   <div class="row">
      <div class="offset-2 col-8">

   <br><br><br><br><br><br>
         
         <h1 style="text-align: center">정보 입력이 완료되었습니다. 감사합니다.</h1>
         <br><br><br><br><br><br>
		<div style="text-align: center;">
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/member/main" style="color:white; width: 30%">홈으로</a>
		</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>