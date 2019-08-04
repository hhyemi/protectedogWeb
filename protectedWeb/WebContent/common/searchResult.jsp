<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
</head>

<body> 
    
    <div id="searchEmpty" align="center" style="height: 300px; padding-top: 50px;"></div>

	<script type="text/javascript">
    	if ($('#searchKeyword').val().trim() != '') {
			$('#searchEmpty').html( 
				'<div align="center" style="display: flex;justify-content: center;align-items: center;"><div id="item">'
				+'<div class="block text-left"><b><font size="5px"><font color="#f04f23"> \''+$('#searchKeyword').val()+'\'</font>'+'에 대한 검색 결과가 없습니다.</font></b></div>'
        		+'<p align="left"><br/>단어의 철자가 정확한지 확인해 주세요.<br/>'
        		+'검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.<br/>'
        		+'보다 일반적인 검색어로 검색해 주세요.</p></div></div></div>'			
			);
    	} else {
    		$('#searchEmpty').html( 
				'<div align="center" style="display: flex;justify-content: center;align-items: center;"><div id="item">'
				+'<div class="block text-left"><b><font size="5px">게시글이 없습니다.</font></b></div>'
        		+'</div></div></div>'			
		);
    }
	
    </script>
</body>

</html>