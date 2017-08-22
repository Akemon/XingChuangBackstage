<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="css/bootstrap.min.css"
    type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet"
    href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="jquery/jquery-1.11.1.js"></script>
  <style type="text/css">
  .above{
  	height:60px;
	background-color:#3CF;
  }
  .content{
  	width:100%;
	height:100%;
  }
  .left{
  	width:200px;
	height:100%;
	position:absolute;
	background-color:#666;
	float:left;
  }
  .right{
  	float:left;
	margin-left:200px;
  }
  </style>
  <script type="text/javascript">
  	function downArrow1(){
		 var obj = document.getElementById("arrow1");
		 if(obj.className=="glyphicon 		    glyphicon-chevron-down"){
		 obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
		 }else{
		  obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
		 }
 		
	}
	function downArrow2(){
		 var obj = document.getElementById("arrow2");
		 if(obj.className=="glyphicon 		    glyphicon-chevron-down"){
		 obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
		 }else{
		  obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
		 }
 		
	}
    function downArrow3(){
    var obj = document.getElementById("arrow3");
    if(obj.className=="glyphicon 		    glyphicon-chevron-down"){
    obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
    }else{
    obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
    }

    }
    function downArrow4(){
    var obj = document.getElementById("arrow4");
    if(obj.className=="glyphicon 		    glyphicon-chevron-down"){
    obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-up");
    }else{
    obj.setAttribute("class", "glyphicon 		    glyphicon-chevron-down");
    }

    }
  	
  </script>
  <script type="text/javascript">
		//页面加载时立即执行的函数
		$(document).ready(function(){
    			asyTableData();
        });
		//加载表格的异步函数
		function asyTableData(){
	    $("#content").empty();
        $.ajax({
        	type:'POST',
        	url:'getStudentInfo',
       		data:{
       		pageNumber:$("#pageNumber").html(),
        	pageSize:$('#pageSize').val(),
        	searchString:$('#searchString').val()
        	},
        success:function(data){
        $.each(data.listInformation,function(index,item){
        var stuNickName =item.stuNickName;
        var stuSex =item.stuSex;
        var stuMail =item.stuMail;
        var stuPhone =item.stuPhone;
        var stuSchool =item.stuSchool;
		var stuCharacSigna =item.stuCharacSigna;
        var stuVerifyQuestion =item.stuVerifyQuestion;
		var stuVerifyAnswer =item.stuVerifyAnswer;
		var stuPoints =item.stuPoints;
		var userName =item.userName;
		var updateTime =item.updateTime;
        var modifyButtonClass ='modify'+index;
        var deleteButtonClass ='delete'+index;
        var trCss ='tr'+index;
        $("#content").append("<tr class="+trCss+"> </tr>");
        $("tr:last").append("<td class='td1'>"+stuNickName+"</td>");
        $("tr:last").append("<td class='td2'>"+stuSex+"</td>");
        $("tr:last").append("<td class='td3'>"+stuMail+"</td>");
        $("tr:last").append("<td class='td4'>"+stuPhone+"</td>");
        $("tr:last").append("<td class='td5'>"+stuSchool+"</td>");
        $("tr:last").append("<td class='td6'>"+stuCharacSigna+"</td>");
		$("tr:last").append("<td class='td7'>"+stuVerifyQuestion+"</td>");
		$("tr:last").append("<td class='td8'>"+stuVerifyAnswer+"</td>");
		$("tr:last").append("<td class='td9'>"+stuPoints+"</td>");
		$("tr:last").append("<td class='td10'>"+userName+"</td>");
		$("tr:last").append("<td class='td11'>"+updateTime+"</td>");
        $("tr:last").append("<td></td>");
        $("td:last").append("<button id ="+modifyButtonClass+" type='button' class='btn btn-default' data-toggle='modal' data-target='#modifyModel' onclick='modifyData(this.id)'><span class='glyphicon glyphicon-pencil'></button>");
        $("tr:last").append("<td></td>");
        $("td:last").append("<button id ="+deleteButtonClass+" type='button' class='btn btn-default' data-toggle='modal' data-target='#deleteModel'  onclick='deleteData(this.id)'><span class='glyphicon glyphicon-trash'></span></button>");

        });

       //设置总页数
    $("#allDataNumber").html(data.allDataNumber);


       },dataType:'json'
        });
		}

    //修改数据的异步函数
    function asyModifyInfo(){
            $.ajax({
                type:'POST',
                url :'ModifyStudentInfo',
                data: {
						stuNickName:$("#stuNickName").val(),
						stuSex	:$("#stuSex").val(),
						stuMail	:$("#stuMail").val(),
						stuPhone:$("#stuPhone").val(),
						stuSchool:$("#stuSchool").val(),
						stuPoints:$("#stuPoints").val(),
						userName:$("#userName").val()
                },
            success:function(data){
                    var targetTrCss =$("#modifyButtonClickTrCss").val();
                    //修改表格
                    var targetTr =$("tr."+targetTrCss);
                    targetTr.find("td.td1").html($("#stuNickName").val());
                    targetTr.find("td.td2").html($("#stuSex").val());
                    targetTr.find("td.td3").html($("#stuMail").val());
                    targetTr.find("td.td4").html($("#stuPhone").val());
                    targetTr.find("td.td5").html($("#stuSchool").val());
                    targetTr.find("td.td9").html($("#stuPoints").val());

            }

            })


    }
    function asyDeleteInfo(){
    $.ajax({
    type:'POST',
    url :'DeleteStudentInfo',
    data: {
    userName:$("#userName").val(),
    },
    success:function(data){
    var targetTrCss =$("#DeleteButtonClickTrCss").val();
    //删除表格行
    $("tr."+targetTrCss).remove();

    }

    })
    }


    
	function priviousPage() {
		var currentPage = $("#pageNumber").html();
		if (currentPage == '1') {
			alert("当前已经是第1页");
			return;
		}
		$("#pageNumber").html(currentPage - 1);
		asyTableData();
	}

	function nextPage() {
		var allDataNumber = $("#allDataNumber").html();
		var currentPage = $("#pageNumber").html();
		var pageSize = $("#pageSize").val();
		if (currentPage * pageSize >= allDataNumber) {
			alert("当前已经是最后一页");
			return;
		}
		$("#pageNumber").html(currentPage * 1 + 1);
		asyTableData();
	}

	
	function changePageNum() {
		var reg = new RegExp("^[0-9]*$");
		var toPage = $("#toPageNum").val();
		var pageSize = $("#pageSize").val();
		var max = $("#allDataNumber").html();
		var min = '0';
		if (toPage * pageSize > max * 1 || min * 1 >= toPage * 1) {
			alert("超出范围！！！");
			$("#toPageNum").val("");
			return;
		}
		if (!reg.test(toPage)) {
			alert("请输入数字！！！");
			$("#toPageNum").val("");
			return;
		}
		$("#pageNumber").html(toPage);
		$("#toPageNum").val("");
		asyTableData();
	}

    function deleteData(id){
            var trContent =$("#"+id).parent().parent();
            //记录点击按钮下Tr的CSS
            $("#DeleteButtonClickTrCss").val(trContent.attr("class"));
			$("#userName").val(trContent.find("td.td10").html());
    }

	function changePageSize() {
		asyTableData();
	}

	function modifyData(id) {
		var trContent = $("#" + id).parent().parent();
		//记录点击按钮下Tr的CSS
		$("#modifyButtonClickTrCss").val(trContent.attr("class"));

		//获取值
		var stuNickName = trContent.eq(0).find("td.td1").text();
		var stuSex = trContent.eq(0).find("td.td2").text();
		var stuMail = trContent.eq(0).find("td.td3").text();
		var stuPhone = trContent.eq(0).find("td.td4").text();
		var stuSchool = trContent.eq(0).find("td.td5").text();
		var stuPoints = trContent.eq(0).find("td.td9").text();
	    var userName = trContent.eq(0).find("td.td10").text();
		$("#stuNickName").val(stuNickName);
		$("#stuSex").val(stuSex);
		$("#stuMail").val(stuMail);
		$("#stuPhone").val(stuPhone);
		$("#stuSchool").val(stuSchool);
		$("#stuPoints").val(stuPoints);
		$("#userName").val(userName);
	}
	
