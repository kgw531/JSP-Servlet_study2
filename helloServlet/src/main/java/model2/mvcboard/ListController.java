package model2.mvcboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;

public class ListController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 리스트 조회
		MVCBoardDao dao = new MVCBoardDao();
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		String pageNo = req.getParameter("pageNo");
		
	
		//검색어, 페이지 정보 세팅
		Criteria cri = new Criteria(searchField,searchWord,pageNo);
		
		System.out.println(cri.getPageNo());
		System.out.println(cri.getStartNo());
		System.out.println(cri.getEndNo());
		
	
		cri.setSearchField(searchField);
		cri.setSearchWord(searchWord);
		
		
		List<MVCBoardDto> list = dao.getListPage(cri);
		
		int totalCnt = dao.getTotalCnt(cri);
		
		System.out.println("totalCnt : " + totalCnt);
		// 페이지 네비게이션 생성을 위해 pageDto를 생성
		PageDto pageDto = new PageDto(totalCnt, cri);
		
		
		
		// request 영역에 저장
		req.setAttribute("list", list);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("pageNo", pageNo);
		req.setAttribute("pageDto", pageDto);
		
		
		// 화면 페이지 전환
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
		
		
	}
	
	
	public ListController() {
		// TODO Auto-generated constructor stub
	}
	
	
}
