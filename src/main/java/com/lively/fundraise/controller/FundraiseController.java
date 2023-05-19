package com.lively.fundraise.controller;

import com.lively.notice.page.vo.PageVo;
import com.lively.fundraise.service.FundraiseService;
import com.lively.fundraise.vo.FundraiseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("fund")
public class FundraiseController {
    private final FundraiseService service;

    @Autowired
    public FundraiseController(FundraiseService service) {
        this.service = service;
    }


    @GetMapping("list")
    public String fund(FundraiseVo vo, Model model, @RequestParam(defaultValue = "1") int page, String searchValue) {

        int listCount = service.getNoticeListCount();
        int pageLimit = 5;
        int boardLimit = 5;

        PageVo pageVo = new PageVo(listCount, page, pageLimit, boardLimit);
        List<FundraiseVo> fundraiseList = service.getFundList(pageVo);
        if (fundraiseList != null) {
            model.addAttribute("pageVo", pageVo);
            model.addAttribute("fundraiseList", fundraiseList);
        }
        return "board/fundraise/fundraise-list";
    }

    @GetMapping("detail")
    public String fundDetail(int no, Model model) {
        FundraiseVo vo  = service.getFundDetail(no);
        if (vo == null) {
          model.addAttribute("fundDetailAlert","해당 글이 존재하지 않습니다");
          return "board/fundraise/fundraise-detail";
        }
        model.addAttribute("fundDetail", vo);
        return "board/fundraise/fundraise-detail";
    }



    @GetMapping("write")
    public String fundWrite() {
        return "board/fundraise/fundraise-write";
    }
}
