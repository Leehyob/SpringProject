<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/login.css">
<%@include file="includes/header1.jsp"%>
</head>
<body>
	<div class="login-page">
		<div class="form" id="customLogin">
		
			<form class="register-form" action="/member/register" method="post">
			<label id="label1"></label>
				<input type="text" name="member_email" id="id"
					placeholder="이메일을 입력해주세요" />
				<button type="button" class="emailBtn" id="mail-Check-Btn">본인인증</button>
				<div class="mail-check-box">
					<input class="form-control mail-check-input"
						placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					<span id="mail-check-warn"></span>
				</div>
				<input type="text" name="name" placeholder="이름을 입력해주세요">
				<input type="password" name="pwd" placeholder="비밀번호를 입력해주세요" /> 
				<input type="password" name="pwd-repeat" placeholder="비밀번호를 재입력해주세요" /> <input
					type="text" name="phone" placeholder="전화번호를 입력해주세요" />
				<div class="checkboxDiv">
					<div>
						<input type="checkbox" name="agree_all" id="agree_all"> <label
							for="agree_all">모두 동의합니다</label>
					</div>
					<div class="striped">
						<span class="striped-line"></span> 
						<span class="striped-line"></span>
					</div>
					<div>
						<input type="checkbox" name="agree" value="1" id="check_1">
						<label for="agree"> 이용약관 동의<strong>(필수)</strong>
						</label>
					</div>
					<div>
					
					 	<input type="checkbox" name="agree" value="2" id="check_2">
						<label for="agree">개인정보 수집, 이용 동의<strong>(필수)</strong>
						</label> 
					</div>
					<div>
						
						<input type="checkbox" name="agree" value="3" id="check_3"> 
						 	<label for="agree">개인정보 이용 동의<strong>(필수)</strong>
						 	</label> 
					</div>
					
					<div>
					
						 <input type="checkbox" name="agree" value="4" id="check_4"> 
						<label for="agree">이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></label>
					</div>
				</div>
				<button id="registerBtn">회원가입</button>
				<p class="message">
					이미 회원이신가요? <a href="#">로그인 </a>
				</p>
			</form>
			<form class="login-form" action="/login" method="post">
			<div class="error">
			${error}
		</div>
				<input type="text" name="username" placeholder="이메일을 입력해주세요" /> <input
					type="password" name="password" placeholder="비밀번호를 입력해주세요" />
				<p class="info">
					<a href="/member/findid" class="id">아이디,</a><a
						href="/member/findpwd">비밀번호를 잊으셨나요?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</p>
				
				<div class="checkboxDiv2">
				자동 로그인
				<input type="checkbox" checked="checked" name="remember-me">
				</div>
				<button id="loginBtn" style="margin-top:15px;">로그인</button>
				<p class="message">
					아직 회원이 아니세요? <a href="#">이메일 회원 가입</a>
				</p>
				<div class="striped">
					<span class="striped-line"></span> <span class="striped-text">or</span>
					<span class="striped-line"></span>
				</div>
				<h4 class="text-xs text-center text-gray-500">SNS 간편 로그인</h4>
				<a
					href="https://kauth.kakao.com/oauth/authorize?client_id=3334abd3f2359d5a2d50f1d20357c04f&redirect_uri=http://localhost:8181/login/kakao&response_type=code">
					<img src="/resources/images/카카오로그인.jpg" alt="카카오톡" class="image">
				</a>
				<button type="button" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=3334abd3f2359d5a2d50f1d20357c04f&logout_redirect_uri=http://localhost:8181/login/kakaoLogout'">카카오 로그아웃</button>
			</form>
		</div>
	</div>
	<form id="form-kakao-login" method="post" action="kakao-login">
		<input type="hidden" name="member_email" /> <input type="hidden"
			name="name" /> <input type="hidden" name="profile" />
	</form>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/resources/js/customLogin.js"></script>
</html>