package com.lively.fundraise.reply.controller;


import com.google.gson.Gson;
import com.lively.fundraise.reply.service.FundraiseReplyService;
import com.lively.fundraise.reply.vo.FundraiseReplyVo;
import com.lively.help.reply.vo.HelpReplyVo;
import com.lively.member.vo.MemberVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("fund/reply")
public class FundraiseReplyController {

    private final Gson gson;
    private final FundraiseReplyService service;

    @Autowired
    public FundraiseReplyController(FundraiseReplyService service, Gson gson) {
        this.gson = gson;
        this.service = service;
    }
    @PostMapping("write")
    @ResponseBody
    public String write(FundraiseReplyVo vo, HttpSession session) {
        MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
        if(memberLog == null) {
            return "unauthor";
        }

        String writer = memberLog.getNo();
        vo.setWriter(writer);

        int result = service.write(vo);

        if(result != 1) {
            return "fail";
        }

        return "ok";
    }

    //댓글 목록 조회
    @GetMapping("list")
    @ResponseBody
    public String list(String fundNo) {
        //서비스
        List<FundraiseReplyVo> list = service.getFundraiseReplyList(fundNo);

        String str = gson.toJson(list);

        return str;
    }


      //댓글 삭제
    @DeleteMapping("delete")
    @ResponseBody
    public String delete(String rno, HttpSession session) throws Exception {
      MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
      if(memberLog == null) {
        return "unauthor";
      }
      String writer = memberLog.getNo();
      
      FundraiseReplyVo replyVo = new FundraiseReplyVo();
      replyVo.setFundReplyNo(rno);
      replyVo.setWriter(writer);
      
      int result = service.delete(replyVo);
      
      System.out.println("delete result : " + result);
      
      if(result == 1) {
        return "삭제 성공!";
      } else {
        return "삭제 실패...";
      }
    }
	
    
}
