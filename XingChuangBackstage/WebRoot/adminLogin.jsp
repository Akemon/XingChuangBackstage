<%@ page contentType="text/html; charset=GBK" language="java"
	import="java.sql.*" errorPage=""%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">

<meta charset="GBK">
<title>无标题文档</title>
 <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="css/bootstrap.min.css"
    type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet"
    href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="jquery/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		
	});
	function changeVerifyCode(){
	$("#img").attr("src","VerifyCode?"+Math.random());

	}
		
</script>
<body
	style="background-image:url(image/background.jpg); background-size:cover;">
	<div style="width:100%;height:100% ">
		<div align="center" style="margin-top:20%">
			<form class="form-horizontal" role="form" style="width:350px" action="LoginCheck" method ="PSOT">
				<div class="form-group">

					<div class="col-sm-10">
						<input type="text" class="form-control" id="userName" name ="userName"
							placeholder="请输入用户名 " style="width: 350px">
					</div>
				</div>


				<div class="form-group">

					<div class="col-sm-10">
						<input type="password" class="form-control" id="pass" name ="pass" 
							placeholder="请输入密码" style="width: 350px">
					</div>
				</div>
				
				<!-- 验证码 -->
				<div class="form-group">

					<div class="col-sm-10">
						
						<input  class="form-control" id="numberCheck" name="numberCheck"
							placeholder="请输入右边的验证码" style="width: 280pxs"> 
					</div>
					<img id="img" src="VerifyCode" style="width:62px ;height:30px" onclick="changeVerifyCode();"/ >
				</div>



				<button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>

			</form>
		</div>
	</div>
</body>
</html>