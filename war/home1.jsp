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
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        localStorage.setItem('activeTab', $(e.target).attr('href'));
    });
    var activeTab = localStorage.getItem('activeTab');
    if(activeTab){
        $('#myTab a[href="' + activeTab + '"]').tab('show');
    }
});
</script>
    <style type="text/css">
	.bs-example{
		margin: 20px;
	}
    </style>
    </head>
<body>

<div style="margin:2%"><h3>TI Conference Room Occupancy </h3></div>
<%response.setIntHeader("Refresh", 5);%>
<div id="container" style="margin:1%" class="col-md-6">
    <div class="bs-example">
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a data-toggle="tab" href="#wingA">Wing A</a></li>
        <li><a data-toggle="tab" href="#wingB">Wing B</a></li>
        <li><a data-toggle="tab" href="#wingC">Wing C</a></li>
        <li><a data-toggle="tab" href="#wingD">Wing D</a></li>
        <li><a data-toggle="tab" href="#wingE">Wing E</a></li>
        <li><a data-toggle="tab" href="#wingF">Wing F</a></li>
        <li><a data-toggle="tab" href="#wingG">Wing G</a></li>
    </ul>
    <div class="tab-content">
        <div id="wingA" class="tab-pane fade in active">
        <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        <%
        response.setIntHeader("Refresh", 5);
        String confListA[]={"A01","A02","A03","A04","A05"};
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListA[i], confListA[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("date", Update.getProperty("date"));
        %>
        <tbody>
            <td>${fn:escapeXml(confID)}</td>
			<td>${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(date)}</td>
        </tbody>
        <%}%>
        </table>
        </div>	
        </div>
  
  <div id="wingB" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        <%
        response.setIntHeader("Refresh", 5);
        String confListB[]={"B01","B02","B03","B04","B05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListB[i], confListB[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("date", Update.getProperty("date"));
        %>
        <tbody>
            <td>${fn:escapeXml(confID)}</td>
			<td>${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(date)}</td>
        </tbody>
        <%}%>
        </table>
    </div>
  </div>
  <div id="wingC" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
                <%
        response.setIntHeader("Refresh", 5);
        String confListC[]={"C01","C02","C03","C04","C05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListC[i], confListC[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("date", Update.getProperty("date"));
        %>
        <tbody>
            <td>${fn:escapeXml(confID)}</td>
			<td>${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(date)}</td>
        </tbody>
        <%}%>
        </table>
    </div>
  </div>
  <div id="wingD" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
                <%
        response.setIntHeader("Refresh", 5);
        String confListD[]={"D01","D02","D03","D04","D05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListD[i], confListD[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("date", Update.getProperty("date"));
        %>
        <tbody>
            <td>${fn:escapeXml(confID)}</td>
			<td>${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(date)}</td>
        </tbody>
        <%}%>
        </table>
    </div>
  </div>
  <div id="wingE" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
                <%
        response.setIntHeader("Refresh", 5);
        String confListE[]={"E01","E02","E03","E04","E05"};
        
        for(int i=0;i<5;i++)
        {
        Key postKey = KeyFactory.createKey(confListE[i], confListE[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        pageContext.setAttribute("confResult",Update.getProperty("content"));
        pageContext.setAttribute("confID",Update.getProperty("sensorID"));
        pageContext.setAttribute("date", Update.getProperty("date"));
        %>
        <tbody>
            <td>${fn:escapeXml(confID)}</td>
			<td>${fn:escapeXml(confResult)}</td>
			<td>${fn:escapeXml(date)}</td>
        </tbody>
        <%}%>
        </table>
    </div>
  </div>
  <div id="wingF" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        </table>
    </div>
  </div>
  <div id="wingG" class="tab-pane fade">
    <div id="occupancytable">
        <table class="table table-hover table-bordered table-striped" style="width:90%">
		<thead>
		  <tr>
			<th>Room Number</th>
			<th>Occupancy</th>
			<th>Timestamp</th>
		  </tr>
		</thead>
        </table>
    </div>
  </div>
</div>
</div>
	
</div> <!-- end of div: container -->	
 </body>
    
    
       
</html>