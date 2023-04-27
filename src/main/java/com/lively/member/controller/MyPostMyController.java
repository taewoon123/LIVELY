package com.lively.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lively.member.service.MyPostMyService;
import com.lively.member.vo.MemberVo;
import com.lively.member.vo.PaginationVo;

@WebServlet("/post/mypage")
public class MyPostMyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");

		MyPostMyService service = new MyPostMyService();

		try {
			int currentPage = Integer.parseInt(req.getParameter("page"));
			int totalArticle;
			totalArticle = service.totalArticle(loginMember);
			int pageLimit = 5;
			int boardLimit = 20;

			PaginationVo paginationVo = new PaginationVo(totalArticle, currentPage, pageLimit, boardLimit);

			req.setAttribute("postPaginationVo", paginationVo);
			System.out.println(paginationVo);

			req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
