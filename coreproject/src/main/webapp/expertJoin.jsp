<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>DRONY</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body class="is-preload">
	<div id="page-wrapper">
	
		<!-- Header -->
			<header id="header">
				<div class="logo container">
					<div>
						<span><a href="main.jsp" id="logo">DRONY</a></span>
					</div>
				</div>	
			</header>
	
		<section id="main">
			<div class="container">
			
					<div class="col-12">
						<div class="content">

							<!-- Content -->
								<header class="join">
									<h2>회 원 가 입</h2>
								</header>
								<section class="logbutton join-form">
									<form action="JoinExpertCon" method="post" name="joinForm">
										<div>
											<b>아이디</b><br>
											<input type="text" name="id" id="id">
										</div>
										<div align="right">
											<p id="result"></p>
											<button type="button" id="CheckId" class="checkId">중복확인</button>
										</div>
										<div>
											<b>비밀번호</b><br>
										<input type="password" name="pw">
										</div>
										<div>
											<b>비밀번호 확인</b><br>
											<input type="password" name="pw_re">
										</div>
										<div>
											<b>이름</b><br>
											<input type="text" name="name">
										</div>
										<div>
											<b>이메일</b><br>
											<input type="text" name="email">
										</div>
										<div>
											<b>전화번호</b><br>
											<input type="text" name="phone">
										</div>
										<div>
											<b>사업자번호</b><br>
											<input type="text" name="bno">
										</div>
										<div>
											<b>업체명</b><br>
											<input type="text" name="company_name">
										</div>
										<div>
											<b>업체주소</b><br>
											<input type="text" name="company_address">
										</div>
										<div>
											<b>작업지역</b><br>
											<input type="text" name="working_area">
										</div>
										<div>
											<b>분야</b><br>
											<input type="text" name="working_field">
										</div>
										<div>
											<input type="button" value="회원가입" class="submit-btn" onclick="join()">
										</div>
									</form>
								</section>
								
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
	<script>
			$('#CheckId').click(function(){	
				if($('#id').val()!=''){
					$.ajax({
						type:'get',
						url:'checkExpertId',
						data:{'exp_id':$("#id").val()},
						dataType:'json',
						success:function(res){
							if(res=='0'){
								$('#result').text('사용가능한 아이디입니다.');
							}
							else{
								$('#result').text('이미 사용중인 아이디입니다.');
							}
						},
						error:function(){
							alert('비동기접속 실패');
						}
					});
				}
				else{
					alert('아이디를 입력하세요.');
					$('#id').focus();
				}
			});
			var form = document.joinForm;
			function join(){
				if(!form.id.value){
					alert("아이디를 입력해주세요.");
					form.id.focus();
					return;
				}
				if(!form.pw.value){
					alert("비밀번호를 입력해주세요.");
					form.password.focus();
					return;
				}
				if(form.pw.value != form.pw_re.value){
					alert("비밀번호를 확인해주세요.");
					form.password.focus();
					return;
				}
				if(!form.name.value){
					alert("이름을 입력해주세요.");
					form.name.focus();
					return;
				}
				if(!form.email.value){
					alert("이메일을 확인해주세요.");
					form.email.focus();
					return;
				}
				if(!form.phone.value){
					alert("전화번호를 입력해주세요.");
					form.phone.focus();
					return;
				}
				if(!form.bno.value){
					alert("사업자번호를 입력해주세요.");
					form.bno.focus();
					return;
				}
				if(!form.company_name.value){
					alert("사업자명을 입력해주세요.");
					form.company_name.focus();
					return;
				}
				if(!form.company_address.value){
					alert("사업자주소를 입력해주세요.");
					form.company_address.focus();
					return;
				}
				if(!form.working_area.value){
					alert("작업가능구역을 입력해주세요.");
					form.working_area.focus();
					return;
				}
				if(!form.working_field.value){
					alert("작업가능분야를 입력해주세요.");
					form.working_field.focus();
					return;
				}
				if($('#result').text()!='사용가능한 아이디입니다.'){
					alert("아이디 중복확인해주세요.");
					form.id.focus();
					return;
				}
				form.submit();
			}
		</script>
</body>
</html>