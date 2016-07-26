package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * Author Andre Tertzakian
 * December, 2013
 */


/**
 * Servlet implementation class BookmarkServlet
 */
@WebServlet("/BookmarkServlet")
public class BookmarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public BookmarkServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		String url =  request.getParameter("url");
		String type = request.getParameter("type");
		
		HttpSession session = request.getSession();
		ArrayList<String> urls = (ArrayList<String>) session.getAttribute("urls");
		ArrayList<String> imgs = (ArrayList<String>) session.getAttribute("imgs");
		
		
//		System.out.print(type);
//		System.out.println(url);
		
		if(type == null) {
			session.setAttribute("typeErr", "Please select a type");
			rd.forward(request, response);
			return;
		}else {
			session.setAttribute("typeErr", null);
		}
		
		if(type.equals("link")) {
			if(!url.startsWith("http://")) {
				url = "http://" + url;
			}
			urls.add(url);
		}else if(type.equals("img")) {
			imgs.add(url);
		}

		
		session.setAttribute("urls", urls);
		session.setAttribute("imgs", imgs);
		rd.forward(request, response);
	}

}
