//package com.lively.member.service;
//
//import static com.kh.app.util.JDBCTemplate.close;
//import static com.kh.app.util.JDBCTemplate.getConnection;
//
//import java.sql.Connection;
//
//import com.lively.member.dao.MyPostMyDao;
//import com.lively.member.vo.MemberVo;
//
//public class MyPostMyService {
//
//	public int totalArticle(MemberVo loginMember) throws Exception {
//		Connection conn = getConnection();
//
//		MyPostMyDao dao = new MyPostMyDao();
//		int totalArticle = dao.totalArticle(conn, loginMember);
//
//		close(conn);
//		return totalArticle;
//	}
//
//}
