package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/13서블릿/AnnotationMapping.do")
public class AnnotationMapping extends HttpServlet{

	public AnnotationMapping() {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("message", "AnnotationMapping.do 호출");
		req.getRequestDispatcher("HelloServlet.jsp").forward(req,resp);
	}

}
