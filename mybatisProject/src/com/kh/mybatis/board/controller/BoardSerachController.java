package com.kh.mybatis.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mybatis.board.model.service.BoardService;
import com.kh.mybatis.board.model.service.BoardServiceImpl;
import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.common.model.vo.PageInfo;
import com.kh.mybatis.common.template.Pagination;

/**
 * Servlet implementation class BoardSerachController
 */
@WebServlet("/search.bo")
public class BoardSerachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSerachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 검색 후 페이징 처리
		
		String condition = request.getParameter("condition");	// writer // title // content
		
		String keyword = request.getParameter("keyword");		// 사용자가 검색하고 싶은 값
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		BoardService bService = new BoardServiceImpl();
		
		// * searchCount : 검색결과에 해당하는 총 갯수
		int searchCount = bService.selectSearchCount(condition, keyword);
		
		PageInfo pi = Pagination.getPageInfo(searchCount,currentPage,10,5);
		
		
		
		
		ArrayList<Board> list = bService.selectSearchList(condition, keyword, pi);

		System.out.println(list);
		
		
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);

			request.getRequestDispatcher("WEB-INF/views/board/boardList.jsp").forward(request, response);
			
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
