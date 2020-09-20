<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>



<style>

	.row-empty {
		height: 20px;
	}

</style> 

<div class="row-empty"></div>
<div class="row-empty"></div>
<div class="row-empty"></div>
<div class="row-empty"></div>

<div class="row">
	<div class="offset-4 col-4">
		<h4></h4>
		<img src="${pageContext.request.contextPath}/resources/img/404.png" width="700px" height="700px">
	</div>
</div>
	
    
    
<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>