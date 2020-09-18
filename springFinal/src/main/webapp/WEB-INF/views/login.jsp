<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Univercsity</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <script>
    
    ///////////////////////////////////////////////////학생///////////////////////////////////////////////////////////////////////////////
		function find_pw(){
			
			var student_name = document.querySelector("#student_name_pw").value;
			var student_numb = document.querySelector("#student_numb_pw").value;
			var student_birth = document.querySelector("#student_birth_pw").value;
			var result_pw = document.querySelector("#result_pw");
			
			axios({
				url:"${pageContext.request.contextPath}/student/find_pw?student_name="+student_name+"&student_numb="+student_numb+"&student_birth="+student_birth,
				method:"get"
			}).then(function (response){
				
				result_pw.value = response.data.student_pw;
				
				if(response.data.student_pw == undefined){
					result_pw.value = "";
					alert("찾으시는 정보가 없습니다. 입력하신 정보를 확인하여 주세요");
				}
			})
			
		}
		
		function find_id(){
			
			var student_name = document.querySelector("#student_name_id").value;
			var student_birth = document.querySelector("#student_birth_id").value;
			var result_id = document.querySelector("#result_id");
			
			axios({
				url:"${pageContext.request.contextPath}/student/find_id?student_name="+student_name+"&student_birth="+student_birth,
				method:"get"
			}).then(function (response){
				
				result_id.value = response.data.student_numb;
			})
		}
		
		function find_pw_origin_pw(){
			var student_name = document.querySelector("#student_name_pw")
			var student_numb = document.querySelector("#student_numb_pw")
			var student_birth = document.querySelector("#student_birth_pw")
			var result_pw = document.querySelector("#result_pw")
			
			student_name.value = "";
			student_numb.value = "";
			student_birth.value = "";
			result_pw.value = "";
		}
		
		function find_pw_origin_id(){
			var student_name = document.querySelector("#student_name_id")
			var student_birth = document.querySelector("#student_birth_id")
			var result_id = document.querySelector("#result_id");
			
			student_name.value = "";	
			student_birth.value = "";
			result_id.value = "";
		}
///////////////////////////////////////////////////교수///////////////////////////////////////////////////////////////////////////////

		function pro_find_pw(){
			
			var professor_name = document.querySelector("#profe_name_pw").value;
			var professor_id = document.querySelector("#profe_id_pw").value;
			var professor_birth = document.querySelector("#profe_birth_pw").value;
			var pro_result_pw = document.querySelector("#pro_result_pw");
			
			axios({
				url:"${pageContext.request.contextPath}/professor/pro_find_pw?profe_name="+profe_name+"&profe_id="+profe_id+"&profe_birth="+profe_birth,
				method:"get"
			}).then(function (response){
				
				pro_result_pw.value = response.data.profe_pw;
			})
		}
		
		function pro_find_id(){
			
			var professor_name = document.querySelector("#profe_name_id").value;
			var professor_birth = document.querySelector("#profe_birth_id").value;
			var pro_result_id = document.querySelector("#pro_result_id");
			
			axios({
				url:"${pageContext.request.contextPath}/professor/pro_find_id?profe_name="+profe_name+"&profe_birth="+profe_birth,
				method:"get"
			}).then(function (response){
				
				pro_result_id.value = response.data.profe_id;
			})
		}
		
		function pro_find_pw_origin_pw(){
			var professor_name = document.querySelector("#profe_name_pw")
			var professor_numb = document.querySelector("#profe_numb_pw")
			var professor_birth = document.querySelector("#profe_birth_pw")
			var pro_result_pw = document.querySelector("#pro_result_pw")
			
			professor_name.value = "";
			professor_numb.value = "";
			professor_birth.value = "";
			pro_result_pw.value = "";
		}
		
		function pro_find_pw_origin_id(){
			var professor_name = document.querySelector("#pro_name_id")
			var professor_birth = document.querySelector("#pro_birth_id")
			var pro_result_id = document.querySelector("#pro_result_id");
			
			professor_name.value = "";	
			professor_birth.value = "";
			pro_result_id.value = "";
		}
		
///////////////////////////////////////////////////학생/교수/관리자 나누기///////////////////////////////////////////////////////////////////////////////

		function toggleTab(index) {
            var list = document.querySelectorAll(".area");
            for (var i = 0; i < list.length; i++) {
                list[i].classList.remove("on");
            }
            var target = document.querySelector("#cb" + index + "-area");
            target.classList.add("on");
        }
        
        
        function toggleTabAutomation(tag) {
            var id = tag.id;
            var targetId = id + "-area";
            var list = document.querySelectorAll(".area");
            for (var i = 0; i < list.length; i++) {
                list[i].classList.remove("on");
            }
            var target = document.getElementById(targetId);
            target.classList.add("on");
        }
        
        function error_page(){
        	var url = location.search.substr(location.search.indexOf("?") + 1);
        	
        	if(url != "") {
        		history.replaceState({}, null, location.pathname);
        		alert("로그인정보를 확인하여 주세요");
        	}
     
        }
        window.onload=error_page;
        
        function only_number(){
        	var student_numb = document.querySelector("input[name=student_numb]").value;
        	
        	var regex = /^[0-9]{7,15}$/gi;
            var idRegx = regex.test(student_numb);
            
            
			if(idRegx == false){
				alert("아이디는 학번(숫자)로 입력해주세요");
			}
        }
    </script>
