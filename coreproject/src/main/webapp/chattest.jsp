<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/code.jquery.com_jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/chat.css" />
</head>
<body>
	<div class="wrap">
		<div class="username">
			이름
		</div>
		
		<div class="chat-messages"></div>
		
		<div class="chat-form">
			<form onsubmit="sendChatMessage(this); return false;">
				<div class="input-text">
					<input type="text" name="body" placeholder="메세지를 입력해주세요." />
				</div>
				<div align="right">
					<input type="submit" value="전송" />
				</div>
			</form>
		</div>
	</div>
	
	

	<script type="text/javascript">
		/*<![CDATA[*/
		var lastReceivedMessageNo = -1;

		function loadChatMessages(from) {
			// post => 데이터 삽입/수정/삭제
			// get => 데이터 조회
			// $.post(받는사람, 보낼_데이터, 이번에_보낸_편지에_대한_응답이_온후에_실행될_함수, 받는데이터의_타입);
			$.get('/chat/getMessagesFrom', {
				'from' : from
			}, function(data) {
				if (data.length > 0) {
					lastReceivedMessageNo = data[data.length - 1].no;

					for (var i = 0; i < data.length; i++) {
						var writer = data[i].writer;
						var body = data[i].body;

						// 그리기
						$('.chat-messages').prepend(
								`<div>${writer} : ${body}</div>`);
					}
				}

				setTimeout(loadNewChatMessages, 500);
			}, 'json');
		}

		// 내가 가지고 있는 메세지 이후의 새 데이터를 달라고 요청한다.
		function loadNewChatMessages() {
			loadChatMessages(lastReceivedMessageNo + 1);
		}

		function sendChatMessage(form) {
			// 양옆 공백제거
			// trim => 공백제거 함수
			form.writer.value = form.writer.value.trim();

			if (form.writer.value.length == 0) {
				alert('이름을 입력해주세요.');
				form.writer.focus();

				return;
			}

			// 양옆 공백제거
			// trim => 공백제거 함수
			form.body.value = form.body.value.trim();

			if (form.body.value.length == 0) {
				alert('내용을 입력해주세요.');
				form.body.focus();

				return;
			}

			var writer = form.writer.value;
			var body = form.body.value;

			form.body.value = '';
			form.body.focus();

			// post => 데이터 삽입/수정/삭제
			// get => 데이터 조회
			// $.post(받는사람, 보낼_데이터, 이번에_보낸_편지에_대한_응답이_온후에_실행될_함수, 받는데이터의_타입);
			$.post('/chat/doAddMessage', {
				'writer' : writer,
				'body' : body
			}, function(data) {
				// 여기서는 딱히 할일이 없습니다.
				// 왜냐 해당 요청이 할일은 데이터를 보내는 것 까지 이기 때문입니다. 
			}, 'json');
		}

		loadNewChatMessages();

		/*]]>*/
	</script>

	 
	
	
</body>
</html>