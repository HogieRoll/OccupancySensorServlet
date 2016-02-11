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
public class OccupancySensorServletServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, from Occusensor Online!\n"+
		                         "******************************\n"+
								 "Database update successful");
	}
	public void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String guestbookName = req.getParameter("guestbookName");
        
 
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        datastore.put("Hello");
 
        resp.sendRedirect("/guestbook.jsp?guestbookName=" + guestbookName);
	}
	
}
