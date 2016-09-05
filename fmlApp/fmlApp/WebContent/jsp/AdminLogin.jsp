<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../style/main.css" rel="stylesheet" type="text/css" />
<link href="../style/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<title>房麦乐后台管理系统</title>
</head>
<body id="login_page">
<div class="inner">
  <div class="top"> <img src="../images/logo_fbs.png" /> </div>
  <div class="main">
    <form action="${pageContext.request.contextPath}
/admin/login" method="post" ModelAttribute="admin" id="loginForm">
      <p>
        <INPUT type="text"" name="userName" class="touming" id="loginCode" onFocus="if (value =='用户名'){value =''}" onBlur="if (value ==''){value='用户名'}" tabindex="1">
      </p>
      <p>
        <INPUT  type="password" name="password" class="touming " id="loginPass" onFocus="if (value =='密码'){value =''}" onBlur="if (value ==''){value='密码'}" tabindex="2">
      </p>
      <p class="option_p">
      	<!--<a href="#" class="forget_pwd">忘记密码？</a>-->
     	<label id="remAutoLoginTxt" for="remAutoLogin"><input tabindex="3" title="下次自动登录" class="loginFormCbx" type="checkbox" id="remAutoLogin">下次自动登录</label><b class="thetips">为了信息安全，请不要在公用电脑上使用此功能！</b>
      </p>
      <input type="button" onclick="login();" value="登录">
      </form>
  </div>
  <!--<div class="footer">
  	<div class="right_part">上海大众汽车有限公司版权所有</div>
    <div class="left_part">V1.01</div>
  </div>-->
</div>
<div class="footer">
  <div class="inner">
    房麦乐网络科技有限公司版权所有 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 系统支持热线：400-991-6778
  </div>
</div>
</body>

<script>


$(document).ready(function(){
	$("#remAutoLoginTxt").mouseover(function(){
		$(".thetips").show(0);
	});
	$("#remAutoLoginTxt").mouseleave(function(){
		$(".thetips").hide(0);
	});
	
});

function login() {
	var phone = $("#loginCode").val();
	var pass = $("#loginPass").val();
	if (phone != "" && pass != "") {
		document.getElementById("loginForm").submit();
	}
}
</script>
</body>
</html>