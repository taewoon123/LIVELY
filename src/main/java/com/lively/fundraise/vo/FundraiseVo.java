package com.lively.fundraise.vo;


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

    
}
