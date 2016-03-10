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
<html>
<link rel="stylesheet" href="bootstrap.css">
	<nav class="navbar navbar-inverse">
  	<div class="container-fluid">
    	<div class="navbar-header">
      	<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        	<span class="sr-only">Toggle navigation</span>
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span>
      	</button>
      	<a class="navbar-brand" href="home.jsp"><img src="texas_instruments_logo_2852.gif" alt="HTML5 Icon" style="width:128px;height:48px;"</img></a>
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
        <div class="panel-heading">
    	<h3 class="panel-title"><h1>${fn:escapeXml(date)}</h1><h2>${fn:escapeXml(confID)}</h2>${fn:escapeXml(confResult)}</h3>
  	    </div>
  	    <%
        //}
        
    %>
    
    
    
    
       
	
</html>