<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
        	.row-empty{
        		height: 20px;
        	}
        	 
        	.center{
        		text-align: center;
        	}
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </head>
    <script>
    function button_event(){
      
        	var result = confirm("정말 삭제하시겠습니까??");
            if (!result){ 
//                 document.form.submit();
            	return false;
            }
            else{
            	document.form.submit();
            	}
            }
    </script>
<!--     <header> -->
  <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!--     </header> -->
    
<body>
	<div class="row-empty"></div>
    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <div class="container-fluid">
        <div class="row">
            <div class="offset-4 col-md-4">
            <form class="form" action="major_add" method="post">
                <h1 class="center">학과등록</h1>
                    <div class="form-group">
                        <label>학과이름</label>
                        <input name="major_type" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>학과고유번호</label>
                        <input name="major_number" type="text" class="form-control" required>
                    </div>
                    <div>
                        <input type="submit" class="form-control btn btn-primary" style="background-color: #063e7a;" value="등록">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <hr>
      <div class="container-fluid">
        <div class="row">
            <div class="offset-2 col-md-8">
            		<div class="row-empty"></div>
    				<div class="row-empty"></div>
    				<div class="row-empty"></div>
                    <table class="table table-sm table-hover">
                    <h1 class="center">등록된 학과 리스트</h1>
                    <div class="row-empty"></div>
                    <thead class="thead" style="background-color: #063e7a; color:white;">
                        <tr class="center">
                            <th>학과이름</th>                            
                            <th>학과고유번호</th>
                            <th>학과등록일</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
	                    <c:forEach var="majorDto" items="${major_list}"> 
	                        <tr class="center">
	                    	<form action="major_delete" method="post">                  
	                            <td>${majorDto.major_type}</td>
	                            <td>${majorDto.major_number}</td>
	                            <td>${majorDto.major_date}</td>
	                            <input type="hidden" name="major_no" value="${majorDto.major_no}">
	                            <td><input class="btn btn-primary" type="submit" value="삭제" style="background-color: #063e7a;" onclick="return button_event()"></td>
	                        </form>
	                        </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>