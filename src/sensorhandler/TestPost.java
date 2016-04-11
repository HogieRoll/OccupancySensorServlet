package sensorhandler;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.*;

import org.json.JSONObject;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class TestPost extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String json[]={ "{\n\"SensorID\":\"E01\",\n\"Reading\":\"Occupied\"\n}",
		        		"{\n\"SensorID\":\"E02\",\n\"Reading\":\"Occupied\"\n}",
		        		"{\n\"SensorID\":\"E03\",\n\"Reading\":\"Not Occupied\"\n}",
		        		"{\n\"SensorID\":\"E04\",\n\"Reading\":\"Not Occupied\"\n}",
						"{\n\"SensorID\":\"E05\",\n\"Reading\":\"Not Occupied\"\n}",
						"{\n\"SensorID\":\"D01\",\n\"Reading\":\"Occupied\"\n}",
		        		"{\n\"SensorID\":\"D02\",\n\"Reading\":\"Occupied\"\n}",
		        		"{\n\"SensorID\":\"D03\",\n\"Reading\":\"Not Occupied\"\n}",
		        		"{\n\"SensorID\":\"D04\",\n\"Reading\":\"Not Occupied\"\n}",
						"{\n\"SensorID\":\"D05\",\n\"Reading\":\"Not Occupied\"\n}",
						"{\n\"SensorID\":\"C01\",\n\"Reading\":\"Occupied\"\n}",
				        "{\n\"SensorID\":\"C02\",\n\"Reading\":\"Not Occupied\"\n}",
				        "{\n\"SensorID\":\"C03\",\n\"Reading\":\"Occupied\"\n}",
				        "{\n\"SensorID\":\"C04\",\n\"Reading\":\"Occupied\"\n}",
						"{\n\"SensorID\":\"C05\",\n\"Reading\":\"Occupied\"\n}",
						"{\n\"SensorID\":\"B01\",\n\"Reading\":\"Not Occupied\"\n}",
				        "{\n\"SensorID\":\"B02\",\n\"Reading\":\"Occupied\"\n}",
				        "{\n\"SensorID\":\"B03\",\n\"Reading\":\"Not Occupied\"\n}",
				        "{\n\"SensorID\":\"B04\",\n\"Reading\":\"Occupied\"\n}",
						"{\n\"SensorID\":\"B05\",\n\"Reading\":\"Occupied\"\n}",
                        "{\n\"SensorID\":\"A01\",\n\"Reading\":\"Occupied\"\n}",
				        "{\n\"SensorID\":\"A02\",\n\"Reading\":\"Occupied\"\n}",
				        "{\n\"SensorID\":\"A03\",\n\"Reading\":\"Not Occupied\"\n}",
				        "{\n\"SensorID\":\"A04\",\n\"Reading\":\"Not Occupied\"\n}",
						"{\n\"SensorID\":\"A05\",\n\"Reading\":\"Not Occupied\"\n}"};
		for(String s:json)
		{
			JSONObject jsonObj=new JSONObject(s);
	        Key guestbookKey = KeyFactory.createKey(jsonObj.getString("SensorID"), jsonObj.getString("SensorID"));
	        
	        Entity SensorData = new Entity("SensorData", guestbookKey);
	        Date d=new Date();
	        
	        String fixedOutput;
	        if (jsonObj.get("Reading").equals("Not Occupied"))
	        	fixedOutput = "Available";
	        else fixedOutput = "Occupied";
	        System.out.println("fixed: " + fixedOutput);
	        SensorData.setProperty("content", fixedOutput);
	        //SensorData.setProperty("content", jsonObj.get("Reading"));
	        SensorData.setProperty("sensorID", jsonObj.get("SensorID"));
	        SensorData.setProperty("date",d.getTime());
	        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	        datastore.put(SensorData);
		}
		resp.sendRedirect("home1.jsp");
	}
}