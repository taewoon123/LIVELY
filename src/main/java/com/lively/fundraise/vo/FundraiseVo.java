package com.lively.fundraise.vo;


import java.util.List;

import com.lively.common.FileVo;
import lombok.Data;

@Data
public class FundraiseVo {
    private String fundraiseNo;
    private String writer;
    private String title;
    private String content;
    private String enrollDate;
    private String editDate;
    private String deleteYn;
    private String views;
    private String money;
    private String moneyGoal;
    private String originName;
    private String changeName;
    private List<FileVo> attList;
    private String donateMoney;
    private String locationNo;
    private String locationName;
}
