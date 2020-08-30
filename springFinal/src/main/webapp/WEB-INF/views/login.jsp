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
        
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <script>

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
                        <div class="row-empty"></div>
                        <div class="row-empty"></div>
                    <div class="row-empty login-input">
                        <input type="text" class="id" placeholder="학번/교직원번호">
                    </div> 
                    <div class="row-empty"></div> 
                    <div class="row-empty login-input">
                        <input type="text" class="pw" placeholder="비밀번호">
                    </div> 
                    <div class="row-empty"></div>
                    <div class="row-empty">
                        <ul class="check">
                            <li>
                                <input type="checkbox" id="saveId">
                                    <label for="saveId">
                                        <strong>학번/교직원번호 저장</strong>
                                    </label>
                                    <a class="pw_id_findare" style="right: 140px;">비밀번호 초기화</a>
                                    <a class="pw_id_findare">학번/교직원번호 조회</a>
                            </li>
                        </ul>
                    </div> 
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div> 
                    <div>
                        <input type="submit" value="로그인" class="login-btn">
                    </div>
                    </div>
                </div>
            </div>       
        </div>     
    </div>
</body>

</html>