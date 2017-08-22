<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.above {
	height: 60px;
	background-color: #3CF;
}

.content {
	width: 100%;
	height: 100%;
}

.left {
	width: 200px;
	height: 100%;
	position: absolute;
	background-color: #666;
	float: left;
}

.right {
	float: left;
	margin-left: 200px;
}
</style>
<script type="text/javascript">
	function downArrow1() {
		var obj = document.getElementById("arrow1");
		if (obj.className == "glyphicon 		    glyphicon-chevron-down") {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
		} else {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
		}

	}
	function downArrow2() {
		var obj = document.getElementById("arrow2");
		if (obj.className == "glyphicon 		    glyphicon-chevron-down") {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
		} else {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
		}

	}
	function downArrow3() {
		var obj = document.getElementById("arrow3");
		if (obj.className == "glyphicon 		    glyphicon-chevron-down") {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
		} else {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
		}

	}
	function downArrow4() {
		var obj = document.getElementById("arrow4");
		if (obj.className == "glyphicon 		    glyphicon-chevron-down") {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
		} else {
			obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
		}

	}
</script>
</head>

<body>
	<!--顶部-->
	<div class="above">
		<!--顶端左边-->
		<div style="float:left">
			<button type="button" class="btn btn-primary btn-lg"
				style="font-size: 23px;background-color:#3CF;border:0">
				<span class="glyphicon glyphicon-home"></span> <label
					style="border:0">欣创管理控制台</label>
			</button>
		</div>

		<!--顶端右边-->
		<div style="float:left;margin-left:60%">
			<button type="button" class="btn btn-primary btn-lg"
				style="font-size: 25px;background-color:#3CF;border:0">
				<span class="glyphicon glyphicon-bell"></span> <span
					class="label label-danger">12</span>
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="dropdown"
				style="font-size: 28px;background-color:#3CF"> <a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> HK <b
					class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#">退出</a></li>
				</ul>
			</label>
		</div>
	</div>
	<!--内容部分-->
	<div class="content">
		<!--左边导航部分-->

		<div class="left">
			<button type="button" class="btn btn-primary" data-toggle="collapse"
				data-target="#demo1"
				style="width:200px;background-color:#666;border:0;text-align:left;border:0"
				onClick="downArrow1();">
				<span id="arrow1" class="glyphicon glyphicon-chevron-up"></span>&nbsp;&nbsp;&nbsp;&nbsp;基本信息管理
			</button>

			<div id="demo1" class="collapse">
				<a href="#" class="list-group-item"
					style="background-color:#666;color:#FFF;border:0;margin-left:23px">用户信息</a>
				<a href="#" class="list-group-item"
					style="background-color:#666;color:#FFF;border:0;margin-left:23px">项目信息</a>
			</div>



			<button type="button" class="btn btn-primary" data-toggle="collapse"
				data-target="#demo2"
				style="width:200px;background-color:#666;border:0;text-align:left"
				onClick="downArrow2();">
				<span id="arrow2" class="glyphicon glyphicon-chevron-up"></span>&nbsp;&nbsp;&nbsp;&nbsp;事务管理
			</button>

			<div id="demo2" class="collapse">
				<a href="#" class="list-group-item"
					style="background-color:#666;color:#FFF;border:0;margin-left:23px">项目申请</a>
				<a href="#" class="list-group-item"
					style="background-color:#666;color:#FFF;border:0;margin-left:23px">发布公告</a>
			</div>


			<button type="button" class="btn btn-primary" data-toggle="collapse"
				data-target="#demo3"
				style="width:200px;background-color:#666;border:0;text-align:left"
				onClick="downArrow3();">
				<span id="arrow3" class="glyphicon glyphicon-chevron-up"></span>&nbsp;&nbsp;&nbsp;&nbsp;权限管理
			</button>

			<button type="button" class="btn btn-primary" data-toggle="collapse"
				data-target="#demo4"
				style="width:200px;background-color:#666;border:0;text-align:left"
				onClick="downArrow4();">
				<span id="arrow4" class="glyphicon glyphicon-chevron-up"></span>&nbsp;&nbsp;&nbsp;&nbsp;系统设置
			</button>

			<button type="button" class="btn btn-primary" data-toggle="collapse"
				data-target="#demo5"
				style="width:200px;background-color:#666;border:0;text-align:left"
				onClick="downArrow5();">
				<span id="arrow5" class="glyphicon glyphicon-chevron-up"></span>&nbsp;&nbsp;&nbsp;&nbsp;反馈中心
			</button>

		</div>
		<!--右边内容显示部分-->
		<div class="right">
			<div
				style="width:1000px;height:500px;border:10px;border-color:rgb(245,245,245)">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#needToDeal" data-toggle="tab" style="font-size:20px">
							待处理信息 </a></li>
					<li style="font-size:20px"><a href="#alreaderDeal" data-toggle="tab" >已处理信息</a></li>

				</ul>

				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="needToDeal">
						<!--留言框  -->
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">小明</h3>
							</div>
							<div class="panel-body">
								<p style="font-size:17px">为什么我登陆进去不能承接项目啊？？？</p>
								<textarea class="form-control" rows="3"></textarea>
								<button type="button" class="btn btn-primary"
									style="margin-top:10px;width:80px">发送</button>
							</div>
						</div>
						<!--留言框  -->
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">小明</h3>
							</div>
							<div class="panel-body">
								<p style="font-size:17px">为什么我登陆进去不能承接项目啊？？？</p>
								<textarea class="form-control" rows="3"></textarea>
								<button type="button" class="btn btn-primary"
									style="margin-top:10px;width:80px">发送</button>
							</div>
						</div>
						<!--留言框  -->
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">小明</h3>
							</div>
							<div class="panel-body">
								<p style="font-size:17px">为什么我登陆进去不能承接项目啊？？？</p>
								<textarea class="form-control" rows="3"></textarea>
								<button type="button" class="btn btn-primary"
									style="margin-top:10px;width:80px">发送</button>
							</div>
						</div>


					</div>



					<div class="tab-pane fade" id="alreaderDeal">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">小明</h3>
							</div>
							<div class="panel-body">
								<p>为什么我登陆进去不能承接项目啊？？？</p>
								管理员： <span>因为你傻啊！！！</span>
							</div>
						</div>
					</div>

				</div>

			
			
			<!-- 分页	 -->
			<div >
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
			</div>
			</div>


			
			
			<!-- 右边div的结束位置 -->
		</div>

	</div>

</body>
</html>
