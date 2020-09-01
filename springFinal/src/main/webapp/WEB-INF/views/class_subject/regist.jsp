<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>

	$(function() {
    	$('#check-btn').click(function(){
        
	        $.ajax({
	            url:"${pageContext.request.contextPath}/lecture/lecture_regist?semester_no=" + $('#semester_no').val() + "&lecture_time=" + $('#lecture_time').val() + "&lecture_day=" + $('#lecture_day').val() + "&start_time=" + $('input[name=start_time]').val() + "&end_time=" + $('input[name=end_time]').val() + "&lecture_room=" + $('input[name=lecture_room]').val(),
	            type:"get",
	            success:function(response) {
	                if(!response){	// 결과 없음 : 사용 가능
	                    $('#lecture_check').removeClass('fail').addClass('pass').text('강의 등록 가능');
	                    return true;
	                }
	                else {	// 결과 있음 : 사용 불가능
	                    $('#lecture_check').removeClass('pass').addClass('fail').text('요일, 교시, 강의실을 다시 확인해 주세요');
	                    return false;				
	                }
	            }
	        })
	
	    })
	
	
	})

/* 	function regist() {
		
		var semester_no = document.querySelector('#semester_no').value;
		var lecture_time = document.querySelector('#lecture_time').value;
		var lecture_day = document.querySelector('#lecture_day').value;
		var start_time = document.querySelector('input[name=start_time]').value;
		var end_time = document.querySelector('input[name=end_time]').value;
		var lecture_room = document.querySelector('input[name=lecture_room]').value;
		
		var lecture_check = document.querySelector('#lecture_check');
		
		
		axios({
			url:"${pageContext.request.contextPath}/lecture/lecture_regist?semester_no=" + semester_no + "&lecture_time=" + lecture_time + "&lecture_day=" + lecture_day + "&start_time=" + start_time + "&end_time=" + end_time + "&lecture_room=" + lecture_room,
			method:"get"
		})
		.then(
				function(response){
					// 성공 시 실행할 코드
					console.log(response.data);
					if(!response.data){	// 결과 없음 : 사용 가능
						lecture_check.textContent = "강의 등록 가능";
						return true;
					}
					else {	// 결과 있음 : 사용 불가능
						lecture_check.textContent = "요일, 교시, 강의실을 다시 확인해 주세요";
						return false;				
					}
				}
		)
		

	} */


</script>

<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>


<style>
	.row-empty {
		height: 20px;
	}
    
    .regist-btn {
        background-color: #063E7A;
        border-color: #063E7A;
            
    }
    
    .regist-btn:hover {
    	background-color: #2066b0;
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
	
</style>


<title>KH 대학교 : 강의 등록</title>


	<div class="container-fluid">
	
		 <div class="row-empty"></div>
	    <div class="row-empty"></div>
	   
		<div>
	       <h2 class="text-center">강의 등록</h2>
	   </div>
	
	   <div class="row">
	       <div class="offset-md-3 col-md-6">
	           <form action="regist" class="form" method="post" enctype="multiipart/form-data">
	               <div class="form-group">
	                   <label>강의 명</label>
	                   <input type="text" name="class_sub_name" class='form-control'>
	               </div>
	
	               <div class="form-group">
	                   <label>전공 선택</label>
	                   <select name="class_sub_type" class='form-control'>
	                       <option>전공</option>
	                       <option>교필</option>
	                       <option>교양</option>
	                   </select>
	               </div>
	
	               <div class="form-group">
	                   <label>학생 정원</label>
	                   <input type="number" name="class_sub_person" class="form-control" min='10' max='30' value='0'>
	               </div>
	               <div class="form-group">
	                   <label>개강일</label>
	                   <input type="date" name="class_sub_start" class="form-control">
	               </div>
	               <div class="form-group">
	                   <label>종강일</label>
	                   <input type="date" name="class_sub_end" class="form-control">
	               </div>
	               <div class="form-group">
	                   <label>학점</label>
	                   <input type="number" name="class_sub_point" class="form-control" min='1' max='3' value='0'>
	               </div>
	               <div class="form-group form-inline">
	                   <label>강의 시간</label>
	                   <br>
	                   <select name="lecture_day" id="class_sub_week" class="form-control">
	                       <option>월</option>
	                       <option>화</option>
	                       <option>수</option>
	                       <option>목</option>
	                       <option>금</option>
	                   </select>
	                   <br>
	                   <select name="lecture_time" id="class_sub_time" class="form-control">
	                       <option>1</option>		
	                       <option>2</option>		
	                       <option>3</option>		
	                       <option>4</option>		
	                       <option>5</option>		
	                       <option>6</option>		
	                   </select> 교시
	               </div>
	               <div class="form-group form-inline">
	                   <label>강의실</label>
	                   <br>
	                   <input type="text" name="class_sub_room"  class="form-control">
	                   <button type="button" class="btn btn-secondary btn-sm" onclick="return regist();">강의실 확인</button>
	               </div>
	               <span id='lecture_check'></span>
	               <div class="form-group">
	                   <label>강의 설명</label>
	                   <textarea rows="5" cols="50" name="class_sub_content" class="form-control"></textarea>
	               </div>
	               <div class="form-group">
	                   <label>강의 첨부파일</label>
	                   <br>
	                   <input type="file" name="file" accept=".pdf, .hwp">
	               </div>
	               <input type="hidden" name="start_time" value="${year_a}">
	             <input type="hidden" name="end_time" value="${year_a+1}">
	
	                <button type="submit" class="btn btn-primary btn-block regist-btn">강의 등록</button>
	
	            </form>
	        </div>
	    </div>
	
	</div>



<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>  