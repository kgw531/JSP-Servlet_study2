package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileDao;
import fileupload.FileDto;

@WebServlet("/13파일업로드/FileListServlet.do")
public class FileListServlet extends HttpServlet{

	public FileListServlet() {
		// TODO Auto-generated constructor stub
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FileDao dao = new FileDao();
		List<FileDto> list = dao.getFileList();
		req.setAttribute("dao", dao);
		req.setAttribute("list", list);
		req.getRequestDispatcher("./FileList.jsp").forward(req,resp);
		
		
	}
	
}
