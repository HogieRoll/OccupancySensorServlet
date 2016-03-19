<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html  lang="en">
  <head>
	<link rel="shortcut icon" type="image/png" href="img/ti_logo.png"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
	
	<link rel="apple-touch-icon"
		  href="img/apple_ti_logo.png" />
	<link rel="apple-touch-icon-precomposed"
		  href="img/android_ti_logo.png" />
		  
	<!-- Android icons -->
	<link href="img/android_ti_logo.png" rel="icon" sizes="192x192" />
	
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>TI Conference Room Occupancy</title>
	
	

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/mycss.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	
  </head>
<body>

<link rel="stylesheet" href="bootstrap.css">
<!--
	<nav class="navbar">
  	<div class="container-fluid">
    	<div class="navbar-header">
      	<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        	<span class="sr-only">Toggle navigation</span>
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span>
      	</button>
      	<a class="navbar-brand" href="boostrapexample.html"><img src="img/ti_logo.jpg" alt="HTML5 Icon" style="width:60px;height:48px;"</img></a>
    	</div>

    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      	<ul class="nav navbar-nav">
        	<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        	<li><a href="#">Link</a></li>
        	<li class="dropdown">
          	<a class="dropdown-toggle" role="button" aria-expanded="false" href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
          	<ul class="dropdown-menu" role="menu">
            	<li><a href="#">Action</a></li>
            	<li><a href="#">Another action</a></li>
            	<li><a href="#">Something else here</a></li>
            	<li class="divider"></li>
            	<li><a href="#">Separated link</a></li>
            	<li class="divider"></li>
            	<li><a href="#">One more separated link</a></li>
          	</ul>
        	</li>
      	</ul>
      	<form class="navbar-form navbar-left" role="search">
        	<div class="form-group">
          	<input class="form-control" type="text" placeholder="Search">
        	</div>
        	<button class="btn btn-default" type="submit">Submit</button>
      	</form>
      	<ul class="nav navbar-nav navbar-right">
        	<li><a href="#">Link</a></li>
      	</ul>
    	</div>
  	</div>
	</nav>
 -->	

<div style="margin:2%"><h3>TI Conference Room Occupancy </h3></div>
	
<div id="container" style="margin:1%" class="col-md-6">

<div class="tabbable">
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#wingA">Wing A</a></li>
  <li><a data-toggle="tab" href="#wingB">Wing B</a></li>
  <li><a data-toggle="tab" href="#wingC">Wing C</a></li>
  <li><a data-toggle="tab" href="#wingD">Wing D</a></li>
  <li><a data-toggle="tab" href="#wingE">Wing E</a></li>
  <li><a data-toggle="tab" href="#wingF">Wing F</a></li>
  <li><a data-toggle="tab" href="#wingG">Wing G</a></li>
  <li><a data-toggle="tab" href="#wingH">Wing H</a></li>
</ul>
<div class="tab-content">
  <div id="wingA" class="tab-pane fade in active">
	<div id="occupancytable"> 
<!--
		<table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
			<td>A13</td>
			<td><occupiedred>Occupied</occupiedred></td>
		  </tr>
		  <tr>
			<td>A17</td>
			<td><vacantgreen>Empty</vacantgreen></td>
		  </tr>
		  <tr>
			<td>B14</td>
			<td><occupiedred>Occupied</occupiedred></td>
		  </tr>
		</tbody>
	  </table>
-->	  
	      <%
        //String confList[]={"C01","C02","C03","C04","C05"};
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        //for(int i=0;i<5;i++)
        //{
        Key postKey = KeyFactory.createKey("C01", "C01");
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("date", Update.getProperty("date"));
        %>
<!-- <div class="panel-heading">
    		<h3 class="panel-title"><h1>${fn:escapeXml(date)}</h1><h2>${fn:escapeXml(confID)}</h2>${fn:escapeXml(confResult)}</h3>
  	    </div>
 --> 	    
  	    <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
			<td>${fn:escapeXml(confID)}</td>
			<td>${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(date)}</td>
		  </tr>
		</tbody>
	  </table>
  </div>	
  </div>
  
  <div id="wingB" class="tab-pane fade">
    <h3>Wing B</h3>
  </div>
  <div id="wingC" class="tab-pane fade">
    <h3>Wing C</h3>
    <p>Some content in Wing C.</p>
  </div>
  <div id="wingD" class="tab-pane fade">
    <h3>Wing D</h3>
  </div>
  <div id="wingE" class="tab-pane fade">
    <h3>Wing E</h3>
  </div>
  <div id="wingF" class="tab-pane fade">
    <h3>Wing F</h3>
  </div>
  <div id="wingG" class="tab-pane fade">
    <h3>Wing G</h3>
  </div>
  <div id="wingH" class="tab-pane fade">
    <h3>Wing H</h3>
  </div>	
	
</div> <!-- end of div: tab-content -->
</div> <!-- end of div: tabbable -->	
</div> <!-- end of div: container -->	



   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="js/bootstrap.min.js"></script>
 </body>    
    
    
    
       
	
</html>