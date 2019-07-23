<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

   	
<title>매드포코딩 채팅</title>
 
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
    <div id="a1" style="display: none">
    
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
	     	<!-- 
	     	<div><p class="text-center">
	     		<span class="glyphicon glyphicon-user" aria-hidden="true"></span>user1
	     	</p></div>	     	
	     	 -->
	     	 </div>
     	
     </div>	
     
     </div>
     	<div class="btn-group">
		<a class="btn btn-primary" href="#">채팅방생성</a>
		<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
		<ul class="dropdown-menu" >
		<li><a href="#">1:1채팅방</a></li>
		<li><a href="#">그룹채팅방</a></li>

		</ul>
		</div>
		
		
     	<a id="a2">
     	<div id='blank'></div>
     	<div id = "chattingList">

	    </div> 	
	     	</a>  	
</div> 	
    <script src="http://192.168.0.33:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script>
	$( function() {    
    	$("#addChatting")
	  } );  
    
  //==>"ID로그인체크" 
		
            $(function(){
            	
           //회원 체크
            var chattingUserId=null;
            var  chattingTitle = null;
       	/*	 $.ajax( 
 					{
 						url : "/user/json/getChattingUser/" ,
 						method : "GET" ,
 						dataType : "json" ,
 						headers : {
 							"Accept" : "application/json",
 							"Content-Type" : "application/json"
 						},
 						success : function(JSONData , status) {

 						 ChattingUserId = JSONData.userId;

 						}
 						
 				}); */
       		 
       		//몽고디비 채팅목록 체크 
        		 $.ajax( 
 					{
 						url : "/chatting/json/getChattingRoomList/",
 						method : "GET" ,
 						dataType : "json" ,
 						headers : {
 							"Accept" : "application/json",
 							"Content-Type" : "application/json"
 						},
 						success : function(JSONData , status) {
 							//alert("JSONData:"+JSONData);
							
							chattingUserId = JSONData[0].userId;
							chattingTitle = JSONData[0].chattingTitle;
							//alert("chattingUserId:"+chattingUserId);
							//alert("chattingTitle:"+chattingTitle);
							for(var i=0; i< JSONData.length;i++){
 				            $("#chattingList").append("<div class=\"btn-info\" id="+JSONData[i].chattingTitle+"><p class=\"text-center\">"+JSONData[i].chattingTitle+"</p></div>");
							}
 			            	$(".btn-info").on("click",function(){  
 			            		
 			            							var room = $(".btn-info").attr('id');
 			            		            		var roomName = $(this).text(); 
 			            		            		
 			            		            		var userName = chattingUserId; 
 			            		            		if(userName==null){
 			            		            			alert("로그인하세요")
 			            		            		}else{
 			            		
 			            		            		var socket = io("http://192.168.0.33:82/"+room);
 			            		            		}            		
 			            		            		socket.emit("updateUser", userName);
 			            		            		
 			            		            		socket.emit("send_msg", userName+'님이 입장하셨습니다.');
 			            		            		
 			            		            		//대화명입력문단 삭제
 			            		            		$("#a2").remove(); 
 			            		            		$("#a1").attr("style","");
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
 						
 						}	
 				});
			

//             	$(".btn-info").on("click",function(){  
            		
// /*             		if($('#user_name').val() == ''){
//             			alert('대화명 입력바람');
//             			return;
//             		} */
// /*             		$("#user_name").val(userId); */
//             		var room = $(this).attr('id');
//             		var roomName = $(this).text(); 
            		
//             		var userName = chattingUserId; 
//             		if(userName==null){
//             			alert("로그인하세요")
//             		}else{
//             		var socket = io("http://192.168.0.33:82/"+room);
//             		}            		
//             		socket.emit("updateUser", userName);
            		
//             		socket.emit("send_msg", userName+'님이 입장하셨습니다.');
            		
//             		//대화명입력문단 삭제
//             		$("#a2").remove(); 
//             		$("#a1").attr("style","");
// 	                $("#roomName").text("대화방 : "+roomName);
	                
//             		//msg에서 키를 누를떄
// 	                $("#msg").keydown(function(key){
// 	                    //엔터누를시
// 	                    if(key.keyCode == 13){
// 	                        //msg_process를 클릭해준다.
// 	                        msg_process.click();
// 	                    }
// 	                });
	                
// 	                //msg_process를 클릭할 때
// 	                $("#msg_process").click(function(){
// 	                    //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
// 	                     socket.emit("send_msg", userName+' : '+$("#msg").val());
// 	                    //#msg에 벨류값을 비워준다.
// 	                    $("#msg").val("");
// 	                });
	                
// 	                socket.on('send_msg', function(msg) {
// 	                	var chatbox = $("#chat_box");   
// 	                	//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
// 	                    $('<div></div>').text(msg).appendTo("#chat_box");
// 	                    chatbox.scrollTop(chatbox[0].scrollHeight);
// 	                }); 
	                
// 	                socket.on('updateUser', function(user) {
	                	
// 	                	$('#userList').html("");
	                	
// 	                	$.each(user,function(index,value){
// 	                		$('<div class="bg-warning"></div>').text(value.name).appendTo("#userList");
// 	                	});
	                	
// 	                });
                
//             	});
            });
        </script>
</body>
</html>