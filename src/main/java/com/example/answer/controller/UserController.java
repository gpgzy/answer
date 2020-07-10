package com.example.answer.controller;

import com.example.answer.component.EncryptComponent;
import com.example.answer.component.TimeUtil;
import com.example.answer.entity.*;
import com.example.answer.service.QuestionService;
import com.example.answer.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

@Controller
@RequestMapping("/api/")
@Slf4j
public class UserController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserService userService;
    @Autowired
    private EncryptComponent encryptComponent;
    @PostMapping("submit")
    public String getAnswer(@RequestParam String tel, HttpServletRequest request, HttpServletResponse response){
        int sum = 0;
        User user = userService.getByTel(tel);
        String answer;
        String question =request.getParameter("question") ;
        //log.debug(question);
        MyToken token = encryptComponent.decryptToken(question);
        Set<Integer> set =token.getSingle();
        Set<Integer> judgeSet = token.getJudge();
        Set<Integer> manySet = token.getMany();
//        request.getSession().removeAttribute("singleset");
//        request.getSession().removeAttribute("judgeset");
//        request.getSession().removeAttribute("manyset");
        for (Integer i:set){
            answer = request.getParameter("s_"+i+"");
            String correct = questionService.getById(i).getCorrectSelect();
            if (answer!=null&&answer.equals(correct)){
                sum+=2;
            }
        }
        for (Integer i:manySet){
            String []answers = request.getParameterValues("m_"+i+"");
            String correct = questionService.getManyById(i).getCorrectSelect();
            answer = "";
            if (answers!= null)
            {
                for(int j = 0;j<answers.length;j++)
                {
                    if (answers[j]!=null) {
                        answer +=answers[j];
                    }
                }
            }
            //log.debug(answer);
            if (answer!= null && answer.equals(correct))
            {
                sum+=3;
            }
        }
        for (Integer i:judgeSet){
             answer = request.getParameter("j_"+i+"");
            String correct = questionService.getJudgeById(i).getAnswer();
            if (answer!=null && answer.equals(correct)){
                sum+=1;
            }
        }
        request.setAttribute("name",user.getName());
        request.setAttribute("score",sum);
        request.setAttribute("year",TimeUtil.getYear());
        request.setAttribute("month",TimeUtil.getMonth());
        request.setAttribute("day",TimeUtil.getday());
        Score score = new Score();
        score.setScores(sum);
        score.setUser(user);
        userService.addScore(score);
        userService.updateScoreById(user.getId());
        log.debug(user.getTelNo()+" "+user.getName()+" "+sum);
        request.setAttribute("time", TimeUtil.getLocalTime());
        request.getSession().removeAttribute("user");
        return "score";
    }
}
