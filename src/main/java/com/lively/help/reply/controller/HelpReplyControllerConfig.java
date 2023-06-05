package com.lively.help.reply.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.gson.Gson;
import com.lively.help.reply.dao.HelpReplyDao;
import com.lively.help.reply.service.HelpReplyService;

@Configuration
public class HelpReplyControllerConfig {
	
	@Bean
	public Gson gson() {
		return new Gson();
	}
	
	@Bean
    public HelpReplyService replyService(HelpReplyDao dao, SqlSessionTemplate sst) {
        return new HelpReplyService(dao, sst);
    }
	
	@Bean
	public HelpReplyController replyController(HelpReplyService replyService, Gson gson) {
		return new HelpReplyController(replyService, gson);
	}
}
