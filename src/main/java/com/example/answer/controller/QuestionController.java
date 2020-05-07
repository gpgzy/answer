package com.example.answer.controller;

import com.example.answer.entity.Admin;
import com.example.answer.entity.JudgeQuestion;
import com.example.answer.entity.ManyQuestion;
import com.example.answer.entity.SingleQuestion;
import com.example.answer.service.AdminService;
import com.example.answer.service.QuestionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@Slf4j
@RequestMapping("/api/")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AdminService adminService;
    @PostMapping("admin/addSingle")
    public Map addSingle(@RequestBody SingleQuestion singleQuestion){
        singleQuestion.setCorrectSelect("");
        questionService.addSingle(singleQuestion);
        return Map.of("result","success");
    }
    @PostMapping("admin/addMany")
    public Map addMany(@RequestBody ManyQuestion manyQuestion){
        manyQuestion.setCorrectSelect("");
        questionService.addMany(manyQuestion);
        return Map.of("result","success");
    }
    @PostMapping("admin/addJudge")
    public Map addJudge(@RequestBody JudgeQuestion judgeQuestion){
        judgeQuestion.setAnswer("");
        questionService.addJudge(judgeQuestion);
        return Map.of("result","success");
    }
    @PostMapping("admin/addadmin")
    public Map addAdmin(@RequestBody Admin admin){
        adminService.addAdmin(admin);
        return Map.of("result","success");
    }
}
