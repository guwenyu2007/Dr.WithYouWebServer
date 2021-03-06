﻿<!doctype html>
<%@page import="java.util.*"%>
<%@page import="model.Checklist"%>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>医路相随</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
    <link href='css/css.css' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
    
     <script type="text/javascript">
		function edit(patientName){	
			
			var id_array = new Array();  
			$("input[type='checkbox']").each(function(){  
				
				if ($(this).prop('checked')== true){
					 id_array.push($(this).attr('id'));//向数组中添加元素  
				}   
			});  
			
			//alert(id_array);
			
		    $.ajax({
                 type: "get",
                 url: "savePatientChecklist",
                 data: {username: patientName,
                	    array: JSON.stringify(id_array)},//提交表单，相当于CheckCorpID.ashx?ID=XXX
                 contentType: "application/x-www-form-urlencoded; charset=utf-8", 
                 success: function(msg){
                	    alert(msg); window.location.href = "patientCheckpoint"}
                }); 
		}
	
	</script>

</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a  class="simple-text">
                    医路相随
                </a>
            </div>

            <ul class="nav">
               
               <li>
                    <a href="UserManage">
                        <i class="ti-user"></i>
                        <p>病人管理</p>
                    </a>
                </li>
                 <li>
                    <a href="patientCheckpoint">
                        <i class="ti-view-list-alt"></i>
                        <p>病情管理</p>
                    </a>
                </li>
                <li >
                    <a href="templet">
                        <i class="ti-panel"></i>
                        <p>模版管理</p>
                    </a>
                </li>
                  <li >
                    <a href="checklist">
                        <i class="ti-pencil-alt2"></i>
                        <p>检查项设置</p>
                    </a>
                </li>
	
        
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">

                        <li>
                            <a href="#">
                                <i class="ti-settings"></i>
                                <p>设置</p>
                            </a>
                        </li>
                         <li>
                             <a href="logout" >
                                <i class="ti-panel"></i>
                                <p>退出</p>
                            </a>
                        </li>
						
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">检查项列表</h4> <br />
                                
                            </div>

                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                         <th>是否选择</th>
                                        <th>检查项名称</th>
                                        <th>检查时间</th>
                                        <th>描述</th>   
                                    </thead>
                                    <tbody>
                                    
                                    <% String patientName = (String)request.getAttribute("patientName"); %>
                                    <% ArrayList<Checklist> list = (ArrayList<Checklist>)request.getAttribute("list"); %>
                                    <% ArrayList<Integer> patientCheckList = (ArrayList<Integer>)request.getAttribute("patientCheckList"); %>
                                    <%
                                    	if(list != null){
	                                    	Iterator<Checklist> iter = list.iterator(); 
											while(iter.hasNext()) { 									
												Checklist c = (Checklist)iter.next();
								    %>
                                    
                                        <tr>
                                            <td><input type="checkbox" id=<%= c.getCid() %> <% if(patientCheckList.contains(c.getCid())){ %> checked="checked" <% } %>/></td>
                                            <td><%= c.getChecklist_name() %></td>
                                            <td><%= c.getChecktime() %></td>
                                            <td><%= c.getDescription() %></td>
                                        </tr>
                                    <% }} %>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="text-center">
                            <input type="button" class="btn btn-info btn-fill btn-wd" value="确认修改" onclick="edit('<%= patientName %>')">
                            </div>
                        </div>
                    </div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){

           

          
        });
    </script>

</html>
