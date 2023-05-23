package com.lively.fundraise.controller;

import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;
import com.lively.fundraise.service.FundraiseService;
import com.lively.fundraise.vo.FundraiseVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("fund")
public class FundraiseController {
    private final FundraiseService service;

    @Autowired
    public FundraiseController(FundraiseService service) {
        this.service = service;
    }


    @GetMapping("list")
    public String fundList(FundraiseVo vo, Model model, @RequestParam(defaultValue = "1") int page, String searchValue) {

        int listCount = service.getNoticeListCount();
        int pageLimit = 5;
        int boardLimit = 5;

        PageVo pageVo = new PageVo(listCount, page, pageLimit, boardLimit);
        List<FundraiseVo> fundraiseList = service.getFundList(pageVo, searchValue);
        if (fundraiseList != null) {
            model.addAttribute("pageVo", pageVo);
            model.addAttribute("fundraiseList", fundraiseList);
        }
        return "board/fundraise/fundraise-list";
    }

    @GetMapping("detail")
    public String fundDetail(int no, Model model,HttpSession session) {
        FundraiseVo vo = service.getFundDetail(no);
        if (vo == null) {
            model.addAttribute("fundDetailAlert", "해당 글이 존재하지 않습니다");
            return "board/fundraise/fundraise-detail";
        }
        model.addAttribute("fundDetail", vo);
        model.addAttribute("fundNo",no);
        return "board/fundraise/fundraise-detail";
    }


    
    //TODO : no의 값을 가져와야함
    @GetMapping("delete")
    public String fundDelete(String no, HttpSession session, Model model) {
        int result = service.delete(no);
        if (result > 0) {
            session.setAttribute("fundDeleteAlert", "글 삭제 성공");
            return "redirect:/fund/list";
        }
        session.setAttribute("fundDeleteAlert", "글 삭제 실패");
        return "redirect:/fund/list";
    }


    @GetMapping("write")
    public String fundWrite(Model model, HttpSession session) {
        MemberVo memberLog = (MemberVo)session.getAttribute("memberLog");
        if(memberLog == null) {
            model.addAttribute("alertMsg", "로그인 후 이용 가능합니다.");
            return "member/login";
        }
        return "board/fundraise/fundraise-write";
    }

    @PostMapping("write")
    public String fundWrite(FundraiseVo vo, Model model, HttpSession session) {
        MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
        vo.setWriter(memberLog.getNo());

        int result = service.write(vo);
        if (result > 0) {
            return "redirect:/fund/list";
        }
        model.addAttribute("fundWriteAlert", "글 작성 실패");
        return "redirect:/fund/list";
    }
}
