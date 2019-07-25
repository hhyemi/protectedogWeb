<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

   	
<title>보호할개</title>
 
<style>
#chat_box {
    width: 650px;
    min-width: 650px;
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

</style>
</head>
<body>
<div class="container">
    <div>
    
    <div class="col-md-7">
	    
	    <div class="bg-info"><p class="text-center" id="roomName"></p></div>
	    <div id="chat_box" style="overflow:auto">
	    </div>
	    <input type="text" id="msg">
	    <button id="msg_process">전송</button>
	 </div> 
	 <div class="col-md-3">  
	 
     	<div class="bg-danger"><p class="text-center">채팅접속자</p></div>
	     	<div id='userList' class='text-center'>
	     	 </div>
     	
     </div>	
     
     </div> 
     <input type="hidden" id="userId" value="${userId }"> 
     <input type="hidden" id="postId" value="${postId }">     
</div> 	
    <script src="http://192.168.0.33:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script>
// 	$( function() {    
//     	$("#addChatting")
// 	  } );  
    
            $(document).ready(function(){
            
            		var roomName = "문의하기";
            		
            		var userName = $("#userId").val();
            		var postId = $("#postId").val();
            		//alert(userName)
            		var socket = io("http://192.168.0.33:82/");
     		
            		socket.emit("updateUser", userName);  
            		
            		socket.emit("send_msg", userName+'님이 입장하셨습니다.');
            		
	                $("#roomName").text("대화방 : "+roomName);
	                
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
	                     socket.emit("send_msg", userName+' : '+$("#msg").val());
	                    //#msg에 벨류값을 비워준다.
	                    $("#msg").val("");
	                });
	                
	                socket.on('send_msg', function(msg) {
	                	var chatbox = $("#chat_box");   
	                	//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
	                    $('<div></div>').text(msg).appendTo("#chat_box");
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
</body>
</html>