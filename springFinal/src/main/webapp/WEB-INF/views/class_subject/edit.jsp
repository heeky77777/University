<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>

	$(window).on('beforeunload', function() {
	    return false;  
	})

	$(function() {
	    
		/* 강의 시작, 종료일 표시 */
		$.ajax({
            url:"${pageContext.request.contextPath}/classSubject/semesterDate?this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val(),
            method:"get",
            success:function(response){
                var start_time = response.semester_start.substring(0, 10);
                var finish_time = response.semester_finish.substring(0, 10);
                $('#class_sub_start').attr('min', start_time).attr('max', finish_time);
                $('#class_sub_end').attr('min', start_time).attr('max', finish_time);
            }
        })
		
		$('#semester_type').change(function(){
	        $.ajax({
	            url:"${pageContext.request.contextPath}/classSubject/semesterDate?this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val(),
	            method:"get",
	            success:function(response){
	                var start_time = response.semester_start.substring(0, 10);
	                var finish_time = response.semester_finish.substring(0, 10);
	                $('#class_sub_start').attr('min', start_time).attr('max', finish_time);
	                $('#class_sub_end').attr('min', start_time).attr('max', finish_time);
	            }
	        })
			
		})
		
		
		/* 강의실 중복 조회 */
    	$('#check-btn').click(function(){
			var class_sub_room = $('input[name=class_sub_room]').val();
    		
    		if(!class_sub_room){
    			$('#lecture_check').removeClass('pass').addClass('fail').text('학기, 요일, 교시, 강의실을 다시 확인해 주세요');
    			return;
    		}
        
	        $.ajax({
	        	url:"${pageContext.request.contextPath}/classSubject/roomCheck?this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val() + "&class_sub_week=" + $('#class_sub_week').val() + "&class_sub_time=" + $('#class_sub_time').val() + "&class_sub_room=" + class_sub_room,
	            type:"get",
	            success:function(response) {
	            	console.log(response);
	                if(!response){	// 결과 없음 : 사용 가능
	                    $('#lecture_check').removeClass('fail').addClass('pass').text('강의 등록 가능');
	                }
	                else {	// 결과 있음 : 사용 불가능
	                	$('#lecture_check').removeClass('pass').addClass('fail').text('학기, 요일, 교시, 강의실을 다시 확인해 주세요');
	                }
	            },
                error:function() {
                	$('#lecture_check').removeClass('pass').addClass('fail').text('학기, 요일, 교시, 강의실을 다시 확인해 주세요');
                }
	        })
	
	    })
	    
	    
	    /* 강의 등록 확인 */
	    $('.regist-btn').click(function() {
	    	var registCheck = confirm('강의를 등록 하시겠습니까?');
	    	if(!registCheck) {
	    		return false;
	    	}
	    	else {
	    		$.ajax({
	    			url:"${pageContext.request.contextPath}/classSubject/subEdit?this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val() + "&class_sub_week=" + $('#class_sub_week').val() + "&class_sub_time=" + $('#class_sub_time').val() + "&class_sub_name=" + $('input[name=class_sub_name]').val() + "&class_sub_room=" + $('input[name=class_sub_room]').val(),
	    			type:"get",
	    			success:function(response){
	    				if(response) {
	    					alert("이미 등록된 강의 입니다");
	    					return false;
	    				}
	    				else{
	    					return true;
	    				}
	    			}
	    		})	    		
	    	}
	    })
	    

	    /* 수정 버튼 */
		$('.modify-btn').click(function() {
			var modifyCheck = confirm("수정하시겠습니까??");
			if(!modifyCheck){
				return false;
			}
			else {
				$(window).off('beforeunload');
				$.ajax({
	    			url:"${pageContext.request.contextPath}/classSubject/subCheck?this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val() + "&class_sub_week=" + $('#class_sub_week').val() + "&class_sub_time=" + $('#class_sub_time').val() + "&class_sub_name=" + $('input[name=class_sub_name]').val() + "&class_sub_room=" + $('input[name=class_sub_room]').val(),
	    			type:"get",
	    			success:function(response){
	    				if(response) {
	    					alert("이미 등록된 강의 입니다");
	    				}
	    			}
	    		})	    		
			}
		})
	    
	    
	    /* 취소 버튼 */
	    $('.cancel-btn').click(function() {
	    	var cancelCheck = confirm("수정을 취소하시겠습니까?");
	    	if(!cancelCheck) {
	    		return false;
	    	}
	    	else{
	    		$(window).off('beforeunload');
				location.href='${pageContext.request.contextPath}/class_subject/list';
	    	}
	    	
	    })
	    
	    
	
	
	})
	

</script>


<style>
	.row-empty {
		height: 20px;
	}
    
    .regist-btn,
    .modify-btn {
        background-color: #063E7A;
        border-color: #063E7A;
            
    }
    
    .regist-btn:hover,
    .modify-btn:hover {
    	background-color: #1D5798;
    }
    
    
    
	.btn,
	.form-control {
    	margin: 5px;
    }
 
 	.form-group {
    	margin: 5px;
    }
    
    .pass {
    	color: blue;
        font-size: 14px;
    }
    
    .fail {
        color: red;
        font-size: 14px;
    }
    label {
    	margin: 3px;
    }
    
    .modify-btn,
    .cancel-btn {
    	width: 45%;
        margin: auto;
    }   
	
</style>


