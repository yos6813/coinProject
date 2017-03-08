<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="/resources/css/plugins/daterangepicker/daterangepicker-bs3.css" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/css/style.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<!-- <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" /> -->
<body class="gray-bg">
<div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <h3>Register</h3>
            <form method="post" action="/signUp" class="m-t">
                <p><img id="userImg" src="" /></p>
				<input type="text" class="form-control" id="photoURL" name="photoURL" readonly="readonly">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="name" name="username" readonly="readonly">
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="email"name="email" readonly="readonly">
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="닉네임(한글로입력)" name="nickname" id="nickname">
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="slackID" name="slackID" id="slackId">
				</div>
				<div class="form-group has-feedback date">
                  <input type="text" class="form-control" placeholder="입사일" name="joinDate" id="joinDate">
                </div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="addr" name="address" placeholder="주소"  readonly required>
					<input type="text" class="form-control" id="addr2" name="address2" placeholder="상세주소" required>
				</div>
					<div class="form-group has-feedback">
						<button id="addrbtn" onclick="sample6_execDaumPostcode()" class="btn btn-default">주소검색</button>
					</div>
				<hr>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="내선번호" name="extension" id="extension">
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="업무전화번호" name="workPhone" id="workPhone">
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="휴대번호" name="phone" id="phone">
				</div>
				<div class="row">
					<div class="col-xs-8"></div>
					<div class="col-xs-4">
						<button type="submit" id="register" class="btn btn-primary btn-block">가입</button>
					</div>
				</div>
            </form>
        </div>
    </div>
<!-- script -->
<script src="https://www.gstatic.com/firebasejs/3.6.8/firebase.js"></script>
<script src="/resources/js/jquery-2.1.1.js"></script>
<script src="/resources/js/main.js"></script>
<!-- bootstrap datepicker -->
<script src="/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<!-- daum 주소찾기 -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<!-- InputMask -->
<script src="/resources/js/plugins/input-mask/jquery.inputmask.js"></script>
<script src="/resources/js/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="/resources/js/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script>
$('#joinDate').datepicker({
    autoclose: true
});

firebase.auth().onAuthStateChanged(function(user){
	if(user){
		var userId = user.uid;
		var name = user.displayName;
		var email = user.email;
		var imageUrl = user.photoURL;
		writeUserInfo(userId, name, email, imageUrl);
		console.log("test");
	}
})
</script>
</body>
</html>