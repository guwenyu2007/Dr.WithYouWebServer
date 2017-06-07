<!doctype html>
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
    
    <!-- flotr2 - js lib for line chart -->

    
    <style type="text/css">
        #containerplot {
         height:500px;
         width:800px;
         margin: 8px auto}        
    </style>
    
    <script type="text/javascript">
		function add(usr){		
			
			//alert($('#select option:selected').val());
			
		    $.ajax({
                 type: "post",
                 url: "data",
                 data: {usr: usr,
                	    cid: $('#select option:selected').val()},//提交表单，相当于CheckCorpID.ashx?ID=XXX
                 contentType: "application/x-www-form-urlencoded; charset=utf-8", 
                 success: function(str){
                	 		//alert(json);
                	 	   var data = [];
                	       var json = eval('(' + str + ')'); 
                	       for(var i = 0; i < json.length; i ++){ 
                	    	   //alert(json[i].value); 
                	    	   //alert(json[i].day); 
                	    	   data.push([parseInt(json[i].day), parseFloat(json[i].value)]);
                	       } 
                	 		
                	       alert(data);
                	       drawChart(data);
                	    }
                }); 
		}
		
		function drawChart(data){
			  var container = document.getElementById("containerplot");
				
		      var option = {
		    		  xaxis: {
		    		      minorTickFreq: 4
		    		    },
		    		    grid: {
		    		        minorVerticalLines: true
		    		      }
		         };
			      
			     // Draw Graph
			     Flotr.draw(container, data, option);
			
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
                <a href="#" class="simple-text">
                   	 医路相随
                </a>
            </div>

            <ul class="nav">
                 
                <li class="active">
                    <a href="bingren.html">
                        <i class="ti-user"></i>
                        <p>病人管理</p>
                    </a>
                </li>
                 <li >
                    <a href="bingqing.html">
                        <i class="ti-view-list-alt"></i>
                        <p>病情管理</p>
                    </a>
                </li>
                <li>
                    <a href="moban.html">
                        <i class="ti-panel"></i>
                        <p>模版管理</p>
                    </a>
                </li>
                  <li>
                    <a href="jianchaxiang.html">
                        <i class="ti-pencil-alt2"></i>
                        <p>检查项设置</p>
                    </a>
                </li>
             
            </ul>
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
                    <a class="navbar-brand" >用户信息</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="xiugaixinxi.html">
                                <i class="ti-settings"></i>
                                <p>修改信息</p>
                            </a>
                        </li>
                         <li>
                            <a href="xiugaitouxiang.html">
                                <i class="ti-panel"></i>
                                <p>修改头像</p>
                            </a>
                        </li>
                         <li>
                            <a href="xiugaimima.html">
                                <i class="ti-bell"></i>
                                <p>修改密码</p>
                            </a>
                        </li>
                         <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <p>退出</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

        <br><br>
        
        <!--  <div class="col-md-4">
           <div class="form-group">
                <label>开始时间</label>
                  <input type="date" class="form-control border-input" value="陈翠花">
           </div>
         </div>
          <div class="col-md-4">
               <div class="form-group">
                   <label>结束时间</label>
                       <input type="date" class="form-control border-input" placeholder="Username" value="女">
                </div>
          </div>
           -->
           
          <% Map map = (Map)request.getAttribute("map"); %>

           <div class="col-md-4">
                  <div class="form-group">
                      <label>检查项</label>
                 <select id="select" class="form-control border-input" style="position:absolute；left：400px">
                 
                 <% 

                    Set set = map.keySet();
                    Iterator<Integer> iter = set.iterator();  
					
					while (iter.hasNext()) {  
						int cid = iter.next();
				%>		
				    <option value ="<%= cid %>"><%= map.get(cid) %></option>
				
				<%} %>
                  </select>
                </div>
           </div>
           
           <% String usr = (String)request.getAttribute("usr"); %>
          
           <button style="margin:1px 0 0 650px" class="btn btn-info btn-fill btn-wd" onclick="add('<%= usr%>')">确认</button>
          
          
          </br></br> 
         
                                                                
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">

                                <h4 class="title">病人数据</h4>
                                <p class="category">一周变化</p>
                            </div>
                            <div id="containerplot"></div>
                        </div>
                    </div>
                </div>
            </div>
 
</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	
	<script src="assets/js/flotr2.js"></script>
    <script src="assets/js/flotr2.min.js"></script>

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
	
</html>
