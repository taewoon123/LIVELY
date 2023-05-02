//package com.lively.member.controller;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.lively.member.service.MyPostService;
//import com.lively.member.vo.MyPostVo;
//
//@WebServlet("/post/detail")
//public class MyPostDetailController extends HttpServlet {
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		try {
//			String no = req.getParameter("no");
//			MyPostService service = new MyPostService();
//			MyPostVo myPostVo = service.detail(no);
//			System.out.println(myPostVo);
//			req.setAttribute("myPostVo", myPostVo);
//			req.getRequestDispatcher("/WEB-INF/views/post/detail.jsp").forward(req, resp);
//		} catch (Exception e) {
//			System.out.println("[error]게시글 상세조회 에러");
//			e.printStackTrace();
//		}
//	}
//}