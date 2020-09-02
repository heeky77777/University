<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
   <h1> 회 원 가 입 </h1>

    <form action="student_join" method="post">
       학생이름 : <input type="text" name="student_name"><br>
       학번 : <input type="text" name="student_numb"><br>
       학생비밀번호 : <input type="password" name="student_pw"><br>
       학년 : <select name="student_grade">
             <option value="1">1학년</option>
             <option value="2">2학년</option>
             <option value="3">3학년</option>
             <option value="4">4학년</option>
          </select><br>       
       학과 : <select name="major_no">
             <option>경영학과</option>
             <option>어문학과</option>
             <option>성악과</option>
             <option>시스템공학과</option>
          </select>
       학기 : <select name="semester_no">
             <option>1학기</option>
             <option>2학기</option>
          </select>
       학적상태 : <select name="student_state">
                <option>재학</option>
                <option>휴학</option>
                <option>복학</option>
             </select>   
       성별 : <select name="student_gender">
             <option>남자</option>
             <option>여자</option>
          </select>
       생일 : <input type="date" name="student_birth"><br>
       연락처 : <input type="text" name="student_phone"><br>
       이메일 주소 : <input type="text" name="student_email"><br>
       주소(우편번호) <input type="text" name="student_post">
       <input type="button" value="우편번호찾기"><br>
       주소(기본주소) <input type="text" name="student_addr"><br>
       주소(상세주소) <input type="text" name="student_extra_addr"><br>
       병역여부 : <select name="student_milliy">
                <option>미필</option>
                <option>군필</option>
             </select>
       <input type="submit" value="회원가입">
    </form>
    