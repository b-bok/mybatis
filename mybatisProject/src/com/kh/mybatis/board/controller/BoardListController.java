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
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		//페이징 처리
		// listCount, curretPage, pageLimit, boardLimit
		// => startPae, endPage, maxPage
		
		
		BoardService bService = new BoardServiceImpl();
		
		int listCount = bService.selectListCount();
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// pageLimit : 한 페이지 하단에 보여질 페이징바 최대 갯수
		//int pageLimit = 10;
		// boardLimit : 한 페이지에 보여질 게시글 최대 갯수
		//int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		ArrayList<Board> list = bService.selectList(pi);
		

		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
			
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
