package com.lively.admin.controller;

import com.google.gson.Gson;
import com.lively.admin.vo.AdminVo;
import com.lively.admin.service.AdminService;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("admin")
public class AdminController {

    private final AdminService service;

    @Autowired
    public AdminController(AdminService service) {
        this.service = service;
    }

    @GetMapping("dashboard")
    public String admin(HttpSession session, Model model, MemberVo memberVo, @RequestParam(defaultValue = "1") int page) {
        //dashboard member Pagination
        int listCount = service.getMemberCount();
        int pageLimit = 5;
        int boardLimit = 5;

        PageVo pageVo = new PageVo(listCount, page, pageLimit, boardLimit);
        //retrieve signed in admin Information from the session
        //if admin is not signed in, redirect to login view
        AdminVo adminLog = (AdminVo) session.getAttribute("adminLog");
        //회원 수 받기
        int memberCount = service.getMemberCount();
        //모든 게시판(6개)수 받아오기
        int queryCount = service.getQueryCount();
        int helpCount = service.getHelpCount();
        int jobCount = service.getJobCount();
        int fundCount = service.getFundCount();
        int friendCount = service.getFriendCount();
        int marketCount = service.getMarketCount();
        //receive memberList from Database
        List<MemberVo> memberList = service.presentMembers(memberVo, pageVo);
        //if memberList is not null, add memberList and boardList to model
        if(memberList != null) {
            model.addAttribute("memberList", memberList);
            model.addAttribute("memberCount", memberCount);
            model.addAttribute("queryCount", queryCount);
            model.addAttribute("helpCount", helpCount);
            model.addAttribute("jobCount", jobCount);
            model.addAttribute("fundCount", fundCount);
            model.addAttribute("friendCount", friendCount);
            model.addAttribute("marketCount", marketCount);
            model.addAttribute("pageVo", pageVo);
        }
        model.addAttribute("adminLog", adminLog);
        return "admin/admin-dashboard";
    }



    //getting checkbox's checked value from the dashboard
    //and deleting the selected member


    @PostMapping("member-delete")
    @ResponseBody
    public String memberDelete(HttpSession session, @RequestBody List<Integer> deleteList) {
       int result = service.memberDelete(deleteList);
        if (result > 0) {
           session.setAttribute("memberDeleteAlert", "회원 삭제 성공");
        }
        if (deleteList.size() == 0) {
            session.setAttribute("memberDeleteAlert", "선택된 회원이 없습니다.");
        }
        return "redirect:/admin-dashboard";
    }

    @GetMapping("login")
    public String login(HttpSession session) {
        //if they already signed in as admin, redirect to dashboard immediately
        if (session.getAttribute("adminLog") != null) {
            return "redirect:dashboard";
        }
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
        System.out.println(adminLog);
        return "redirect:dashboard";
        }
        model.addAttribute("alertMsg", "아이디 또는 비밀번호를 확인해주세요.");
        return "admin/admin-login";
    }

//    =========superUser Below==========

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
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main";
    }

}
