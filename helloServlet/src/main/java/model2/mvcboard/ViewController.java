package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet{

	public ViewController() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시물 조회
		MVCBoardDao dao = new MVCBoardDao();
		MVCBoardDto dto = dao.selectOne(request.getParameter("idx"));
		// 조회된 게시물 저장
		request.setAttribute("dto", dto);
		//포워딩
		request.getRequestDispatcher("../14MVCBoard/View.jsp").forward(request, response);
		
	}
	
	
}
