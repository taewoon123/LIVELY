package com.lively.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping("admin")
    public String admin() {
        return "board/admin/admin-dashboard";
    }
}
