package com.lively.fundraise.reply.controller;

import com.google.gson.Gson;
import com.lively.fundraise.reply.dao.FundraiseReplyDao;
import com.lively.fundraise.reply.service.FundraiseReplyService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;

@Controller
public class FundraiseReplyControllerConfig {
    @Bean
    public Gson gson() {
        return new Gson();
    }

    @Bean
    public FundraiseReplyService replyService(FundraiseReplyDao dao, SqlSessionTemplate sst) {
        return new FundraiseReplyService(dao, sst);
    }

    @Bean
    public FundraiseReplyController replyController(FundraiseReplyService replyService, Gson gson) {
        return new FundraiseReplyController(replyService, gson);
    }
}
