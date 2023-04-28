package com.lively.fundraise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundraiseController {

    @RequestMapping("fund-list")
    public String fund() {
       return "board/fundraise/fundraise-list";
    }

    @RequestMapping("fund-detail")
    public String fundDetail() {
        return "board/fundraise/fundraise-detail";
    }

    @RequestMapping("fund-write")
    public String fundWrite() {
        return "board/fundraise/fundraise-write";
    }
}
