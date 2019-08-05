<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" > -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
	
<title>보호할개 · 챗봇</title>
 
<style>
#chat_box {
    width: 100%;
    min-width: 100%;
    height: 500px;
    min-height: 500px;
    border: 1px solid black;
}
#msg {
    width: 500px;
}
#msg_process {
    width: 90px;
}
#blank {
	height : 300px;
}
#roomName{
	width : 100%;
}
</style>
</head>
<body>

	<div class="modal fade" id="chatbot-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content loginSection">
				<div class="container">
    <div id="a1" style="display: none">
    
    <div class="col-md-12">
	    
	    <div class="bg-info"><p class="text-center" id="roomName"></p></div>
	    <div id="chat_box" style="overflow:auto">
	    </div>
	    
	    
	    <input type="text" id="msg">
	    <button id="msg_process">전송</button>
	 </div> 
	 <div class="col-md-12">  
	 
     	<div class="bg-danger"><p class="text-center">채팅접속자</p></div>
	     	<div id='userList' class='text-center'>
	     	<!-- 
	     	<div><p class="text-center">
	     		<span class="glyphicon glyphicon-user" aria-hidden="true"></span>user1
	     	</p></div>	     	
	     	 -->
	     	 </div>
     	
     </div>	
     
     </div>
     	
     	<a id="a2">
     	<div id='blank'></div>
     	<input type="text" class="form-control" id="user_name" placeholder="대화명 입력"/>
     	<div class="btn-info" id="room1"><p class="text-center">보호할개 · 챗봇 테스트</p></div>
     	<div class="btn-info" id="room2"><p class="text-center">아무나</p></div></a>     	
     
				</div> 	

			</div>
		</div>
	</div>
</body>

    <script src="http://192.168.0.30:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script>
    		
            $("#chatbot").on("click",function(){
            	   	         	   	
            	
//             	$(".btn-info").on("click",function(){  
            		
//             		if($('#user_name').val() == ''){
//             			alert('대화명 입력바람');
//             			return;
//             		}
            		
//             		var room = $(this).attr('id');
//             		var roomName = $(this).text();
            		
//             		var userName = $("#user_name").val();
            		
//             		console.log("room" + room);
            		
            		var socket = io("http://192.168.0.30:82/ChatBot");
            		            		
            		socket.emit("updateUser", "회원님");
            		
            		$('<div align=center></div>').text("멍봇 : 질문사항이 있으신가요? ").appendTo("#chat_box")
            		
            		//대화명입력문단 삭제
            		$("#a2").remove(); 
            		$("#a1").attr("style","");
	                $("#roomName").html("멍봇 <span class='fas fa-dog'></span>");
	                
            		//msg에서 키를 누를떄
	                $("#msg").keydown(function(key){
	                    //엔터누를시
	                    if(key.keyCode == 13){
	                        //msg_process를 클릭해준다.
	                        msg_process.click();
	                    }
	                });
	                
	                //msg_process를 클릭할 때
	                $("#msg_process").click(function(){
	                    //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
	                     socket.emit("send_msg", '회원님 : '+$("#msg").val());
	                    //#msg에 벨류값을 비워준다.
	                    $("#msg").val("");
	                });
	                
	                socket.on('send_msg', function(msg) {
	                	var chatbox = $("#chat_box");   
	                	//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
	                	console.log(" msg : "+ msg + " \n msg.substring(0,2) : " + msg.substring(0,2));
	                	if(msg.substring(0,2) == '멍봇'){
	                		$('<div align=right></div>').text(msg).appendTo("#chat_box");
	                	}
	                	if(msg.substring(0,2) != '멍봇'){
	                		$('<div></div>').text(msg).appendTo("#chat_box");
	                	}
	                    
	                    chatbox.scrollTop(chatbox[0].scrollHeight);
	                }); 
	                
	                socket.on('updateUser', function(user) {
	                	
	                	$('#userList').html("");
	                	
	                	$.each(user,function(index,value){
	                		$('<div class="bg-warning"></div>').text(value.name).appendTo("#userList");
	                	});
	                	
	                });
            });
        </script>
</html>