<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>




<style>

	.row-empty {
	    height: 20px;
	}
	
	.plan-btn,
	.search-btn {
	    background-color: #063E7A;
	    border-color: #063E7A;
	}
	
	.plan-btn:hover,
	.search-btn:hover {
	    background-color: #2066b0;
	}
	
	.btn,
	.form-control {
	    margin: 1px;
	}
	
	.form-group {
	    margin-bottom: 10px;
	}
	
</style>


<div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 offset-md-2 col-md-8">
                <div>
                    <h1 class="text-center">강의 목록</h1>
                </div>
                
                <div class="row-empty"></div>
                
                <div class="row">
                    <div class="form-group form-inline">
                        <label for="">년도&nbsp;</label>
                            <input type="text" name="" id="" class="form-control">
                    </div>
                </div>
                
                
				<div class="row">
                    <div class="col-xs-12 col-sm-3 col-md-3 form-inline">
                        <label>구분&nbsp;</label>
                        <select name="" id="" class="form-control">
                            <option value="">전공</option>
                            <option value="">교양</option>
                            <option value="">교필</option>
                        </select>
    
                    </div>
                    <div class="col-xs-12 col-sm-9 col-md-9 form-inline">
                        <div class="form-inline mr-auto">
                            <label>학과&nbsp;</label>
                            <select name="" id="" class="form-control">
                                <option value="">선택</option>
                                <option >경영학과</option>
                                <option >금융세무학</option>
                                <option >문예창장학과</option>
                                <option >도시공학과</option>
                                <option >시스템공학과</option>
                                <option >성악과</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" name="" id="" placeholder="강의 명" class="form-control">
                            <button class="btn btn-primary btn-sm search-btn">검색</button>
                        </div>
    
                    </div>
    
                </div>

                <div class="row-empty"></div>

				<div class="table-responsive">
	                <table class="table table-hover">
	                    <thead>
	                        <tr>
	                            <th>강의 번호</th>
	                            <th>강의 명</th>
	                            <th>담당교수</th>
	                            <th>학점</th>
	                            <th>이수구분</th>
	                            <th>강의시간</th>
	                            <th>제한인원</th>
	                            <th>기타</th>
	                            <th>수업계획서</th>
	                        </tr>
	                    </thead>
	                    <tbody>
							<c:forEach var="classSubjectDto" items="${list}">
		                        <tr>
		                            <td>${classSubjectDto.class_sub_no}</td>
		                            <td>${classSubjectDto.class_sub_name}</td>
		                            <td>${classSubjectDto.profe_no}</td>
		                            <td>${classSubjectDto.class_sub_point}</td>
		                            <td>${classSubjectDto.class_sub_type}</td>
		                            <td>${classSubjectDto.class_sub_week} ${classSubjectDto.class_sub_time} (${classSubjectDto.class_sub_room})</td>
		                            <td>${classSubjectDto.class_sub_person}</td>
		                            <td>-</td>
		                            <td>
		                                <button class="btn btn-primary btn-sm plan-btn">수업계획서</button>
		                            </td>
		                        </tr>
							</c:forEach>
	                    </tbody>
	                </table>
                </div>
            </div>
        </div>
    </div>









