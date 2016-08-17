package myservlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import saitweet.Query;
import saitweet.Tweet;
import twitter4j.TwitterException;

/**
 * Servlet implementation class FormService
 */
@WebServlet("/FormService")
public class FormService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormService() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.setContentType("text/html");
        //response.setCharacterEncoding("utf-8");
	       
		// query text
		String query = request.getParameter("query");
		
		// checkbox value
		String[] socmedCheck = request.getParameterValues("socmed_check");
		
		// set query and chosen social media as global value
		Query.setQuery(query, socmedCheck);
		
		// extract Twitter data
		
		try {
			//Tweet.clearList();
			Tweet.extractTweet(query);
			//Tweet.setTweetText();
		} catch (TwitterException e) {
			e.printStackTrace();
		}
		
		
		// debugging
		System.out.println("HELLO DOPOST");
		
		// redirect to primary.jsp with the query text
		//request.setAttribute("query", query);
		//request.getRequestDispatcher("#/primary").forward(request, response);
		//response.sendRedirect("localhost:8080/TwitterServlet/#/primary"); 
		
    	String contextPath = request.getContextPath();
    	System.out.println("context: " + contextPath);
    	System.out.println("servlet: " + request.getServletContext());
		
		//RequestDispatcher rd = request.getRequestDispatcher("/#/primary") ;
    	//rd.forward(request, response) ;
    	
		response.sendRedirect(contextPath + "#/primary"); 
		
	}

}
