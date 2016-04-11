package sensorhandler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;

import javax.servlet.http.*;

import org.mortbay.util.ajax.JSON;
import org.json.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class OccupancySensorServletServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.sendError(resp.SC_ACCEPTED);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		resp.getWriter().println("Post Request Sent");
		
		BufferedReader br = new BufferedReader(new  InputStreamReader(req.getInputStream()));
		String json="";
		while(br.ready())
		{
			json+=br.readLine();
		}
		
		JSONObject jsonObj=new JSONObject(json);
        //Key guestbookKey = KeyFactory.createKey("SensorInfo", "Sensor");
		Key guestbookKey = KeyFactory.createKey(jsonObj.getString("SensorID"), jsonObj.getString("SensorID"));
        
		
        Entity SensorData = new Entity("SensorData", guestbookKey);
        Date d=new Date();
        
        
        
        String fixedOutput;
        if (jsonObj.get("Reading").equals("Not Occupied"))
        	fixedOutput = "Available";
        else fixedOutput = "Occupied";
        System.out.println("fixed: " + fixedOutput);
        //look at jsonObj.get("Reading")
        //if string value of that object is not occupied->available
        //else ->unavailable
        //SensorData.setProperty("content", jsonObj.get("Reading"));
        SensorData.setProperty("content", fixedOutput);
        SensorData.setProperty("sensorID", jsonObj.get("SensorID"));
        SensorData.setProperty("date",d.getTime());
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        datastore.put(SensorData);
 
	}
	
}
