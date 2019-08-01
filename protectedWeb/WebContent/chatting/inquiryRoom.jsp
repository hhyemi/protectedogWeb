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
					padding-top : 10px;
		            width: 400px;
		            height: 400px;
		            border: 1px solid black;
		            background: #f0f0f2;
		}

		#msg_process {
		          width: 16%;
		            height: 34px;
		            border-radius: 50px;
		            background: #ff7752;
		            color: white;
		}
		#blank {
			height : 300px;
		}


       #container {
            width: 400px;
            height: 400px;
            border: 1px solid black;
            background: ivory;
        }
        #chatView {
            height: 90%;
            overflow-y: scroll;
        }
        #chatForm {
            height: 10%;
            border-top: 1px solid black;
            text-align: center;
        }
        #msg {
            width: 73%;
            height: 32px;
            border-radius: 8px;
        }
        #send {
            width: 16%;
            height: 34px;
            border-radius: 50px;
            background: black;
            color: white;
        }
    .msgLine {
    text-align : right;
        margin-left: 15px;
        margin-right: 15px;
    }
    .msgBox {
             overflow:hidden;
        height:auto;
    	text-align : right;
        border: 0px solid black;
        background: #fab5a2;
        padding: 2px 5px;
        border-radius: 10px;
        padding-left: 10px;
        padding-right: 10px;
    }  
    .msgLine2 {
        text-align : left;
        margin-left: 15px;
        margin-right: 15px;
    }
    .msgBox2 {
             overflow:hidden;
        height:auto;
    	text-align : left;
        border: 0px solid black;
        background: #f5e1dc;
        padding: 2px 5px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 10px;
    }  

</style>
</head>
<body>
<div class="container">
    <div>
    
    <div class="col-md-7">
	    <br/>
	    <div ><h4 class="text-center" id="roomName"><b>보호할개 채팅</b></h4></div>
	    <div id="chat_box" style="overflow:auto">

	    </div>
	    <input type="text" id="msg">
	    <button id="msg_process">전송</button>
	 </div> 
	 <div class="col-md-3 " align="center">  
	 	<p/>
     	<div  style="background-color: #ffe7e0; width: 120px" ><p id="click" class="text-center"> 채팅접속자 <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></p></div>
	     	<div id="userList" class='text-center' style='display: none'> 
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
    $(document).ready(function () {

    		$("#click").click(function(){
    			$('#userList').toggle();  			
	    	    
    		});
    });

    
            $(document).ready(function(){
            
            		var userName = $("#userId").val();

            		var socket = io("http://192.168.0.33:82/");

            		socket.emit("updateUser", userName);
            		
            		socket.emit("send_msg", "server" , userName+'님이 입장하셨습니다.');
            		
            	      $("#msg_process").on('click', function(e){ //2
            	          socket.emit("send_msg", userName , $("#msg").val());
            	          $('#msg').val('');
            	          $('#msg').focus();
            	          e.preventDefault();
            	        });
            	        $("#msg").keydown(function(key){ 
            	            if(key.keyCode == 13){                   
            	          	  socket.emit("send_msg", userName , $("#msg").val());            
            	                $("#msg").val("");
            	                $('#msg').focus();
            	            }
            	        });
            	        


            	        socket.on('receive_message', function(re , msg){ //3
            	        var Now = new Date();

            	        var NowTime =  Now.getHours();

            	        NowTime += ':' + Now.getMinutes();
            	      	  if(re==userName){
            	    		 $('#chat_box').append("<div class='text-right'><div class='msgLine'>"+NowTime+"&nbsp;<button style='pointer-events: none;' class='msgBox' >"+msg+"</button></div></div><br/>");
            	    	  
            	      	  }else if(re=="server"){
            	    		  $('#chat_box').append("<div class='text-center'><button class='btn btn-secondary' style='pointer-events: none;' type='button' disabled>&ensp;"+msg+"&ensp;</button></div><br/>");
                  	       
            	    	  
            	    	  }else{
            	    		  $('#chat_box').append("&emsp;"+re+"<div class='text-right'><div class='msgLine2' ><button style='pointer-events: none;' class='msgBox2'>"+msg+"</button>"+NowTime+"</div></div><br/>");
            	    
            	    	  }
            	        $('#chat_box').scrollTop($('#chat_box')[0].scrollHeight);
            	      }); 
            	        
            	        
            	        
            	        
			                socket.on('updateUser', function(user) {
 			                	
 			                	$('#userList').html("");
 			                	
 			                	$.each(user,function(index,value){
 			                		$('<div style="background-color: #fff5f2"></div>').text(value.name).appendTo("#userList");
 			                	});
 			                	
 			                	
 			                });
 		                            	        

 	                }); 


        </script>
</body>
</html>