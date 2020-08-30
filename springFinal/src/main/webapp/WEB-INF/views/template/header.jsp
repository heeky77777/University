<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
    <script>
    // 목표 : .sidebar에 .active를 추가하거나 제거한다
    // - 추가하거나 제거한다 = 토글한다 = toggle 명령을 사용
         function toggleSidebar() {
            var sidebar = document.querySelector(".sidebar");
            sidebar.classList.toggle("active"); // 클래스 리스트이므로 .을 안찍어도 됨
        }
    </script>
<body>
    <aside class="sidebar">
        <ul class="list-group" style="width:100%">
            <li class="up_background" style="height: 50px; width: 250px;">
                <img src="${pageContext.request.contextPath}/resources/img/joo.jpg" width="250px" height="50px">
            </li>
            <li style="height: 70px; width: 150px;">kh대하교</li>
            <li class="list-item">첫번쮀</li>
            <li class="list-item">두번쮀</li>
            <li class="list-item">세번쮀</li>
        </ul>
    </aside>
    <header class="container2">
        <div class="up_background">
            <button class="btn_slide" onclick="toggleSidebar()">&#8801;</button>
         
        </div>
    </header>
</body>
</html>