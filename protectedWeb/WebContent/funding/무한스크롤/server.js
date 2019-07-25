	var app = require('express')();
	var http = require('http').Server(app);
	var io = require('socket.io')(http);
	var room1count = 0;
	var room2count = 0;
	
	app.get('/', function(req, res){
	  res.send('<h1>안녕하세요</h1>');
	});
	
	var room1 = io.of('/room1');
	var room2 = io.of('/room2');
	
	var room1user = [] ; 
	var room2user = [] ;
	
	function userObject (id,name) {
		
		this.id = id;
		this.name = name;
		
	} 
	
	
	
	
	
	room1.on('connection', function(socket){
	  		
	  room1count++;
	  console.log(socket.id+'유저가 접속을 했습니다.(room1)현재 접속자--'+room1count+'명--');
	  //접속시 전체메세지
	  room1.emit('send_msg', 'developerNam : 현재 접속자 : '+room1count);
	    
	  socket.on('disconnect', function () {
		  room1count--;
		  		  
		  
		  console.log('유저가 접속해제를 했습니다.(room1)');
		  
		  for( var i = 0; i < room1user.length; i++){ 
			   if ( room1user[i].id === socket.id) {
				 room1.emit('send_msg', 'developerNam : --------------'+room1user[i].name+'님 퇴장--------------현재 접속자 : '+room1count);  
			     room1user.splice(i, 1); 
			   }
			}
		  
		  room1.emit('updateUser',room1user);
		  
		  
	  });	
	  socket.on('send_msg', function (msg) {
		  
	      console.log(msg);
	      room1.emit('send_msg', msg);
	  });
	  
	  socket.on('updateUser', function(userName) {
		
		  var user = new userObject(socket.id,userName);
		  
		  room1user.push(user);
		  room1.emit('updateUser', room1user);
		  
	  });
	  
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	room2.on('connection', function(socket){
  		
		  room2count++;
		  console.log(socket.id+'유저가 접속을 했습니다.(room2)현재 접속자--'+room2count+'명--');
		  //접속시 전체메세지
		  room2.emit('send_msg', 'developerNam : 현재 접속자 : '+room2count);
		    
		  socket.on('disconnect', function () {
			  room2count--;
			  		  
			  
			  console.log('유저가 접속해제를 했습니다.(room2)');
			  
			  for( var i = 0; i < room2user.length; i++){ 
				   if ( room2user[i].id === socket.id) {
					 room2.emit('send_msg', 'developerNam : --------------'+room2user[i].name+'님 퇴장--------------현재 접속자 : '+room2count);  
				     room2user.splice(i, 1); 
				   }
				}
			  
			  room2.emit('updateUser',room2user);
			  
			  
		  });	
		  socket.on('send_msg', function (msg) {
			  
		      console.log(msg);
		      room2.emit('send_msg', msg);
		  });
		  
		  socket.on('updateUser', function(userName) {
			
			  var user = new userObject(socket.id,userName);
			  
			  room2user.push(user);
			  room2.emit('updateUser', room2user);
			  
		  });
		  
		});
	
	
	
	
	
	 
	http.listen(82, function(){
	  console.log('listening on *:82');
	});

