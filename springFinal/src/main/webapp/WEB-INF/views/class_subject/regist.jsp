<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <!-- moment js : datepicker를 사용하기 위한 필수 의존성 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>
    
    <!-- date-range-picker -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/lightpick.css">
    <script src="${pageContext.request.contextPath}/resources/js/lightpick.js"></script>
    
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
               
                var options = {
                        //대상 지정
                        field: document.querySelector(".picker-start"),
                        //두 번째 대상 지정
                        secondField: document.querySelector(".picker-end"),
                        //날짜 표시 형식 지정
                        format: 'YYYY-MM-DD',
                        
                        //한 화면에 표시될 달의 개수
                        numberOfMonths: 2,
                        
                        //시작일 지정
                        //minDate:new Date(),//- 오늘부터 선택 가능
                        minDate: start_time,
                        
                        maxDate: finish_time,
                        
                        //문서에 포함시켜 표시
                        //inline:true,

                        //시작요일(1:월 ~ 7:일)
                        firstDay: 7,
                        
                        //자동으로 닫히지 않도록 설정
                        //autoclose: false,
                        
                        //선택 방향 제어
                        selectForward: true,
                        selectBackword: false,
                        
                        //주말 제외
                        disableWeekends:true,
                       
                        //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
                        onSelect:function(start, end){
                            if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
                            var days = end.diff(start, 'days') + 1;
                            console.log(days);
                        }
                    };
                    var picker = new Lightpick(options);
                
                
            }
        })
		
		$('#semester_type').change(function(){
	        $.ajax({
	            url:"${pageContext.request.contextPath}/classSubject/semesterDate?this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val(),
	            method:"get",
	            success:function(response){
	                var start_time = response.semester_start.substring(0, 10);
	                var finish_time = response.semester_finish.substring(0, 10);
	                
	                var options = {
	                        //대상 지정
	                        field: document.querySelector(".picker-start"),
	                        //두 번째 대상 지정
	                        secondField: document.querySelector(".picker-end"),
	                        //날짜 표시 형식 지정
	                        format: 'YYYY-MM-DD',
	                        
	                        //한 화면에 표시될 달의 개수
	                        numberOfMonths: 2,
	                        
	                        //시작일 지정
	                        //minDate:new Date(),//- 오늘부터 선택 가능
	                        minDate: start_time,
	                        
	                        maxDate: finish_time,
	                        
	                        //문서에 포함시켜 표시
	                        //inline:true,

	                        //시작요일(1:월 ~ 7:일)
	                        firstDay: 7,
	                        
	                        //자동으로 닫히지 않도록 설정
	                        //autoclose: false,
	                        
	                        //선택 방향 제어
	                        selectForward: true,
	                        selectBackword: false,
	                        
	                        //주말 제외
	                        disableWeekends:true,
	                       
	                        //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
	                        onSelect:function(start, end){
	                            if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
	                            var days = end.diff(start, 'days') + 1;
	                            console.log(days);
	                        }
	                    };
	                    var picker = new Lightpick(options);
	            }
	        })
	        
	        
			
		})
		
		
		
		/* 강의실 중복 조회 */
    	$('#check-btn').click(function(){
			var class_sub_room = $('input[name=class_sub_room]').val();
    		
    		if(!class_sub_room){
    			$('#lecture_check').removeClass('pass').addClass('fail').text('학기, 요일, 교시, 강의실을 다시 확인해 주세요');
    			$('#check-btn').off('click');
    			return;
    		}
        
	        $.ajax({
	        	url:"${pageContext.request.contextPath}/classSubject/roomCheck?this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val() + "&class_sub_week=" + $('#class_sub_week').val() + "&class_sub_time1=" + $('#class_sub_time1').val() + "&class_sub_time2=" + $('#class_sub_time2').val() + "&class_sub_time3=" + $('#class_sub_time3').val() + "&class_sub_time4=" + $('#class_sub_time4').val() + "&class_sub_room=" + class_sub_room,
	            type:"get",
	            success:function(response) {
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
	    	var profe_no = ${profeinfo.profe_no};
	    	$(window).off('beforeunload');
	    	var registCheck = confirm('강의를 등록 하시겠습니까?');
	    	if(!registCheck) {
	    		return false;
	    	}
	    	else {
	    		$.ajax({
	    			url:"${pageContext.request.contextPath}/classSubject/getCheckSubTime?profe_no=" + profe_no + "&this_year=" + $('input[name=this_year]').val() + "&semester_type=" + $('#semester_type').val() + "&class_sub_week=" + $('#class_sub_week').val() + "&class_sub_time1=" + $('#class_sub_time1').val() + "&class_sub_time2=" + $('#class_sub_time2').val() + "&class_sub_time3=" + $('#class_sub_time3').val() + "&class_sub_time4=" + $('#class_sub_time4').val(),
	    			type:"get",
	    			success:function(response){
						if(!response){
							return true;
						}			    
						else {
							alert("강의 시간을 확인해 주세요");
							return false;
						}
	    			}
	    		})	    		
	    	}
	    })
	    
	   
	    
	    /* 취소 버튼 */
	    $('.cancel-btn').click(function() {
	    	var cancelCheck = confirm("등록을 취소하시겠습니까?");
	    	if(!cancelCheck) {
	    		return false;
	    	}
	    	else{
	    		$(window).off('beforeunload');
				location.href='${pageContext.request.contextPath}/class_subject/list';
	    	}
	    	
	    })
	    
	    /* 교수 학과 조회 */
 	   	var profe_name = $('input[name=profe_name]').val();
	   	var profe_no = ${profeinfo.profe_no};
	   	$.ajax({
    		url:"${pageContext.request.contextPath}/classSubject/profeCheck?profe_name=" + profe_name + "&profe_no=" + profe_no,
    		type:"get",
    		success:function(response){
    			console.log(response)
    			$('input[name=major_type]').val(response.major_type);
    		}
    		
    	})
	    
	    
	    /* 강의 교시 추가 */
	    /* var maxAdd = 1;
            var classType = '<option value="1">1교시</option><option value="2">2교시</option><option value="3">3교시</option><option value="4">4교시</option><option value="5">5교시</option><option value="6">6교시</option><option value="7">7교시</option>';
            $('#addTime').click(function(){
                if(maxAdd > 3) return;
                var divTag = $('<div>').addClass('form-group form-inline addSelect');
                $('<select>').addClass('form-control subtime').appendTo(divTag).append(classType);
                $('<button>').attr('type', 'button').addClass('btn btn-secondary btn-sm').text('삭제').addClass('del').click(function() {
                																																			$(this).parent().remove();
                																																			maxAdd--;
               																																			 	console.log('del = ' + maxAdd);
                																																			})
                                    .appendTo(divTag);
                $(divTag).insertBefore('#roomName');
                maxAdd++;
                console.log('add = ' + maxAdd);
            }) */
            
	})
	
	
	/* 강의 시간 */
	$(function() {
		
		/* 첫번째 추가 */
        $('#addTime1').click(function() {
            $('.addSelect1').show();
            $('#addTime1').hide();
        })
		
		/* 첫번째 삭제 */
		$('.del-btn1').click(function() {
            $('.addSelect1').hide();
            $('#addTime1').show();
            $('.addSelect1 option:eq(0)').prop('selected', true);
        })
        
        /* 두번째 추가 */
        $('#addTime2').click(function() {
            $('.addSelect2').show();
            $('#addTime2').hide();
            $('.del-btn1').hide();
        })
        
        /* 두번째 삭제 */
        $('.del-btn2').click(function() {
            $('.addSelect2').hide();
            $('#addTime2').show();
            $('.del-btn1').show();
            $('.addSelect2 option:eq(0)').prop('selected', true);
        })
        
        /* 세번째 추가 */
        $('#addTime3').click(function() {
            $('.addSelect3').show();
            $('#addTime3').hide();
            $('.del-btn2').hide();
        })
        
        /* 세번째 삭제 */
        $('.del-btn3').click(function() {
            $('.addSelect3').hide();
            $('#addTime3').show();
            $('.del-btn2').show();
            $('.addSelect3 option:eq(0)').prop('selected', true);
        })

	})


</script>


<style>
	.row-empty {
		height: 20px;
	}
    
    .regist-btn,
    .add-btn,
    #check-btn,
    #major-btn {
        background-color: #063E7A;
        border-color: #063E7A;
            
    }
    
    .regist-btn:hover,
    .add-btn:hover,
    #check-btn:hover,
    #major-btn:hover {
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
    
    .regist-btn {
    	width: 30%;
        margin-left: auto;
        margin-right: 25px;
        padding: 0.7rem;
    }
    
    .cancel-btn {
    	width: 30%;
        margin-right: auto;
        margin-left: 25px;
        padding: 0.7rem;
    }
	
	.subtime {
     	margin-left: 490px;
	}
	
	.addSelect1,
    .addSelect2,
    .addSelect3 {
        display: none;
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
	           <form action="${pageContext.request.contextPath}/class_subject/regist" class="form" method="post" enctype="multipart/form-data">
	               <div class="form-group">
	                   <label>강의 명</label>
	                   <input type="text" name="class_sub_name" class='form-control' value="${param.class_sub_name}" required autocomplete="off">
	               </div>
	               <div class="form-group form-inline">
	                   <label>교수 이름</label>
	                   <input type="text" name="profe_name" class='form-control' value="${profeinfo.profe_name}" readonly>
	                   <label>학과</label>
	               	   <input type="text" name="major_type" class="form-control" readonly> 
	               	   <!-- <button type="button" id="major-btn" class="btn btn-primary btn-sm">학과 조회</button> -->
	               </div>
	
	               <div class="form-group form-inline">
	                   <label>전공 선택</label>
	                   <select name="class_sub_type" class='form-control'>
					        <option ${param.class_sub_type == '전공' ? 'selected':''}>전공</option>
					        <option ${param.class_sub_type == '교필' ? 'selected':''}>교필</option>
					        <option ${param.class_sub_type == '교양' ? 'selected':''}>교양</option>
	                   </select>
	                   <label>학점</label>
	                   <select name="class_sub_point" class="form-control">
	                       <option ${param.class_sub_point == '1' ? 'selected':''}>1</option>		
				           <option ${param.class_sub_point == '2' ? 'selected':''}>2</option>		
				           <option ${param.class_sub_point == '3' ? 'selected':''}>3</option>				
                   	   </select>
                   	    <label>학생 정원
	                   <input type="number" name="class_sub_person" class="form-control" min='5' max='30' value="${param.class_sub_person}" required>
	                   명</label>
	               </div>
	               
					<hr>
					
                   <div class="form-group form-inline">
                   
                   		<input type="text" name="this_year" value="${year}" class="form-control" readonly>
                        <label>년도</label>
                        <select name="semester_type" id="semester_type" class="form-control">
					    	<option ${param.semester_type == '1학기' ? 'selected':''}>1학기</option>
					      	<option ${param.semester_type == '2학기' ? 'selected':''}>2학기</option>		
                        </select>
	                    <select name="class_sub_week" id="class_sub_week" class="form-control">
							<option value='월' ${param.class_sub_week == '월' ? 'selected':''}>월요일</option>
					        <option value='화' ${param.class_sub_week == '화' ? 'selected':''}>화요일</option>
					        <option value='수' ${param.class_sub_week == '수' ? 'selected':''}>수요일</option>
					        <option value='목' ${param.class_sub_week == '목' ? 'selected':''}>목요일</option>
					        <option value='금' ${param.class_sub_week == '금' ? 'selected':''}>금요일</option>
	                    </select>
	                   	<select name="class_sub_time1" id="class_sub_time1" class="form-control">
	                   		<option value="0">시간선택</option>
					        <option value="1" ${param.class_sub_time1 == '1' ? 'selected':''}>1교시</option>
							<option value="2" ${param.class_sub_time1 == '2' ? 'selected':''}>2교시</option>
							<option value="3" ${param.class_sub_time1 == '3' ? 'selected':''}>3교시</option>
							<option value="4" ${param.class_sub_time1 == '4' ? 'selected':''}>4교시</option>
							<option value="5" ${param.class_sub_time1 == '5' ? 'selected':''}>5교시</option>
							<option value="6" ${param.class_sub_time1 == '6' ? 'selected':''}>6교시</option>
							<option value="7" ${param.class_sub_time1 == '7' ? 'selected':''}>7교시</option>
							<option value="8" ${param.class_sub_time1 == '8' ? 'selected':''}>8교시</option>
	                   </select>
	                   <button type="button" class="btn btn-primary btn-sm add-btn" id='addTime1'>추가</button>
	               </div>
	               
	               <div class="form-group form-inline addSelect1">
                           <select name="class_sub_time2" id="class_sub_time2" class="form-control subtime">
                                <option value="0" ${param.class_sub_time2 == '0' ? 'selected':''}>시간선택</option>
                                <option value="1" ${param.class_sub_time2 == '1' ? 'selected':''}>1교시</option>		
								<option value="2" ${param.class_sub_time2 == '2' ? 'selected':''}>2교시</option>		
								<option value="3" ${param.class_sub_time2 == '3' ? 'selected':''}>3교시</option>		
								<option value="4" ${param.class_sub_time2 == '4' ? 'selected':''}>4교시</option>		
								<option value="5" ${param.class_sub_time2 == '5' ? 'selected':''}>5교시</option>		
								<option value="6" ${param.class_sub_time2 == '6' ? 'selected':''}>6교시</option>		
								<option value="7" ${param.class_sub_time2 == '7' ? 'selected':''}>7교시</option>		
								<option value="8" ${param.class_sub_time2 == '8' ? 'selected':''}>8교시</option>		
                           </select>
                           <button type='button' class="btn btn-secondary btn-sm del-btn1">삭제</button>
                           <button type="button" class="btn btn-primary btn-sm add-btn" id='addTime2'>추가</button>
                       </div>

                       <div class="form-group form-inline addSelect2">
                        <select name="class_sub_time3" id="class_sub_time3" class="form-control subtime">
                            <option value="0" ${param.class_sub_time3 == '0' ? 'selected':''}>시간선택</option>
                           	<option value="1" ${param.class_sub_time3 == '1' ? 'selected':''}>1교시</option>
							<option value="2" ${param.class_sub_time3 == '2' ? 'selected':''}>2교시</option>
							<option value="3" ${param.class_sub_time3 == '3' ? 'selected':''}>3교시</option>
							<option value="4" ${param.class_sub_time3 == '4' ? 'selected':''}>4교시</option>
							<option value="5" ${param.class_sub_time3 == '5' ? 'selected':''}>5교시</option>
							<option value="6" ${param.class_sub_time3 == '6' ? 'selected':''}>6교시</option>
							<option value="7" ${param.class_sub_time3 == '7' ? 'selected':''}>7교시</option>
							<option value="8" ${param.class_sub_time3 == '8' ? 'selected':''}>8교시</option>
                        </select>
                        <button type='button' class="btn btn-secondary btn-sm del-btn2">삭제</button>
                        <button type="button" class="btn btn-primary btn-sm add-btn" id='addTime3'>추가</button>
                    </div>

                    <div class="form-group form-inline addSelect3">
                        <select name="class_sub_time4" id="class_sub_time4" class="form-control subtime">
                            <option value="0" ${param.class_sub_time4 == '0' ? 'selected':''}>시간선택</option>
                            <option value="1" ${param.class_sub_time4 == '1' ? 'selected':''}>1교시</option>
							<option value="2" ${param.class_sub_time4 == '2' ? 'selected':''}>2교시</option>
							<option value="3" ${param.class_sub_time4 == '3' ? 'selected':''}>3교시</option>
							<option value="4" ${param.class_sub_time4 == '4' ? 'selected':''}>4교시</option>
							<option value="5" ${param.class_sub_time4 == '5' ? 'selected':''}>5교시</option>
							<option value="6" ${param.class_sub_time4 == '6' ? 'selected':''}>6교시</option>
							<option value="7" ${param.class_sub_time4 == '7' ? 'selected':''}>7교시</option>
							<option value="8" ${param.class_sub_time4 == '8' ? 'selected':''}>8교시</option>
                        </select>
                        <button type='button' class="btn btn-secondary btn-sm del-btn3">삭제</button>
                    </div>
	               
	               <div class="form-group form-inline" id="roomName">
	                   <label>강의실</label>
	                   <br>
	                   <input type="text" name="class_sub_room"  class="form-control" value="${param.class_sub_room}" required>
	                   <button type="button" id="check-btn" class="btn btn-primary btn-sm">강의실 확인</button>
	               </div>
	               
	               <span id='lecture_check'></span>
	               
	               <hr>
	               
	               <div class="form-group form-inline">
	                   <label>수업일&nbsp;
	                   <input type="text" name="class_sub_start" id="class_sub_start" class="form-control picker-start" value="${param.class_sub_start}" required autocomplete="off">
					    ~
					   <input type="text" name="class_sub_end" id="class_sub_end" class="form-control picker-end" value="${param.class_sub_end}" required autocomplete="off">
	                   </label>
	               </div>
	               
	               <div class="form-group">
	                   <label>강의 설명</label>
	                   <textarea rows="5" cols="50" name="class_sub_content" class="form-control" required autocomplete="off">${param.class_sub_content}</textarea>
	               </div>
	               
	               <div class="form-group">
	                   <label>강의 첨부파일</label>
	                   <br>
	                   <input type="file" name="file" accept=".pdf, .hwp">
	               </div>
	               
	               <div class="row-empty"></div>
	               <div class="form-group form-inline">
		                <button type="submit" class="btn btn-primary btn-block regist-btn">등 록</button>
		                <button type="button" class="btn btn-danger cancel-btn">취 소</button>
	               </div>
	
	            </form>
	        </div>
	    </div>
	
	</div>


	<jsp:include page="${page.Context.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>  