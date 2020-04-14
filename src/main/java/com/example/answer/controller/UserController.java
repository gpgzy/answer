package com.example.answer.controller;

import com.example.answer.component.TimeUtil;
import com.example.answer.entity.*;
import com.example.answer.service.QuestionService;
import com.example.answer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/api/")
public class UserController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserService userService;
    @PostMapping("submit")
    public String getAnswer(@RequestParam String idCard, HttpServletRequest request){
        int sum = 0;
        User user = userService.findUserByIdCard(idCard);
        String answer;
        List<SingleQuestion> singleQuestions = questionService.getAllSingle();
        for (SingleQuestion single: singleQuestions) {
            answer = request.getParameter(single.getId()+"");
            if (answer!=null&& answer.equals(single.getCorrectSelect()))
            {
                sum++;
            }
        }
        List<ManyQuestion> manyQuestions = questionService.getAllMany();
        for (ManyQuestion many: manyQuestions){
            String []answers = request.getParameterValues(many.getId()+singleQuestions.size()+"");
            answer = "";
            if (answers!= null)
            {
                for(int i = 0;i<answers.length;i++)
                {
                    if (answers[i]!=null) {
                        answer +=answers[i];
                    }
                }
            }

            //log.debug(answer);
           if (answer!= null && answer.equals(many.getCorrectSelect()))
           {
               sum++;
           }
        }
        List<JudgeQuestion> judgeQuestions = questionService.getAllJudge();
        for (JudgeQuestion judge:judgeQuestions){
            answer = request.getParameter(judge.getId()+manyQuestions.size()+singleQuestions.size()+"");
            if(answer!=null&&answer.equals(judge.getAnswer()))
            {
                sum++;
            }
        }
        request.setAttribute("score",sum);
        Score score = new Score();
        score.setScores(sum);
        score.setUser(user);
        userService.addScore(score);
        userService.updateScoreById(user.getId());
        request.setAttribute("time", TimeUtil.getLocalTime());
        return "score";
    }
}
