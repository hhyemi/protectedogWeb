<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

      <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content loginSection">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      <form id="login-form">
                          <h3 class="text-center">로그인</h3>
                          <div class="modal-body">
                              <label for="username">아 이 디</label> 
                              <input id="login_username" name="id" class="form-control id" type="text" placeholder="Enter username " required>
                              <label for="username">비밀번호</label> 
                              <input id="login_password" name="pw" class="form-control pw" type="password" placeholder="Enter password" required>


                          </div>
                          <div class="modal-footer text-center">
                              <div>
                                  <button type="submit" id="submitLogin" class="btn btn-general btn-white">Login</button>
                              </div>
                              <div>
                              	  <img src="/resources/file/others/kakao.png" height="30px" width="30px" class="kakaoLogin">
                              </div>
							  <div id="naver_id_login"></div>


                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>

</body>
</html>