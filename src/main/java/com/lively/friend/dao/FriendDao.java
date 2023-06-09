package com.lively.friend.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lively.common.FileVo;
import com.lively.friend.vo.FriendVo;
import com.lively.page.vo.PageVo;

@Repository
public class FriendDao {
	
	//피드(전체)
	public List<FriendVo> getFriendFeed(SqlSessionTemplate sst, String searchValue) {
		System.out.println(searchValue);
		/*
		 * int limit = pageVo.getBoardLimit(); int offset = (pageVo.getCurrentPage()-1)
		 * * limit;
		 */
		/* RowBounds rowBounds = new RowBounds(offset, limit); */
		return sst.selectList("friend.FriendFeed", searchValue);
		
	}


	//피드작성
	public int write(SqlSessionTemplate sst , FriendVo vo) {
		return sst.insert("friend.write" , vo);
	}

	public int insertAttachment(SqlSessionTemplate sst, List<FileVo> friendList) {
		return sst.insert("friend.insertAttachment" , friendList);
	}

	public List<Map<String, String>> getLocationNoList(SqlSessionTemplate sst) {
		return sst.selectList("friend.getLocationList");
	}

	public int getFeedCount(SqlSessionTemplate sst) {
		return sst.selectOne("friend.getFeedCount");
	}


	public FileVo getAttachment(SqlSessionTemplate sst, String friendAttachNo) {
		return sst.selectOne("friend.getAttachment" , friendAttachNo);
	}

	

	/*
	 * public FriendVo getFriendFeed(SqlSessionTemplate sst, String no) { return
	 * sst.selectOne("friend.getFriendFeed" , no); }
	 */

	public List<FileVo> getAttachmentList(SqlSessionTemplate sst) {
		return sst.selectList("friend.getAttachmentList");
	}

	//검색
	public List<String> search(SqlSessionTemplate sst, String searchValue) {
		return sst.selectList("friend.search", searchValue);
	}


	public List<FriendVo> getFriendFeed(SqlSessionTemplate sst) {
		return sst.selectList("friend.getFriendFeed");
	}

	//수정(작성자만)
	public int updateFeed(SqlSessionTemplate sst, FriendVo friendVo) {
		return sst.update("friend.updateFeed" , friendVo);
	}

	//삭제(작성자만)
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("friend.delete", no);
	}

	
	//상세조회
	public List<FriendVo> getFeed(SqlSessionTemplate sst, String no) {
		return sst.selectList("friend.getFeed", no);
	}


	public int statusY(SqlSessionTemplate sst, String no) {
		return sst.update("friend.statusY", no);
	}


	public int statusN(SqlSessionTemplate sst, String no) {
		return sst.update("friend.statusN", no);
	}









	
	

	
}
