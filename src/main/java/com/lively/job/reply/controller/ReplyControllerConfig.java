package com.lively.job.reply.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.gson.Gson;
import com.lively.job.reply.dao.ReplyDao;
import com.lively.job.reply.service.ReplyService;

@Configuration
public class ReplyControllerConfig {
    
    @Bean
    public Gson gson() {
        return new Gson();
    }
    
    @Bean
    public ReplyService replyService(ReplyDao dao, SqlSessionTemplate sst) {
        return new ReplyService(dao, sst); // ReplyService의 생성 방식에 따라 적절하게 변경해야 합니다.
    }
    
    @Bean
    public ReplyController replyController(ReplyService replyService, Gson gson) {
        return new ReplyController(replyService, gson);
    }
}