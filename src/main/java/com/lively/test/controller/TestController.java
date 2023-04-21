package com.lively.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//header,footer Test용
@Controller
public class TestController {
    @RequestMapping("header")
    public String header() {
        return "common/header";
    }
    @RequestMapping("footer")
    public String footer() {
        return "common/footer";
    }
}
