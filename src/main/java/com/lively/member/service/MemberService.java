package com.lively.member.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lively.common.FileVo;
import com.lively.common.locaion.dao.LocationDao;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.friend.vo.FriendVo;
import com.lively.help.vo.HelpVo;
import com.lively.market.vo.MarketVo;
import com.lively.member.dao.MemberDao;
import com.lively.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberService {

	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	private final BCryptPasswordEncoder enc;
    private final LocationDao locationDao;


	@Autowired
	public MemberService(SqlSessionTemplate sst, MemberDao dao, BCryptPasswordEncoder enc, LocationDao locationDao) {
		this.sst = sst;
		this.dao = dao;
		this.enc = enc;
        this.locationDao = locationDao;

	}

	// 회원가입
	public int join(MemberVo vo) throws Exception {
		// 비밀번호 암호화
		String pwd = vo.getPwd();
		String newPwd = enc.encode(pwd);
		vo.setPwd(newPwd);
		// dao 호출
		return dao.join(vo, sst);
	}

	// 아이디 중복확인
	public int checkId(String id) {
		// conn : 이미 지역변수 sst 있음.
		// sql : dao에게 보내기.
		return dao.checkId(sst, id);
		// tx || rs : tx는 자동처리 / rs는 mybatis가 처리해줌.
		// close : spring이 처리해줌
	}
	
//	//회원가입 location 데이터 넣기
//	public List<LocationVo> getLocationList(LocationVo locationVo) {
//        return locationDao.getLocationList(sst,locationVo);
//	}

	// 로그인
	public MemberVo login(MemberVo vo) {

		// dao 호출
		MemberVo memberLog = dao.login(sst, vo);

		// 비밀번호 복호화
		String userPwd = vo.getPwd();
		String dbPwd = memberLog.getPwd();
		boolean result = enc.matches(userPwd, dbPwd);

		if (result) {
			return memberLog;
		} else {
			return null;
		}
	}

	// 비밀번호 까묵 - 회원조회
	public MemberVo forgotPassword(MemberVo vo) {
		return dao.forgotPassword(sst, vo);
	}

	// 비밀번호 재설정
	public MemberVo resetPassword(MemberVo memberCheck, MemberVo vo) throws Exception {

		// 비밀번호 암호화
		String pwd = vo.getPwd();
		String newPwd = enc.encode(pwd);
		memberCheck.setPwd(newPwd);

		// dao 호출
		int result = dao.resetPassword(sst, memberCheck);
		if (result != 1) {
			throw new Exception();
		}
		return memberCheck;
	}

	// 회원정보 수정
	public MemberVo myInfo(MemberVo vo) throws Exception {

		int result = dao.myInfo(sst, vo);

		if (result != 1) {
			throw new Exception();
		}
		return dao.selectOneByNo(sst, vo);

	}

	// my-feed
	public List<MarketVo> getMyMarketFeed(MarketVo marketVo) {
		return dao.getMyMarketFeed(sst, marketVo);
	}

	public List<Map<String, String>> getLocationList() {
		return dao.getLocationList(sst);
	}

	public int getMyMarketFeedCount(MarketVo marketVo) {
		return dao.getMyMarketFeedCount(sst, marketVo);
	}

	public int getMyFriendFeedCount(FriendVo friendVo) {
		return dao.getMyFriendFeedCount(sst, friendVo);
	}

	public List<FriendVo> getMyFriendFeed(FriendVo friendVo) {
		return dao.getMyFriendFeed(sst, friendVo);
	}

	// my-help
	public List<HelpVo> getMyHelpBoard(HelpVo helpVo, String writeNo) {
		return dao.getMyHelpBoard(sst, helpVo);
	}



	public ArrayList<FriendVo> getFriendFeed(String searchValue) {
		 List<FriendVo> fvoList = dao.getFriendFeed(sst , searchValue);
		 
		 Map<String, FriendVo> fvoMap = new HashMap<String, FriendVo>();
		 for(FriendVo fvo : fvoList) {
			 fvoMap.put(fvo.getFriendNo(), fvo);
			 fvo.setAttachmentList(new ArrayList<FileVo>()); 
		 }
		 
		 
		 
		 List<FileVo> fileList = dao.getAttachmentList(sst);
		 for(FileVo file : fileList) {
			 String friendNo = file.getNo();
			 FriendVo temp = fvoMap.get(friendNo);
			 if(temp == null) {
				 continue;
			 }
			 temp.getAttachmentList().add(file);
		 }
		
		return mapToList(fvoMap);
	}

	private ArrayList<FriendVo> mapToList(Map<String, FriendVo> fvoMap) {
		
		ArrayList<FriendVo> voList = new ArrayList<FriendVo>();
		
		int i = 0;
		while(fvoMap.size() != voList.size()) {
			FriendVo vo = fvoMap.get("" + i++);
			if(vo != null) {
				voList.add(vo);
			}
		}
		Collections.reverse(voList);
		return voList;
	}


	public ArrayList<MarketVo> getMarketFeed(String searchValue) {
		 List<MarketVo> fileVoList = dao.getMarketFeed(sst, searchValue);
		 
		 Map<String, MarketVo> fileVoMap = new HashMap<String, MarketVo>();
		 for(MarketVo fileVo : fileVoList) {
			 fileVoMap.put(fileVo.getMarketNo(), fileVo);
			 fileVo.setAttachmentList2(new ArrayList<FileVo>()); 
		 }
		 
		 List<FileVo> fileList = dao.getAttachmentList2(sst);
		 for(FileVo file : fileList) {
			 String marketNo = file.getNo();
			 MarketVo getMarketNo = fileVoMap.get(marketNo);
			 if(getMarketNo == null) {
				 continue;
			 }
			 getMarketNo.getAttachmentList2().add(file);
		 }
		
		return mapToList2(fileVoMap);
	}
	
	private ArrayList<MarketVo> mapToList2(Map<String, MarketVo> fileVoMap) {
			
		ArrayList<MarketVo> voList = new ArrayList<MarketVo>();
		
		int i = 0;
		while(fileVoMap.size() != voList.size()) {
			MarketVo vo = fileVoMap.get("" + i++);
			if(vo != null) {
				voList.add(vo);
			}
		}
		Collections.reverse(voList);
		return voList;
	}



}// class