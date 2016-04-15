<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
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

	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
	.bs-example{
		margin: 20px;
	}
</style>

</head>

<body>
	<div style="padding-top:5px"></div><a><img src="img/ti_logo_with_text.png" alt="TI Logo" style="width:200px;"></img><a>

	<h3 class="title">
		<span>Adding website icon to your homescreen</span>
	</h3>
	<hr class="half-bottom">

	<h4>iPhone/iPad </h4>
	
	<p>
		<strong>1.</strong>
		 In safari, visit the website.

		 <p><img src="img/screen_1.jpg" style="width:200px;"></img></p>
	</p>

	<p>
		<strong>2.</strong>
		 Select the share button at the bottom of your screen represented by a square and up arrow.
	</p>

	<p>
		<strong>3.</strong>
		 Select 
		 <i>Add to home screen</i> 
		 option. If necessary, scroll to the right to find it. 

		 <p><img src="img/screen_2.jpg" style="width:200px;"></img></p>
	</p>

	<p>
		<strong>4.</strong>
		 Now the 
		 <i>Add to Home screen</i> 
		 should be displayed. This shows the icon, title, and website url for the website. The title can be changed if you desire or left as the default title. Once you are done, select the 
		 <i>Add</i> 
		 button at the top right.

		 <p><img src="img/screen_3.jpg" style="width:200px;"></img> </p>
	</p>

	<p>
		<strong>5.</strong>
		 You should be now taken to the IOS home screen where your new icon will be visible.

		 <p><img src="img/screen_4.jpg" style="width:200px;"></img> </p>
	</p>

	<hr class="half-bottom">

	<h4>Android </h4>
	
	<p>
		<strong>1.</strong>
		 In the web browser, visit the website.
	</p>

	<p>
		<strong>2.</strong>
		 Select the menu button.
	</p>

	<p>
		<strong>3.</strong>
		 Select 
		 <i>Add to home screen</i>.
	</p>

	<p>
		<strong>4.</strong>
		 In the next screen you will be prompted to enter a name for your shortcut. Once you are done, select the
		 <i>Add</i> 
		 button. 
	</p>

	<p>
		<strong>5.</strong>
		 The browser will now add the icon to your homescreen. 
	</p>

</body>