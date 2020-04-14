package com.example.answer.controller;

import com.example.answer.entity.JudgeQuestion;
import com.example.answer.entity.ManyQuestion;
import com.example.answer.entity.SingleQuestion;
import com.example.answer.entity.User;
import com.example.answer.service.AdminService;
import com.example.answer.service.QuestionService;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/api/")
@Slf4j
public class SuccessController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AdminService adminService;
    @PostMapping("success")
    public String submit(@RequestParam("1") String answer1,
            @RequestParam("2") List<String> answer2,
            @RequestParam("3") String answer3,
            HttpServletRequest request, HttpServletResponse response){
        log.debug(answer1);
        answer2.forEach(a->{
            log.debug(a);
        });
        int aa = 1;
        String a = request.getParameter(aa+"");
        log.debug(a);
        log.debug(answer3);
        request.setAttribute("score",100);
        return "score";
    }
    @PostMapping("admin/setanswer")
    public String getQuestion(@RequestParam String username,@RequestParam String password, HttpServletRequest request){
        if (adminService.verifyAdmin(username,password))
        {
            request.getSession().setAttribute("user",new User());
            List<SingleQuestion> singleQuestions = questionService.getAllSingle();
            List<ManyQuestion> manyQuestions = questionService.getAllMany();
            List<JudgeQuestion> judgeQuestions = questionService.getAllJudge();
            request.setAttribute("single",singleQuestions);
            request.setAttribute("many",manyQuestions);
            request.setAttribute("judge",judgeQuestions);
            request.setAttribute("singlesize",singleQuestions.size());
            request.setAttribute("manysize",manyQuestions.size());
            request.setAttribute("judgesize",judgeQuestions.size());
            return "setanswer";
        }
        else
        {
            return "erro";
        }
    }
    @PostMapping("/admin/submit")
    public String setAnswer(HttpServletRequest request){
        String answer;
        List<SingleQuestion> singleQuestions = questionService.getAllSingle();
        for (SingleQuestion single: singleQuestions) {
            answer = request.getParameter(single.getId()+"");
            if(answer!=null)
            {
                questionService.updateSingleAnswer(single.getId(),answer);
            }

        }
        List<ManyQuestion> manyQuestions = questionService.getAllMany();
        for (ManyQuestion many: manyQuestions){
            String []answers = request.getParameterValues(many.getId()+singleQuestions.size()+"");
            answer = "";
            if(answers!= null)
            {
                for(int i = 0;i<answers.length;i++)
                {
                    if (answers[i]!=null) {
                        answer +=answers[i];
                    }
                }
            }

            //log.debug(answer);
            if(!answer.equals(""))
            {questionService.updateManyAnswer(many.getId(),answer);}

        }
        List<JudgeQuestion> judgeQuestions = questionService.getAllJudge();
        for (JudgeQuestion judge:judgeQuestions){
            answer = request.getParameter(judge.getId()+manyQuestions.size()+singleQuestions.size()+"");
            if(answer!=null)
            {
                questionService.updateJudgeAnswer(judge.getId(),answer);
            }

        }
       return "success";
    }
}
