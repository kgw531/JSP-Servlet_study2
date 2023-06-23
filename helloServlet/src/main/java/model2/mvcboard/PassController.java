package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet{

	public PassController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// req.setAttribute("mode", req.getParameter("mode"));
		// req.setAttribute("idx",req.getParameter("idx"));
		
		req.getRequestDispatcher("../14MVCBoard/Pass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		MVCBoardDao dao = new MVCBoardDao();
		boolean confirmed = dao.confirmPassword(pass,idx);
		
		if(confirmed) {
			System.out.println("비밀번호 검증 성공");
			if(mode.equals("edit")) {
				// 수정
				resp.sendRedirect("../mvcboard/edit.do?idx=" + idx);
			}else if(mode.equals("delete")){
				// 삭제
				int res =  dao.delete(idx);
				if(res > 0) {
					JSFunction.alertLocation(resp, "../mvcboard/list.do","삭제 되었습니다.");
				}else {
					System.err.println("삭제실패");
					JSFunction.alertBack(resp, "게시물 삭제가 실패했습니다.");
				}
			}
		}else {
			JSFunction.alertBack(resp, "비밀번호 검증에 실패하였습니다.");
		}
	}
}
