package com.lively.fundraise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundraiseController {

    @RequestMapping("fund")
    public String fund() {
       return "board/fundraise/fundraise-detail";
    }
}
