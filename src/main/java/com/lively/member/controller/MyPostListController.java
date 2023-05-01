//package com.lively.member.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.lively.member.service.MyPostService;
//import com.lively.member.vo.MemberVo;
//import com.lively.member.vo.MyPostVo;
//import com.lively.member.vo.PaginationVo;
//
//@WebServlet("/post/list")
//public class MyPostListController extends HttpServlet {
//	private MyPostService service = new MyPostService();
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		try {
//
//			MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
//
//			System.out.println(loginMember);
//
//			int currentPage = Integer.parseInt(req.getParameter("page"));
//			int totalArticle = service.totalArticle(loginMember);
//			int pageLimit = 5;
//			int boardLimit = 20;
//
//			System.out.println(loginMember);
//
//			PaginationVo paginationVo = new PaginationVo(totalArticle, currentPage, pageLimit, boardLimit);
//
//			List<MyPostVo> myPostList = service.selectList(paginationVo, loginMember);
//			req.setAttribute("myPostList", myPostList);
//			req.setAttribute("postPaginationVo", paginationVo);
//			System.out.println(paginationVo);
//			req.getRequestDispatcher("/WEB-INF/views/member/myPost_post.jsp").forward(req, resp);
//
//		} catch (Exception e) {
//			System.out.println("{ERROR} 나의 게시글 조회 중 에러 발생");
//			e.printStackTrace();
//			req.setAttribute("alertMsg", "나의 게시글 조회 실패");
//			req.getRequestDispatcher("/").forward(req, resp);
//		}
//	}
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doPost(req, resp);
//
//	}
//}