</script>
  
  
  </head>
  
  <body>
    	<%
  		String user =(String)session.getAttribute("user");
  		if(user==null){
  			out.println("<script> window.location.href='adminLogin.jsp'</script>");
  		}
  	 %>
  
<!--顶部-->
<div class="above">
    <!--顶端左边-->
    <div style="float:left">
        <button type="button" class="btn btn-primary btn-lg" style="font-size: 23px;background-color:#3CF;border:0">
            <span class="glyphicon glyphicon-home"></span>
            <label style="border:0">欣创管理控制台</label>
        </button>
    </div>

    <!--顶端右边-->
    <div style="float:left;margin-left:60%">
        <button type="button" class="btn btn-primary btn-lg" style="font-size: 25px;background-color:#3CF;border:0">
            <span class="glyphicon glyphicon-bell"></span>
            <span class="label label-danger">12</span>
        </button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label class="dropdown" style="font-size: 28px;background-color:#3CF">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
     			<%=user %>
                <b class="caret"></b>
            </a>
            <img src="image/headImage.jpg" style="width:70px;height:60px"/>
            <ul class="dropdown-menu">
                <li><a href="adminLogin.jsp">退出</a></li>
            </ul>
        </label>
    </div>
</div>
<!--内容部分-->
    <div class="content">
    <!--左边导航部分-->
    
    <div class="left">
    <button type="button" class="btn btn-primary" data-toggle="collapse"
    data-target="#demo1" style="width:200px;background-color:#666;border:0;text-align:left;border:0" onClick="downArrow1();">
    <span id="arrow1" class="glyphicon glyphicon-chevron-up" ></span>&nbsp;&nbsp;&nbsp;&nbsp;基本信息管理
    </button>

    <div id="demo1" class="collapse in" >
    <a href="studentInfo.jsp" class="list-group-item" style="background-color:#666;color:#FFF;border:0;margin-left:23px">学生信息</a>
    <a href="companyInfo.jsp" class="list-group-item" style="background-color:#666;color:#FFF;border:0;margin-left:23px">企业信息</a>
    </div>
    
    
    
    <button type="button" class="btn btn-primary" data-toggle="collapse"
    data-target="#demo2" style="width:200px;background-color:#666;border:0;text-align:left" onClick="downArrow2();">
    <span id="arrow2" class="glyphicon glyphicon-chevron-up" ></span>&nbsp;&nbsp;&nbsp;&nbsp;事务管理
    </button>

    <div id="demo2" class="collapse" >
    <a href="#" class="list-group-item" style="background-color:#666;color:#FFF;border:0;margin-left:23px">项目申请</a>
    <a href="#" class="list-group-item" style="background-color:#666;color:#FFF;border:0;margin-left:23px">发布公告</a>
    </div>


    <button type="button" class="btn btn-primary" data-toggle="collapse"
    data-target="#demo3" style="width:200px;background-color:#666;border:0;text-align:left" onClick="downArrow3();">
    <span id="arrow3" class="glyphicon glyphicon-chevron-up" ></span>&nbsp;&nbsp;&nbsp;&nbsp;权限管理
    </button>

    <button type="button" class="btn btn-primary" data-toggle="collapse"
    data-target="#demo4" style="width:200px;background-color:#666;border:0;text-align:left" onClick="downArrow4();">
    <span id="arrow4" class="glyphicon glyphicon-chevron-up" ></span>&nbsp;&nbsp;&nbsp;&nbsp;系统设置
    </button>

    <button type="button" class="btn btn-primary" data-toggle="collapse"
    data-target="#demo5" style="width:200px;background-color:#666;border:0;text-align:left" onClick="downArrow5();">
    <span id="arrow5" class="glyphicon glyphicon-chevron-up" ></span>&nbsp;&nbsp;&nbsp;&nbsp;反馈中心
    </button>

    </div>
    <!--右边内容显示部分-->
    <div class="right">
       	<!-- 搜索区域 -->
	<div class="row" style="padding-bottom: 20px;margin-top:20px;">
		<!-- 搜索框的长度为该行的3/4 -->
		<div class="col-md-9">
			<div class="input-group">
				<input id="searchString" value="" type="text" style="height:28px;"
					class="form-control" placeholder="请输入搜索关键字"> <span
					class="input-group-btn">
					<button type="button" class="btn btn-info" onclick="asyTableData()"
						onkeypress="Enter()">
						<span class="glyphicon glyphicon-search" aria-hidden="true" /> 搜索
					</button>
				</span>
			</div>
		</div>
	</div>

	<!-- 表格显示 -->
	<div class="row">
		<div class="col-md-12" style="margin-top:20px;">
			<div class="panel panel-info">
				<div class="panel-heading">学生用户数据</div>
				<table id="table"
					class="table table-striped table-bordered table-hover datatable">
					<thead id="tem">
						<th>昵称</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>联系方式</th>
						<th>学校</th>
						<th>个性签名</th>
						<th>密保问题</th>
						<th>密保答案</th>
						<th>积分</th>
					    <th>用户名</th>
						<th>更新时间</th>
						<th>修改</th>
						<th>删除</th>
					</thead>
					<tbody id="content">
						<tr class="tr">
							<td>15240065</td>
							<td>呵呵哒</td>
							<td>理科</td>
							<td>456</td>
							<td>计科</td>
							<td>小明</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 页面底部显示 -->
    <!-- 隐藏域 (用于记录当前点击的Tr的CSS) -->
    <input type="hidden" id ="modifyButtonClickTrCss" >
    <input type="hidden" id ="DeleteButtonClickTrCss" >



    <div style="float:left;margin-top:25px">
		<label> 每页显示 <select id="pageSize" onchange="changePageSize();"
			aria-controls="DataTables_Table_0" size="1"
			name="DataTables_Table_0_length" >
				<option value="2">2</option>
				<option value="3" selected="selected">3</option>
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="25">25</option>
				<option value="50">50</option>
				<option value="100">100</option>
		</select> 条记录
		</label> <label style="margin-left: 10px">总共有 </label> <span
			id="allDataNumber">57</span> <label>条数据 </label> <label
			style="margin-left: 10px"> 当前是第</label> <span id="pageNumber">1</span>页


	</div>

	<div style="width: 300px;height:100px;float: left;">

        <ul class="pager">
        <li><a onclick="priviousPage();">上一页</a></li>
        <li><a onclick="nextPage();">下一页</a></li>
        <li>跳转到</li>
        <input id="toPageNum" type="text" style="width: 40px">
        <button class="label label-info" style="font-size: 15px" onclick="changePageNum();">go</button>

        </ul>

	</div>

	<!-- 修改模态框 -->
	<div class="modal fade" id="modifyModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" >修改学生信息</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="stuNickName" class="col-sm-2 control-label">昵称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="stuNickName" >
							<p></p>
						</div>
					</div>

					<div class="form-group">
						<label for="stuSex" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="stuSex">
							<p></p>
						</div>
					</div>

        <div class="form-group">
        <label for="stuMail" class="col-sm-2 control-label">邮箱</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" id="stuMail">
        <p></p>
        </div>
        </div>

        <div class="form-group">
        <label for="stuPhone" class="col-sm-2 control-label">联系方式</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" id="stuPhone">
        <p></p>
        </div>
        </div>


        <div class="form-group">
        <label for="stuSchool" class="col-sm-2 control-label">学校</label>
        <div class="col-sm-10">
        <input type="text" class="form-control" id="stuSchool">
        <p></p>
        </div>
        </div>






	<div class="form-group">
	<label for="stuPoints" class="col-sm-2 control-label">积分</label>
	<div class="col-sm-10">
	<input type="text" class="form-control" id="stuPoints">
	<p></p>
	</div>
	</div>
	<!--用户名-->
		<input type="hidden" id="userName" >
		


				</div>
				<div class="modal-footer" style="margin-top:270px">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button  type="button" class="btn btn-primary" data-dismiss="modal" onclick="asyModifyInfo();">确定更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

    <!--删除模态框-->
    <div class="modal fade" id="deleteModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
    &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
    操作提示
    </h4>
    </div>
    <div class="modal-body">
    确定要删除吗？？？
    </div>
    <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
    </button>
    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="asyDeleteInfo()">
    确定
    </button>
    </div>
    </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>
       
       
       
       
	<!-- 右边内容div结束位置 -->
    </div>

</div>

</body>
</html>
