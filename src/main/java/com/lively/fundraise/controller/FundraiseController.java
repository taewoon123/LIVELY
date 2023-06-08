package com.lively.fundraise.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.lively.common.FileUploader;
import com.lively.common.FileVo;
import com.lively.common.locaion.vo.LocationVo;
import com.lively.fundraise.service.FundraiseService;
import com.lively.fundraise.vo.FundraiseVo;
import com.lively.member.vo.MemberVo;
import com.lively.page.vo.PageVo;
import lombok.extern.slf4j.Slf4j;
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
            model.addAttribute("pageVo", pageVo);
            model.addAttribute("fundraiseList", fundraiseList);
        }
        return "board/fundraise/fundraise-list";
    }

    @GetMapping("detail")
    public String fundDetail(@RequestParam("no") int no, Model model, HttpSession session) {
        FundraiseVo vo = service.getFundDetail(no);
        if (vo == null) {
            model.addAttribute("fundDetailAlert", "해당 글이 존재하지 않습니다");
            return "board/fundraise/fundraise-detail";
        }
        model.addAttribute("fundDetail", vo);
        log.info("fundDetail : {}", vo);
        model.addAttribute("fundNo", no);
        return "board/fundraise/fundraise-detail";
    }


    //TODO : no의 값을 가져와야함 ACCOMPLISHED
    @GetMapping("delete")
    public String fundDelete(String no, HttpSession session, Model model) {
        int result = service.delete(no);
        if (result > 0) {
            session.setAttribute("fundDeleteAlert", "글 삭제 성공");
            return "redirect:/fund/list";
        }
        session.setAttribute("fundDeleteAlert", "글 삭제 실패");
        return "redirect:/fund/list";
    }


    @GetMapping("write")
    public String fundWrite(Model model, HttpSession session,LocationVo locationVo) {
        MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");

        List<LocationVo> locationList = service.getLocationList(locationVo);
        if (memberLog == null) {
            model.addAttribute("alertMsg", "로그인 후 이용 가능합니다.");
            return "member/login";
        }
        model.addAttribute("locationList", locationList);
        return "board/fundraise/fundraise-write";
    }

    //TODO: 업로드 파일을 가져와야함 해결함.
    @PostMapping("write")
    public String fundWrite(FundraiseVo fundVo, HttpSession session, HttpServletRequest request, List<MultipartFile> file) throws Exception {
        MemberVo memberLog = (MemberVo) session.getAttribute("memberLog");
        String path = request.getServletContext().getRealPath("/resources/upload/fundraise/");

        List<String> changeFileNames = FileUploader.upload(file, path);
        List<String> originalFileNames = FileUploader.getOriginNameList(file);

        List<FileVo> fileVoList = new ArrayList<FileVo>();
        if (changeFileNames != null) {
            int size = changeFileNames.size();
            for (int i = 0; i < size; i++) {
                FileVo fileVo = new FileVo();
                fileVo.setOriginName(originalFileNames.get(i));
                fileVo.setChangeName(changeFileNames.get(i));
                fileVoList.add(fileVo);
            }
        }
        fundVo.setWriter(memberLog.getNo());

        int result = service.write(fundVo, fileVoList);
        if (result <= 0) {
            throw new RuntimeException("글 작성 실패");
        }
        return "redirect:/fund/list";
    }

        @PostMapping("donate")
    public String fundDonate(FundraiseVo vo,HttpSession session) {
        int result = service.fundDonate(vo);
        if(result > 0){
        session.setAttribute("fundDonateAlert","기부 성공");
        return "redirect:/fund/detail?no=" + vo.getFundraiseNo();
        }
        session.setAttribute("fundDonateAlert","기부에 실패했습니다. 다시 시도해주세요.");
        return "redirect:/fund/detail?no=" + vo.getFundraiseNo();
    }
   @GetMapping("edit")
    public String fundEdit(Model model, @RequestParam("no") int no){
//        FundraiseVo fundVo  = (FundraiseVo) model.getAttribute("fundDetail");
//        model.addAttribute("fundVo", fundVo);
	   FundraiseVo vo = service.getFundDetail(no);
	   
	   model.addAttribute("fundDetail", vo);
      return "board/fundraise/fundraise-edit";
    }

    @PostMapping("edit")
    public String fundEdit(FundraiseVo fundEdit, HttpSession session) {
        int result = service.edit(fundEdit);
        log.info("fundVo in edit method {} ", fundEdit);
        if (result > 0) {
            session.setAttribute("alertMsg", "기부 성공");
            return "redirect:/fund/detail?no=" + fundEdit.getFundraiseNo();
        }
        session.setAttribute("alertMsg", "기부에 실패했습니다. 다시 시도해주세요.");
        return "redirect:/fund/detail?no=" + fundEdit.getFundraiseNo();
    }

}
