<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	function waitting() {		
		var socket;
		
			var uri = "ws://localhost:8080/springFinal/group";
			socket = new WebSocket(uri)
			
//	 		연결이 되었는지 안되었는지 확인할 수 있도록 예약 작업(콜백)을 설정
			socket.onopen = function(){
				console.log("연결되었씁닏강");
				
			};
			
			socket.onmessage = function(e){
				console.log(e.data);
				var wait_person = document.querySelector(".wait_person");
				wait_person.value = e.data;
				console.log(wait_person.value);
				
				if(e.data==("apply")){
					location.href ='${pageContext.request.contextPath}/student/student_class_apply';
				}
		}
			socket.onclose = function(){
				console.log("연결이 종료되엇씁ㄴㄷ기ㅏㅇ");
			};
	}
</script>
<body onload="waitting();">
<br><br>
<div style="text-align: center;">
<h1>수강신청대기</h1>
<br><br>
</div>
<div style="text-align: center;">
<span>
현재 접속자가 많아 대기중 입니다.....<br><br>

현재 총 접속자수 2명.....<br><br>

다른 접속자가 나가길 기다려주세요.....<br><br>

아님 나가시든가.....<br><br>

ㅋㅋㅋㅋㅋㅋㅋㅋㅋ.....<br><br>

더 안늘려 줄꺼지롱~ ㅎㅎㅎㅎ.....<br><br>

ㅋㅋㅋㅋㅋㅋㅋㅋㅋ.....<br><br>
</span>
현재 대기인원수<input type="text" readonly class="wait_person" style="text-align: right;">명
</div>


</body>
 