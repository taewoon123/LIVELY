package com.lively.fundraise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("fund")
public class FundraiseController {

    @GetMapping("list")
    public String fund() {
       return "board/fundraise/fundraise-list";
    }

    @GetMapping("detail")
    public String fundDetail() {
        return "board/fundraise/fundraise-detail";
    }

    @GetMapping("write")
    public String fundWrite() {
        return "board/fundraise/fundraise-write";
    }
}
