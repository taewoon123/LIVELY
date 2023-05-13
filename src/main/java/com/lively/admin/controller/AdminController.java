package com.lively.admin.controller;

import com.lively.admin.vo.AdminVo;
import com.lively.admin.service.AdminService;
import com.lively.member.vo.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {

    private final AdminService service;

    @Autowired
    public AdminController(AdminService service) {
        this.service = service;
    }

    @GetMapping("dashboard")
    public String admin(HttpSession session, Model model, MemberVo memberVo) {
        //retrieve signed in admin Information from the session
        //if admin is not signed in, redirect to log in view
        AdminVo adminLog = (AdminVo) session.getAttribute("adminLog");

        //retrieve memberList from Database
        List<MemberVo> memberList = service.presentMembers(memberVo);
        //if memberList is not null, add memberList to model
        if(memberList != null) {
            model.addAttribute("memberList", memberList);
        }
        model.addAttribute("adminLog", adminLog);
        return "admin/admin-dashboard";
    }

    @RequestMapping("member-delete")
    @ResponseBody
    public void memberDelete(List<String> deleteMemberList,Model model) {
//        int result = service.memberDelete(deleteMemberList);
//        if (result > 0) {
//           model.addAttribute("memberDeleteAlert", "회원 삭제 성공");
//        }
    }

    @GetMapping("login")
    public String login() {

        return "admin/admin-login";
    }

    @PostMapping("login")
    public String login(AdminVo adminVo,Model model,HttpSession session) {
        AdminVo adminLog = service.login(adminVo);
        if (adminLog != null) {
          if ("superuser".equals(adminLog.getAdminId())){
            session.setAttribute("superuser", adminLog.getAdminId());
            return "admin/admin-signup";
          }
            session.setAttribute("adminLog", adminLog);
            return "redirect:dashboard";
        }
        model.addAttribute("adminLoginAlert", "아이디 또는 비밀번호를 확인해주세요.");
        return "admin/admin-login";
    }

//    =========superUser==========

    @GetMapping("signup")
    public String signup(HttpSession session,Model model) {
        if (session.getAttribute("superuser") == null) {
            model.addAttribute("superuserNeeded", "슈퍼유저 로그인이 필요합니다.");
            return "admin/admin-login";
        }
        return "admin/admin-signup";
    }

    @PostMapping("signup")
    public String signup(AdminVo adminVo, HttpSession session) {
       int adminSignupResult = service.signup(adminVo);
        if (adminSignupResult > 0) {
            return "redirect:dashboard";
        }
        return "admin/admin-signup";
    }


}
