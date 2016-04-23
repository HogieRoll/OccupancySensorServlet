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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/mycss2.css">	

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
<script type="text/javascript">
    function OpenLink(theLink){
        window.location.href = theLink.href;
    }
</script>
    <style type="text/css">
	.bs-example{
		margin: 20px;
	}
    </style>
    </head>
    
<body>

<div style="padding-top:5px"></div><a href="home.jsp" onclick="OpenLink(this); return false"><img src="img/ti_logo_with_text.png" alt="TI Logo" style="width:200px;"></img></a>
<div style="margin:10px; margin-top:-5px"><h3>Conference Room Occupancy </h3></div>
<%response.setIntHeader("Refresh", 10);%>
<div id="container" style="margin-left:-20px; margin-top:-15px;" class="col-sm-12 col-md-8 col-lg-6 col-xs-12">
    <div class="bs-example">
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a data-toggle="tab" href="#Latency">Latency Errors</a></li>
    </ul>
    <div class="tab-content">
        <div id="Latency" class="tab-pane fade in active">
        <div id="occupancytable">
        <table class="table table-bordered table-striped table-hover " style="width:100%">
		<thead>
		  <tr>
			<th>Room</th>
			<th>TimeStamp Delta</th>
		  </tr>
		</thead>
        <%
        response.setIntHeader("Refresh", 10);
        Date d=new Date();
        long currentTimeNS=d.getTime();
        
        String confList[]={ "A01","A02","A03","A04","A05",
        					"B01","B02","B03","B04","B05",
        					"C01","C02","C03","C04","C05",
        					"D01","D02","D03","D04","D05",
        					"E01","E02","E03","E04","E05"};
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        for(int i=0;i<confList.length;i++)
        {
        Key postKey = KeyFactory.createKey(confList[i], confList[i]);
        
        Query query = new Query("SensorData", postKey).addSort("date", Query.SortDirection.DESCENDING);
        List<Entity> updates = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(100));
        Entity Update=updates.get(0);
        long diffMS=(currentTimeNS)-(Long.parseLong(Update.getProperty("date").toString()));
        long diffS=diffMS/1000;
        long days=diffS/86400; diffS=diffS%86400;
        long hours=diffS/3600; diffS=diffS%3600;
        long min=diffS/60; diffS=diffS%60;
        String dayText,hourText,minText,secText;
        dayText=hourText=minText=secText="";
        if(days>0)
        {dayText=" "+Long.toString(days)+" day(s)";}
        if(hours>0)
        {dayText=" "+Long.toString(hours)+" hour(s)";}
        if(min>0)
        {minText=" "+Long.toString(min)+" min(s)";}
        secText=" "+Long.toString(diffS)+" sec";
        System.out.println(dayText+hourText+minText+secText);
        pageContext.setAttribute("confID",confList[i]);
        pageContext.setAttribute("timeDiff", dayText+hourText+minText+secText);
        if(diffMS>120000)
        {
        %>
	        <tbody>
	            <td>${fn:escapeXml(confID)}</td>
				<td>${fn:escapeXml(timeDiff)}</td>
	        </tbody>
        <%
        }
        }%>
        </table>
        </div>	
        </div>
</div>
</div>
	
</div> <!-- end of div: container -->
 </body>    
       
</html>