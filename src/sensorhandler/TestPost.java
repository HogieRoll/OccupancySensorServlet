package sensorhandler;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class TestPost extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Key guestbookKey = KeyFactory.createKey("SensorInfo", "Sensor");
        
        Entity SensorData = new Entity("SensorData", guestbookKey);
        Date d=new Date();
        SensorData.setProperty("content", "Blah");
        SensorData.setProperty("date",d.getTime());
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        datastore.put(SensorData);
		resp.sendRedirect("home.jsp");
	}
}