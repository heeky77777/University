<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>alert 예제</title>
    <script>
        alert("경고!!")
    </script>
</head>
<body>
</body>


<body>
	<div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1>제제제멕ㅁ곰ㄱ</h1>

                <button class="btn btn-primary" 
                        data-toggle="modal" data-target="#test-modal">눌러라!</button>
            </div>
        </div>
    </div>

    <!-- 모달 창은 아무데나 생성해도 됨(어짜피 화면을 덮을 예정이므로) -->
    <div class="modal" id="test-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">알림창</h4>
                </div>
                <div class="modal-body">
                            
                </div>
                <div class="modal-footer">
                    <!-- 닫기 버튼 : data-dismiss라는 옵션을 modal로 설정하면 된다 -->
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>