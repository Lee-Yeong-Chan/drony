<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
		<div id="page-wrapper">
			<section id="main">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="content">
	
								<!-- Content -->
								<article class="box page-content userjoin">
									<header class="join">
										<h2>회 원 가 입</h2>
									</header>
									<section class="join-form">
										<form action="JoinUserCon" method="post" name="joinForm">
											<b>아이디</b><br>
											<input type="text" name="id" onkeydown="inputIdCheck()">
											<button type="button" onclick="fn_dbCheckId()" name="dbCheckId" class="checkId">중복확인</button>
											<input type="hidden" name="idDuplication" value="idUnCheck">
											<br>
											<b>비밀번호</b><br>
											<input type="password" name="pw"><br>
											<b>비밀번호확인</b><br>
											<input type="password" name="repw"><br>
											<b>이름</b><br>
											<input type="text" name="name"><br>
											<b>이메일</b><br>
											<input type="text" name="email"><br>
											<b>전화번호</b><br>
											<input type="text" name="phone"><br>
											<input type="submit" value="회원가입" onclick="fn_joinMember()">
										</form>
									</section>
								</article>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>	

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		<!-- <script>
			function fn_joinMember(){
				var joinForm=document.joinForm;
				var name=joinForm.name.value;
				var id=joinForm.id.value;
				var pwd=joinForm.pw.value;
				var rePwd=joinForm.repw.value;
				var email=joinForm.email.value;
				var phone=joinForm.phone.value;
				if(name.length==0||name==""){
					alert("이름을 입력해주세요.");
					joinForm.name.focus();
					return false;
				}
				else if(id.length==0||id==""){
					alert("아이디를 입력해주세요.");
					joinForm.id.focus();
					return false;
				}
				if(joinForm.idDuplication.value!="idCheck"){
					alert("아이디 중복체크를 해주세요.");
					return false;
				}
				if(pw.length==0||pw==""){
					alert("비밀번호를 입력해주세요.");
					joinForm.pw.focus();
					return false;
				}
				if(repw.length==0||repw==""){
					alert("비밀번호 확인을 입력해주세요.");
					joinForm.pw.focus();
					return false;
				}
				if(pw!=repw){
					alert("비밀번호 확인이 비밀번호와 다릅니다.");
					joinForm.repw.focus();
					return false;
				}
				if(email.length==0||email==""){
					alert("이메일을 입력해주세요.");
					joinForm.email.focus();
					return false;
				}
				if(phone.length==0||phone==""){
					alert("전화번호를 입력해주세요.");
					joinForm.phone.focus();
					return false;
				}
				else{
					joinForm.method="post";
					joinForm.action="joinUserCon";
					joinForm.submit();
				}
			}
			function fn_dbCheckId(){
				var joinForm=document.joinForm;
				var id=joinForm.id.value;
				if(id.length==0||id==""){
					alert("아이디를 입력해주세요.");
					joinForm.id.focus();
				}
				else{
					window.open("${contextPath}/mem?user_id="+id,"","width=500, height=300");
				}
			}
		</script> -->
	</body>
</html>