<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문가 회원가입</title>
<style>
*{
    box-sizing: border-box; /*전체에 박스사이징*/
    margin: 0;
    padding: 0;
    outline: none; /*focus 했을때 테두리 나오게 */
}

body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Noto Sans KR', sans-serif;
            font-size:14px;
            background-color: #f5f6f7;
            line-height: 1.5em;
            color: #222;
        } 

        .heading {
            position: absolute;
            top: 30px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 32px;
            margin-bottom: 10px;
        }
      
/*member sign in*/
.member{
    width: 400px;
    /* border: 1px solid #000; */
    margin: auto; /*중앙 정렬*/
    padding: 0 20px;
    margin-bottom: 20px;
    margin-top: 50px;
}


.field{
    margin : 30px 0; /*상하로 좀 띄워주기*/
}

.field b {
    display: block;
    margin-bottom: 5px;

}

/*input 중 radio 는 width 가 100%면 안되니까 */
.member input:not(input[type=radio]),
.member select{
    border: 1px solid #dadada;
    padding: 10px;
    width: 100%;
    margin-bottom: 5px;
}

.member input[type=button],
.member input[type=submit]{
background-color: #234f7a;
color:#fff;
padding: 10px 15px;
border:none;
cursor: pointer;

}

.member input:focus,
.member select:focus{
    border: 1px solid #2db400;
}

.field.birth div{ /*field 이면서 birth*/
    display: flex;
    gap:10px; /*간격 벌려줄때 공식처럼 사용핟나 */
}

/* .field.birth div > * {  gap 사용한거랑 같은 효과를 줌 
    flex:1;
} */

.field.tel-number div {
            display: flex;
            gap: 10px;
        }

        .field.tel-number div input:nth-child(1) {
            flex: 2;
        }

        .field.tel-number div input:nth-child(2) {
            flex: 1;
        }


.field.gender div{
    border: 1px solid #dadada;
    padding: 15px 5px;
    background-color: #fff;
    display: flex;
    gap: 10px;
}

.placehold-text{
    display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
    position:relative;
    /* border: 1px solid #000; */
}

.placehold-text:before{ 
    content: '';
    position:absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
    right : 20px;
    top:13px;
    pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
}

.userpw{
    background:url(./images/images2/icon-01.png) no-repeat center right 15px;
    background-size: 20px;
    background-color: #fff;
}

.userpw-confirm{
    background:url(./images/images2/icon-02.png) no-repeat center right 15px;
    background-size: 20px;
    background-color: #fff;
}

.member-footer {
    text-align: center;
    font-size: 12px;
    margin-top: 20px;
}

.member-footer div a:hover{
    text-decoration: underline;
    color:#2db400
}

.member-footer div a:after{
    content:'|';
    font-size: 10px;
    color:#bbb;
    margin-right: 5px;
    margin-left: 7px;
    /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
    display: inline-block;
    transform: translateY(-1px);

}

.member-footer div a:last-child:after{
    display: none;
}

@media (max-width:768px) {
.member{
        width: 100%;
    }
}
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
*{
    box-sizing: border-box; /*전체에 박스사이징*/
    outline: none; /*focus 했을때 테두리 나오게 */
}

body{
    font-family: 'Noto Sans KR', sans-serif;
    font-size:14px;
    background-color: #f5f6f7;
    line-height: 1.5em;
    color : #222;
    margin: 0;
}


a{
    text-decoration: none;
    color: #222;
}
 <link rel="icon" href="./images/images2/favicon.png">
    <link rel="stylesheet" href="./quiz07.css">
</style>
</head>
<body>
<div class="heading">전문가 회원가입</div>
    <div class="member">
        <!-- 1. 로고 -->
        
        <form action="#">

            <!-- 2. 필드 -->
            <div class="field">
                <b>아이디</b>
                <span class="placehold-text"><input type="text"></span>
            </div>
            <div class="field">
                <b>비밀번호</b>
                <input class="userpw" type="password">
            </div>
            <div class="field">
                <b>비밀번호 재확인</b>
                <input class="userpw-confirm" type="password">
            </div>
            <div class="field">
                <b>이름</b>
                <input type="text">
            </div>
            
            <!-- 3. 필드(생년월일) -->
            <div class="field birth">
                <b>생년월일</b>
                <div>
                    <input type="number" placeholder="년(4자)">                
                    <select>
                        <option value="">월</option>
                        <option value="">1월</option>
                        <option value="">2월</option>
                        <option value="">3월</option>
                        <option value="">4월</option>
                        <option value="">5월</option>
                        <option value="">6월</option>
                        <option value="">7월</option>
                        <option value="">8월</option>
                        <option value="">9월</option>
                        <option value="">10월</option>
                        <option value="">11월</option>
                        <option value="">12월</option>
                    </select>
                    <input type="number" placeholder="일">
                </div>
            </div>
            
            <!-- 4. 필드(성별) -->
            <div class="field gender">
                <b>성별</b>
                <div>
                    <label><input type="radio" name="gender">남자</label>
                    <label><input type="radio" name="gender">여자</label>
                    <label><input type="radio" name="gender">선택안함</label>
                </div>
            </div>
            
            <!-- 5. 이메일_전화번호 -->
            <div class="field">
                <b>본인 확인 이메일</b>
                <input type="text">
                <select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
                    <option value="">-선택-</option>
                    <option value="naver.com">naver.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="nate.com">nate.com</option>
                    <option value="korea.com">korea.com</option>
                    <option value="yahoo.com">yahoo.com</option>
                </select>
            </div>
            
            <div class="field tel-number">
                <b>휴대전화</b>
                <div>
                    <input type="text" value="전화번호 입력">
                </div>
            </div>
            <div class="field">
                <b>업체명</b>
                <span class="placehold-text"><input type="text"></span>
            </div>
            <div class="field">
                <b>사업자번호</b>
                <span class="placehold-text"><input type="text"></span>
            </div>
            <div class="field">
                <b>업체주소</b>
                <span class="placehold-text"><input type="text"></span>
            </div>
            <div class="field">
                <b>작업지역</b>
                <span class="placehold-text"><input type="text"></span>
            </div>
            <div class="field">
                <b>작업분야</b>
                <span class="placehold-text"><input type="text"></span>
            </div>
            <!-- 6. 가입하기 버튼 -->
            <input type="submit" value="가입하기">
        </form>
            
            <!-- 7. 푸터 -->
        

</body>
</html>