
package com.vogella.jersey.first;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;



// Plain old Java Object it does not extend as class or implements
// an interface

// The class registers its methods for the HTTP GET request using the @GET annotation.
// Using the @Produces annotation, it defines that it can deliver several MIME types,
// text, XML and HTML.

// The browser requests per default the HTML MIME type.

//Sets the path to base URL + /hello
@Path("/hello")
public class Hello {

  // This method is called if TEXT_PLAIN is request
  @GET
    
  @Produces(MediaType.TEXT_PLAIN)
  public String sayPlainTextHello(@QueryParam("inputUrl") String varX) {
	  try {
		BufferedReader in;
		  URL url = new URL(varX);

			in = new BufferedReader(new InputStreamReader(url.openStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
			  response.append(inputLine+"\b");
			  
			}
			
			in.close();
			
			return response.toString();
			
	} catch (MalformedURLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  return "";
  }


}