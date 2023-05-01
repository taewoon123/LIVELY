//package com.lively.member.service;
//
//import java.sql.Connection;
//import java.sql.SQLException;
//import java.util.List;
//
//import com.lively.member.dao.MyPostDao;
//import com.lively.member.vo.MemberVo;
//import com.lively.member.vo.MyPostVo;
//import com.lively.member.vo.PaginationVo;
//
//public class MyPostService {
//
//	public int totalArticle(MemberVo loginMember) throws Exception {
//		Connection conn = getConnection();
//
//		MyPostDao dao = new MyPostDao();
//		int totalArticle = dao.totalArticle(conn, loginMember);
//
//		close(conn);
//		return totalArticle;
//	}
//
//	public List<MyPostVo> selectList(PaginationVo paginationVo, MemberVo loginMember) throws SQLException {
//		Connection conn = getConnection();
//
//		MyPostDao dao = new MyPostDao();
//		List<MyPostVo> myPostList = dao.selectList(conn, paginationVo, loginMember);
//
//		close(conn);
//		return myPostList;
//	}
//
//	public MyPostVo detail(String no) throws Exception {
//		Connection conn = getConnection();
//
//		MyPostDao dao = new MyPostDao();
////		int result = dao.gainAHit(conn, no);
////		if (result != 1) {
////			throw new Exception("[ERROR] 조회수 증가 실패 잠시 후 다시 시도해주세요.");
////		}
//		MyPostVo myPostVo = dao.detail(conn, no);
//		commit(conn);
//		close(conn);
//		return myPostVo;
//	}
//}
