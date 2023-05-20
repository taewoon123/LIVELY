package com.lively.fundraise.controller;

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
            log.info("fundraiseList : {}", fundraiseList.get(0));
            model.addAttribute("pageVo", pageVo);
            model.addAttribute("fundraiseList", fundraiseList);
        }
        return "board/fundraise/fundraise-list";
    }

    @GetMapping("detail")
    public String fundDetail(int no, Model model,HttpSession session) {
        log.info("D E T A I L " +  model.getAttribute("fundraiseList"));
        FundraiseVo vo = service.getFundDetail(no);
        if (vo == null) {
            model.addAttribute("fundDetailAlert", "해당 글이 존재하지 않습니다");
            return "board/fundraise/fundraise-detail";
        }
        model.addAttribute("fundDetail", vo);
        return "board/fundraise/fundraise-detail";
    }


    
    //TODO : no의 값을 못가져옴
    @GetMapping("delete")
    public String fundDelete(int no, HttpSession session, Model model) {
        int result = service.delete(no);
        if (result > 0) {
            session.setAttribute("fundDeleteAlert", "글 삭제 성공");
            return "redirect:/fund/list";
        }
        session.setAttribute("fundDeleteAlert", "글 삭제 실패");
        return "redirect:/fund/list";
    }


    @GetMapping("write")
    public String fundWrite() {
        return "board/fundraise/fundraise-write";
    }

    @PostMapping("write")
    public String fundWrite(FundraiseVo vo, Model model) {
      int result = service.write(vo); 
      if(result > 0){
      
      }
    }
}
