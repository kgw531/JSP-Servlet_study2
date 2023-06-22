package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	@Override
	
	// 사용자의 요청이 get인 경우
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("message", "서블릿 호출");
		PrintWriter out = res.getWriter();
		out.print("<h1>서블릿 호출</h1>");
		
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, res);
	}
	

	public HelloServlet() {
		// TODO Auto-generated constructor stub
	}

}
