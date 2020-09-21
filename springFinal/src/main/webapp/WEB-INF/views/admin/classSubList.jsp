<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script>

	$(function() {
		        
        /* 파일 다운로드 */
		$('.plan-btn').click(function() {
			var subNo = $(this).prev().val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/classSubject/planDown?class_sub_no=" + subNo,
				method:"get",
				contentType: 'application/pdf',
				success:function(response) {
					location.href="${pageContext.request.contextPath}/classSubject/planDown?class_sub_no=" + subNo;
				},
				error:function() {
					alert('파일이 존재하지 않습니다');
				}				
			});
		});


	});

	
</script>


<style>

	.row-empty {
	    height: 20px;
	}
	
	.sub-btn {
	    background-color: #063E7A;
	    border-color: #063E7A;
	}
	
	.sub-btn:hover {
	    background-color: #1D5798;
	}
	
	.btn,
	.form-control {
	    margin: 5px;
	}

	.margin-div {
		margin-right: 40px;
	}
	
	.form-group {
	    margin-bottom: 10px;
	}
	
</style>


<div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 offset-md-1 col-md-10 offset-sm-1 col-sm-10">
                <div>
                    <h1 class="text-center">강의 목록</h1>
                </div>
                
                <div class="row-empty"></div>
                
		                <form action="classSubList" method="post">
			                <div class="row">
			                    <div class="col-xs-12 col-sm-3 col-md-3 form-inline">
			                        <label>년도&nbsp;</label>
			                            <input type="text" name="yearSearch" class="form-control" value="${param.yearSearch}">
			                    </div>
			                    
			                    <div class="col-xs-12 col-sm-9 col-md-9 form-inline">
			                    	<div class="form-inline margin-div">
			                        <label>학기&nbsp;</label>
			                        <select name="semesterSearch" class="form-control">
			                        	<option value="all" ${param.majorSearch == 'all' ? 'selected':''}>전체</option>
			                            <option ${param.semesterSearch == '1학기' ? 'selected':''}>1학기</option>
			                            <option ${param.semesterSearch == '2학기' ? 'selected':''}>2학기</option>
			                        </select>
			                    	</div>
			                        <div class="form-inline">
			                        	<label>교수&nbsp;</label>
		                                <input type="text" name="profeSearch" class="form-control" value="${param.profeSearch}">
		                            </div>
			                    </div>
			                </div>
			                
							<div class="row">
			                    <div class="col-xs-12 col-sm-3 col-md-3 form-inline">
			                        <label>학과&nbsp;</label>
		                            <select name="majorSearch" id="" class="form-control">
		                                <option value="all" ${param.majorSearch == 'all' ? 'selected':''}>전체</option>
		                                <c:forEach var="majorDto" items="${majorList}">
			                                <option ${param.majorSearch == majorDto.major_type ? 'selected':''}>${majorDto.major_type}</option>
		                                </c:forEach>
		                            </select>
			                    </div>
			                    <div class="col-xs-12 col-sm-9 col-md-9 form-inline ">
			                        <div class="form-inline mr-5">
				                        <label >구분&nbsp;</label>
				                        <select name="typeSearch" class="form-control">
				                            <option value="all" ${param.majorSearch == 'all' ? 'selected':''}>전체</option>
				                            <option ${param.typeSearch == '전공' ? 'selected':''}>전공</option>
				                            <option ${param.typeSearch == '교양' ? 'selected':''}>교양</option>
				                            <option ${param.typeSearch == '교필' ? 'selected':''}>교필</option>
				                        </select>
			                        </div>
			                        <div class="form-inline mr-auto">
		                                <label>강의&nbsp;</label>
		                                <input type="text" name="classSubSearch" class="form-control" value="${param.classSubSearch}">
		                                <button type="submit" class="btn btn-primary btn-sm search-btn sub-btn">검색</button>
		                            </div>
			                    </div>
		                    </div>
					    </form>
			    
			    
			    
                <div class="row-empty"></div>

				<div class="table-responsive text-center">
	                <table class="table table-hover">
	                    <thead>
	                        <tr>
	                            <th>강의 번호</th>
	                            <th>전공</th>
	                            <th>학기</th>
	                            <th width="20%">강의 명</th>
	                            <th>담당교수</th>
	                            <th>학점</th>
	                            <th>이수구분</th>
	                            <th>강의시간</th>
	                            <th>제한인원</th>
	                            <th>강의계획서</th>
	                        </tr>
	                    </thead>
	                    <tbody>
							<c:forEach var="classSubjectDto" items="${classSubList}">
		                        <tr>
		                            <td>${classSubjectDto.class_sub_no}</td>
		                            <td>${classSubjectDto.major_type}</td>
		                            <td>${classSubjectDto.semester_type}</td>
		                            <td>${classSubjectDto.class_sub_name}</td>
		                            <td>${classSubjectDto.profe_name}</td>
		                            <td>${classSubjectDto.class_sub_point}</td>
		                            <td>${classSubjectDto.class_sub_type}</td>
		                            <td>
		                            	<c:set var="class_sub_time2" value="${classSubjectDto.class_sub_time2}"/>
		                            	<c:set var="class_sub_time3" value="${classSubjectDto.class_sub_time3}"/>
		                            	<c:set var="class_sub_time4" value="${classSubjectDto.class_sub_time4}"/>
		                            	${classSubjectDto.class_sub_week} ${classSubjectDto.class_sub_time1} 
		                            	<c:if test="${class_sub_time2 != 0}">
		                            		${classSubjectDto.class_sub_time2} 
		                            	</c:if>
		                            	<c:if test="${class_sub_time3 != 0}">
		                            		${classSubjectDto.class_sub_time3} 
		                            	</c:if>
		                            	<c:if test="${class_sub_time4 != 0}">
		                            		${classSubjectDto.class_sub_time4} 
		                            	</c:if>
		                            	&lpar;${classSubjectDto.class_sub_room}&rpar;</td>
		                            <td>${classSubjectDto.class_sub_person}</td>
		                            <td>
		                            	<input type="hidden" value="${classSubjectDto.class_sub_no}">
		                                <button type="button" class="btn btn-primary btn-sm plan-btn sub-btn">강의계획서</button>
		                            </td>
		                        </tr>
							</c:forEach>
	                    </tbody>
	                </table>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>