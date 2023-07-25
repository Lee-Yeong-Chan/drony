<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   * {
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
        border-radius: 5px;
    }
    
    body {
        margin: 0;
        background-color: #fafcfc;
    }
    
    .login-form {
        width: 300px;
        background-color: #EEEFF1;
        margin-right: auto;
        margin-left: auto;
        margin-top: 50px;
        padding: 20px;
        text-align: center;
        border: none;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    
    .text-field {
        font-size: 14px;
        padding: 10px;
        border: none;
        width: 260px;
        margin-bottom: 10px;
    }
    
    .submit-btn {
        font-size: 14px;
        border: none;
        padding: 10px;
        width: 260px;
        background-color: #4c8ac8;
        margin-bottom: 10px;
        color: white;
    }
    
    .links {
        text-align: center;
    }
    
    .links a {
        font-size: 12px;
        color: #9B9B9B;
    }
</style>
</head>
<body>
<div class="login-form">
    <div class="field">
        <b>일반 사용자 로그인</b>
    </div><br>
    <form>
        <input type="text" name="email" class="text-field" placeholder="아이디">
        <input type="password" name="password" class="text-field" placeholder="비밀번호">
        <input type="submit" value="일반 사용자 로그인" class="submit-btn">
        <input type="submit" value="일반 사용자 회원가입" class="submit-btn">
    </form>

    <div class="links">
        <a href="#">비밀번호를 잊어버리셨나요?</a>
    </div>
</div>
</body>
</html>