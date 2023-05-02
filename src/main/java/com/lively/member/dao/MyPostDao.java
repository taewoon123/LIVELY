//package com.lively.member.dao;
//
//import static com.kh.app.util.JDBCTemplate.*;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.lively.member.vo.MemberVo;
//import com.lively.member.vo.MyPostVo;
//import com.lively.member.vo.PaginationVo;
//
//public class MyPostDao {
//
//	public int totalArticle(Connection conn, MemberVo loginMember) throws Exception {
//		String sql = "SELECT COUNT(*) AS TOTAL FROM (SELECT R.NO , R.TITLE , R.CONTENT , R.WRITER , R.ENROLL_DATE , R.HIT , MI.NICK FROM REVIEW R JOIN MEMBER_INFO MI ON R.WRITER = MI.NO  WHERE R.DELETE_YN = 'N' AND R.WRITER = ?)";
//		int total = 0;
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		System.out.println(loginMember.getNo());
//		pstmt.setString(1, loginMember.getNo());
//		ResultSet rs = pstmt.executeQuery();
//
//		MyPostVo postInfo = null;
//
//		if (rs.next()) {
//			total = rs.getInt("TOTAL");
//		}
//		close(pstmt);
//		close(rs);
//
//		return total;
//	}
//
//	public List<MyPostVo> selectList(Connection conn, PaginationVo paginationVo, MemberVo loginMember)
//			throws SQLException {
//		String sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, SUB.* FROM (SELECT R.NO , R.TITLE , R.CONTENT , R.WRITER , R.ENROLL_DATE , R.HIT , MI.NICK FROM REVIEW R JOIN MEMBER_INFO MI ON R.WRITER = MI.NO  WHERE R.DELETE_YN = 'N' AND R.WRITER = ? ORDER BY NO DESC) SUB) WHERE RNUM BETWEEN ? AND ?";
////		String sql = "SELECT COUNT(*) AS TOTAL FROM (SELECT R.NO, R.TITLE, R.CONTENT, R.WRITER, R.ENROLL_DATE, R.HIT, MI.NICK FROM REVIEW R JOIN MEMBER_INFO MI ON R.WRITER = MI.NO  WHERE R.DELETE_YN = 'N' AND R.WRITER = ?)";
//
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, loginMember.getNo());
//		int startRow = (paginationVo.getCurrentPage() - 1) * (paginationVo.getBoardLimit()) + 1;
//		int endRow = startRow + paginationVo.getBoardLimit() - 1;
//
//		pstmt.setInt(2, startRow);
//		pstmt.setInt(3, endRow);
//		ResultSet rs = pstmt.executeQuery();
//		List<MyPostVo> myPostList = new ArrayList<MyPostVo>();
//
//		while (rs.next()) {
//			MyPostVo myPostVo = new MyPostVo();
//			myPostVo.setNo(rs.getString("NO"));
//			myPostVo.setTitle(rs.getString("TITLE"));
//			myPostVo.setContent(rs.getString("CONTENT"));
//			myPostVo.setWriter(rs.getString("NICK"));
//			myPostVo.setEnroll_date(rs.getString("ENROLL_DATE"));
//			myPostVo.setHit(rs.getString("HIT"));
//			myPostList.add(myPostVo);
//		}
//
//		close(pstmt);
//		close(rs);
//		return myPostList;
//	}
//
//	public MyPostVo detail(Connection conn, String no) throws Exception {
//		String sql = "SELECT R.NO, R.TITLE, R.CONTENT, R.WRITER, R.ENROLL_DATE, R.HIT, A.CHANGE_NAME FROM REVIEW R JOIN ATTACHMENT A ON (R.NO = A.NO) WHERE R.NO = ? AND R.DELETE_YN = 'N'";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, no);
//		System.out.println(no);
//		ResultSet rs = pstmt.executeQuery();
//		MyPostVo myPostVo = null;
//		if (rs.next()) {
//			myPostVo = new MyPostVo();
//			myPostVo.setNo(rs.getString("NO"));
//			myPostVo.setTitle(rs.getString("TITLE"));
//			myPostVo.setContent(rs.getString("CONTENT"));
//			myPostVo.setWriter(rs.getString("WRITER"));
//			myPostVo.setEnroll_date(rs.getString("ENROLL_DATE"));
//			myPostVo.setHit(rs.getString("HIT"));
//			myPostVo.setChangeName(rs.getString("CHANGE_NAME"));
//		}
//
//		System.out.println(myPostVo);
//		close(pstmt);
//		close(rs);
//		return myPostVo;
//
//	}
//
////	public int gainAHit(Connection conn, String no) throws Exception {
////		String sql = "UPDATE REVIEW SET HIT = HIT + 1 WHERE NO = ?";
////
////		PreparedStatement pstmt = conn.prepareStatement(sql);
////		pstmt.setString(1, no);
////		int result = pstmt.executeUpdate();
////
////		MyPostVo myPostVo = new MyPostVo();
////
////		close(pstmt);
////		return result;
////	}
//}
