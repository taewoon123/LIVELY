//package com.lively.member.dao;
//
//import static com.kh.app.util.JDBCTemplate.close;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import com.lively.member.vo.MemberVo;
//import com.lively.member.vo.MyPostVo;
//
//public class MyPostMyDao {
//
//	public int totalArticle(Connection conn, MemberVo loginMember) throws Exception {
//
//		String sql = "SELECT COUNT(*) AS TOTAL FROM (SELECT R.NO , R.TITLE , R.CONTENT , R.WRITER , R.ENROLL_DATE , R.HIT , MI.NICK FROM REVIEW R JOIN MEMBER_INFO MI ON R.WRITER = MI.NO  WHERE R.DELETE_YN = 'N' AND R.WRITER = ?)";
//		int total = 0;
//		PreparedStatement pstmt = conn.prepareStatement(sql);
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
//}
