package com.lively.admin.controller;

import com.lively.admin.vo.AdminVo;
import com.lively.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminController {

    private final AdminService service;
    @Autowired
    public AdminController(AdminService service) {
        this.service = service;
    }
    @GetMapping("dashboard")
    public String admin(HttpSession session, Model model) {
        AdminVo adminLog = (AdminVo) session.getAttribute("adminLog");
        model.addAttribute("adminLog", adminLog);
        return "admin/admin-dashboard";
    }


    @GetMapping("login")
    public String login() {
        return "admin/admin-login";
    }
    @PostMapping("login")
    public String login(AdminVo adminVo, HttpSession session) {
        AdminVo adminLog = service.login(adminVo);
        if (adminLog != null) {


            return "redirect:dashboard";
        }
        session.setAttribute("adminLoginAlert", "아이디 또는 비밀번호를 확인해주세요.");
        return "admin/admin-login";
    }
}