<title>KH 대학교 : 강의 등록</title>


	<div class="container-fluid">
		
		<div class="row-empty"></div>
		<div class="row-empty"></div>
		
		<div>
	       <h2 class="text-center">강의 수정</h2>
	   </div>
	
	   <div class="row">
	       <div class="offset-md-3 col-md-6">
	           <form action="edit" class="form" method="post" enctype="multipart/form-data">
	               <div class="form-group">
	                   <label>강의 명</label>
	                   <input type="text" name="class_sub_name" class='form-control' value="${classSubjectDto.class_sub_name}" required>
	               </div>
	
	               <div class="form-group form-inline">
	                   <label>전공 선택</label>
	                   <select name="class_sub_type" class='form-control'>
					        <option ${classSubjectDto.class_sub_type == '전공' ? 'selected':''}>전공</option>
					        <option ${classSubjectDto.class_sub_type == '교필' ? 'selected':''}>교필</option>
					        <option ${classSubjectDto.class_sub_type == '교양' ? 'selected':''}>교양</option>
	                   </select>
	                   <label>학점</label>
	                   <select name="class_sub_point" class="form-control">
	                       <option ${classSubjectDto.class_sub_point == '1' ? 'selected':''}>1</option>		
				           <option ${classSubjectDto.class_sub_point == '2' ? 'selected':''}>2</option>		
				           <option ${classSubjectDto.class_sub_point == '3' ? 'selected':''}>3</option>				
                   	   </select>
                   	    <label>학생 정원
	                   <input type="number" name="class_sub_person" class="form-control" min='5' max='30' value="${classSubjectDto.class_sub_person}" required>
	                   명</label>
	               </div>
	               
					<hr>
					
                   <div class="form-group form-inline">
                   
                   		<input type="text" name="this_year" value="${year}" class="form-control" readonly>
                        <label>년도</label>
                        <select name="semester_type" id="semester_type" class="form-control">
					    	<option ${classSubjectDto.semester_type == '1학기' ? 'selected':''}>1학기</option>
					      	<option ${classSubjectDto.semester_type == '2학기' ? 'selected':''}>2학기</option>		
                        </select>
	                    <select name="class_sub_week" id="class_sub_week" class="form-control">
							<option value='월' ${classSubjectDto.class_sub_week == '월' ? 'selected':''}>월요일</option>
					        <option value='화' ${classSubjectDto.class_sub_week == '화' ? 'selected':''}>화요일</option>
					        <option value='수' ${classSubjectDto.class_sub_week == '수' ? 'selected':''}>수요일</option>
					        <option value='목' ${classSubjectDto.class_sub_week == '목' ? 'selected':''}>목요일</option>
					        <option value='금' ${classSubjectDto.class_sub_week == '금' ? 'selected':''}>금요일</option>
	                    </select>
	                   	<select name="class_sub_time" id="class_sub_time" class="form-control">
					        <option value='1' ${classSubjectDto.class_sub_time == '1' ? 'selected':''}>1교시</option>		
					        <option value='2' ${classSubjectDto.class_sub_time == '2' ? 'selected':''}>2교시</option>		
					        <option value='3' ${classSubjectDto.class_sub_time == '3' ? 'selected':''}>3교시</option>		
					        <option value='4' ${classSubjectDto.class_sub_time == '4' ? 'selected':''}>4교시</option>		
					        <option value='5' ${classSubjectDto.class_sub_time == '5' ? 'selected':''}>5교시</option>		
					        <option value='6' ${classSubjectDto.class_sub_time == '6' ? 'selected':''}>6교시</option>		
					        <option value='7' ${classSubjectDto.class_sub_time == '7' ? 'selected':''}>6교시</option>		
					        <option value='8' ${classSubjectDto.class_sub_time == '8' ? 'selected':''}>6교시</option>					
	                   </select>
	               </div>
	               
	               <div class="form-group form-inline">
	                   <label>강의실</label>
	                   <br>
	                   <input type="text" name="class_sub_room"  class="form-control" value="${classSubjectDto.class_sub_room}" required>
	                   <button type="button" id="check-btn" class="btn btn-secondary btn-sm">강의실 확인</button>
	               </div>
	               
	               <span id='lecture_check'></span>
	               
	               <hr>
	               
	               <div class="form-group form-inline">
	                   <label>수업일
	                    <fmt:parseDate value="${classSubjectDto.class_sub_start}" var="start" pattern="yyyy-MM-dd HH:mm:ss" />
	                   <input type="date" name="class_sub_start" id="class_sub_start" class="form-control" value="<fmt:formatDate value="${start}" pattern="yyyy-MM-dd" />" required>
					    ~
					    <fmt:parseDate value="${classSubjectDto.class_sub_end}" var="end" pattern="yyyy-MM-dd HH:mm:ss" />
					   <input type="date" name="class_sub_end" id="class_sub_end" class="form-control" value="<fmt:formatDate value="${end}" pattern="yyyy-MM-dd" />" required>
	                   </label>
	               </div>
	               
	               <div class="form-group">
	                   <label>강의 설명</label>
	                   <textarea rows="5" cols="50" name="class_sub_content" class="form-control" required>${classSubjectDto.class_sub_content}</textarea>
	               </div>
	               
	               <div class="form-group">
	                   <label>강의 첨부파일</label>
	                   <br>
	                   <input type="file" name="file" accept=".pdf, .hwp">
	               </div>
	               <input type="hidden" name="class_sub_no" value="${classSubjectDto.class_sub_no}">
	               <div class="row-empty"></div>
	               <div class="form-group form-inline">
		               <button type="submit" class="btn btn-primary modify-btn">수정</button>
		               <button type="button" class="btn btn-danger cancel-btn">취소</button>
	               </div>
	            </form>
	        </div>
	    </div>
	
	</div>


	<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>  