<body>
    <div class="container-fluid">
    	
        <div class="bg_login">
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row">
                <div class="offset-4 col-4"><h1 class="center">KH대학교</h1></div>
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div> 
            <div align="center">
                <div class="login-box">
                    <div class="login-left">
                        <img class="left_img" src="${pageContext.request.contextPath}/resources/img/joo.jpg" width="400px" height="398px">
                    </div>
                    <div class="login-right">
                        <div class="row-empty" align="left">
                            <h2 class="title">LOGIN</h2>
                            
                        </div> 
                        <div class="row-empty">
                        	<div style="margin:40px; text-align: right">
			                    <label for="cb1"><input type="radio" id="cb1" name="check_user" onchange="toggleTabAutomation(this);" value="학생" checked>
			                        <span style="color:white">학생</span>
			                    </label>&nbsp;&nbsp;&nbsp;
			                    <label for="cb2"><input type="radio" id="cb2" name="check_user" onchange="toggleTabAutomation(this);" value="교수">
			                        <span style="color:white">교수</span>
			                    </label>&nbsp;&nbsp;&nbsp;
			                    <label for="cb3"><input type="radio" id="cb3"  name="check_user" onchange="toggleTabAutomation(this);" value="관리자">
			                        <span style="color:white">관리자</span>
			                    </label>
			                </div>
                        </div>
                        <div class="row-empty"></div>
              <!---------------------------------------------- 학생 ---------------------------------------------------------->
                    <div class="area on" id="cb1-area">
              		<form action="student_login" method="post">
	                    <div class="row-empty login-input">
	                        <input name="student_numb" type="text" class="id" placeholder="학번" required onblur="only_number();">
	                    </div> 
	                    <div class="row-empty"></div> 
	                    <div class="row-empty login-input">
	                        <input name="student_pw" type="password" class="pw" placeholder="비밀번호" required>
	                    </div> 
	                   
	                    <div class="row-empty">
	                        <ul class="check">
	                            <li>
	                                <input type="checkbox" id="saveId">
	                                    <label for="saveId">
	                                        <strong>학번번호 저장</strong>
	                                    </label>
	                                  
	                                    
	                                    
	                                    <a href="#find-pw" class="pw_id_findare" style="right: 100px;" data-toggle="modal" data-backdrop="static">학생비밀번호 찾기</a>
	                                    <a href="#find-id" class="pw_id_findare" data-toggle="modal" data-backdrop="static">학번 조회</a>
	                            </li>
	                        </ul>
	                    </div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div> 
                    <div>
                        <input type="submit" value="로그인" class="login-btn">
                    </div>
                    </form>
                    </div> 
              <!---------------------------------------------- 교수 ---------------------------------------------------------->
                    <div class="area" id="cb2-area">
              		<form action="profe_login" method="post">
	                    <div class="row-empty login-input">
	                        <input name="profe_id" type="text" class="id" placeholder="교수아이디" required>
	                    </div> 
	                    <div class="row-empty"></div> 
	                    <div class="row-empty login-input">
	                        <input name="profe_pw" type="password" class="pw" placeholder="비밀번호" required>
	                    </div> 
	                   
	                    <div class="row-empty">
	                        <ul class="check">
	                            <li>
	                                <input type="checkbox" id="saveId">
	                                    <label for="saveId">
	                                        <strong>교수번호 저장</strong>
	                                    </label>
	                                    <a href="#pro_find-pw" class="pw_id_findare" style="right: 100px;" data-toggle="modal" data-backdrop="static">교수비밀번호 찾기</a>
	                                    <a href="#pro_find-id" class="pw_id_findare" data-toggle="modal" data-backdrop="static">교수번호 조회</a>
	                            </li>
	                        </ul>
	                    </div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div> 
                    <div>
                        <input type="submit" value="로그인" class="login-btn">
                    </div>
                    </form>
                    </div> 
              
              <!---------------------------------------------- 관리자 ---------------------------------------------------------->
                    <div class="area" id="cb3-area">
              		<form action="admin_login" method="post">
	                    <div class="row-empty login-input">
	                        <input name="admin_id" type="text" class="id" placeholder="관리자아이디" required>
	                    </div> 
	                    <div class="row-empty"></div> 
	                    <div class="row-empty login-input">
	                        <input name="admin_pw" type="password" class="pw" placeholder="비밀번호" required>
	                    </div> 
	                   
	                    <div class="row-empty">
	                    </div>
	                    <div class="row-empty"></div>
	                    <div class="row-empty"></div> 
	                    <div>
	                        <input type="submit" value="로그인" class="login-btn">
	                    </div>
	                    </form>
                    </div> 
                    
                    </div>
                </div>
            </div>       
        </div>
        
        <!---------------------------------------------- 학생 ---------------------------------------------------------->
        
        <div class="modal fade" id="find-pw" style="margin-top: 200px">
        	<div class="modal-dialog modal-lg">
        		<div class="modal-content">
        			<div class="modal-header">
        				<h4 class="modal-title">비밀번호찾기</h4>
        			</div>
        			<div class="modal-body">
        				<label>학생이름</label>
        				<input type="text" name="student_name" id="student_name_pw" required>
        				<label>학번</label>
        				<input type="text" name="student_numb" id="student_numb_pw" required>
        			</div>
        			<div class="modal-body">
        				<label>생년월일</label>
        				<input type="date" name="student_birth" id="student_birth_pw" max="9999-12-31" required>
        				<button onclick="find_pw();">찾기</button>
        			</div>
        			<div class="modal-body">
        					<label style="text-align: left">찾으신 비밀번호</label>
        					<div>
        						<input type="text" id="result_pw" readonly>
        					</div>
        			</div>
        			<div class="modal-footer">
        				<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="find_pw_origin_pw();">닫기</button>
        			</div>
        		</div>
        	</div>
        </div>
        
        <div class="modal fade" id="find-id" style="margin-top: 200px">
        	<div class="modal-dialog modal-lg">
        		<div class="modal-content">
        			<div class="modal-header">
        				<h4 class="modal-title">학번조회</h4>
        			</div>
        			<div class="modal-body">
        				<label>학생이름</label>
        				<input type="text" name="student_name" id="student_name_id" required>
        			</div>
        			<div class="modal-body">
        				<label>생년월일</label>
        				<input type="date" name="student_birth" id="student_birth_id" max="9999-12-31" required>
        				<button onclick="find_id();">찾기</button>
        			</div>
        			<div class="modal-body">
        					<label>찾으신 학번</label>
        					<div>
        						<input type="text" id="result_id" readonly>
        					</div>
        			</div>
        			<div class="modal-footer">
        				<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="find_pw_origin_id();">닫기</button>
        			</div>
        		</div>
        	</div>
        </div>          
        
        <!---------------------------------------------- 교수 ---------------------------------------------------------->
        
        <div class="modal fade" id="pro_find-pw" style="margin-top: 200px">
        	<div class="modal-dialog modal-lg">
        		<div class="modal-content">
        			<div class="modal-header">
        				<h4 class="modal-title">비밀번호찾기</h4>
        			</div>
        			<div class="modal-body">
        				<label>교수이름</label>
        				<input type="text" name="profe_name" id="profe_name_pw" required>
        				<label>교수아이디</label>
        				<input type="text" name="profe_id" id="profe_id_pw" required>
        			</div>
        			<div class="modal-body">
        				<label>생년월일</label>
        				<input type="date" name="profe_birth" id="profe_birth_pw" max="9999-12-31" required>
        				<button onclick="pro_find_pw();">찾기</button>
        			</div>
        			<div class="modal-body">
        					<label style="text-align: left">찾으신 비밀번호</label>
        					<div>
        						<input type="text" id="pro_result_pw" readonly>
        					</div>
        			</div>
        			<div class="modal-footer">
        				<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="pro_find_pw_origin_pw();">닫기</button>
        			</div>
        		</div>
        	</div>
        </div>
        
        <div class="modal fade" id="pro_find-id" style="margin-top: 200px">
        	<div class="modal-dialog modal-lg">
        		<div class="modal-content">
        			<div class="modal-header">
        				<h4 class="modal-title">교수아이디조회</h4>
        			</div>
        			<div class="modal-body">
        				<label>교수이름</label>
        				<input type="text" name="profe_name" id="profe_name_id" required>
        			</div>
        			<div class="modal-body">
        				<label>생년월일</label>
        				<input type="date" name="profe_birth" id="profe_birth_id" max="9999-12-31" required>
        				<button onclick="pro_find_id();">찾기</button>
        			</div>
        			<div class="modal-body">
        					<label>찾으신 아이디</label>
        					<div>
        						<input type="text" id="pro_result_id" readonly>
        					</div>
        			</div>
        			<div class="modal-footer">
        				<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="pro_find_pw_origin_id();">닫기</button>
        			</div>
        		</div>
        	</div>
        </div>
        
<!--     <footer> -->
  <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<!--     </footer> -->
    </div>
</body>

</html>