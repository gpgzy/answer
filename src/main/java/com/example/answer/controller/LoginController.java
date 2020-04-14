package com.example.answer.controller;

import com.example.answer.component.LoginJudgeUtil;
import com.example.answer.component.TimeUtil;
import com.example.answer.entity.JudgeQuestion;
import com.example.answer.entity.ManyQuestion;
import com.example.answer.entity.SingleQuestion;
import com.example.answer.entity.User;
import com.example.answer.service.QuestionService;
import com.example.answer.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.management.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpResponse;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/api/")
@Slf4j
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private QuestionService questionService;
    @GetMapping("login")
    public String hello(){
        return "login";
    }
    @PostMapping("login")
    public String login(@RequestParam String name, @RequestParam String idCard,
                        @RequestParam String committee,@RequestParam String branch,
                        @RequestParam String telNo,@RequestParam String inputStr,
                        HttpSession session, HttpServletRequest request){
        if (LoginJudgeUtil.judge(name, idCard, committee, branch, telNo)==false)
            return "erro";
        User user = new User();
        user.setName(name);
        user.setIdCard(idCard);
        user.setMaxScore(0);
        user.setCommittee(committee);
        user.setBranch(branch);
        user.setTelNo(telNo);
        log.debug(user.toString());
        request.setAttribute("now", TimeUtil.getLocalTime());
        try{
            String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
            if (random == null||!random.equals(inputStr)) {
                log.debug("null");
                return "erro";
            }
            else if (random.equals(inputStr)) {
                log.debug("true");
                request.getSession().setAttribute("user",user);
                if(userService.findUserByIdCard(idCard)==null)
                {
                    userService.addUser(user);
                    request.setAttribute("message","欢迎首次答题");
                }
                else
                {
                    User user1 = userService.findUserByIdCard(idCard);
                    Integer sc = 0;
                    if(user1.getMaxScore()!=null)
                    {
                        sc = user1.getMaxScore();
                    }
                    String max = sc+"";
                    String times = user1.getScoreList().size()+"";
                    String message = "你已经做题"+times+"次"+"，历史最高分为"+max+"分";
                    request.setAttribute("message",message);
                }
                List<SingleQuestion> singleQuestions = questionService.getAllSingle();
                List<ManyQuestion> manyQuestions = questionService.getAllMany();
                List<JudgeQuestion> judgeQuestions = questionService.getAllJudge();
                request.setAttribute("single",singleQuestions);
                request.setAttribute("many",manyQuestions);
                request.setAttribute("judge",judgeQuestions);
                request.setAttribute("idCard",idCard);
                request.setAttribute("singlesize",singleQuestions.size());
                request.setAttribute("manysize",manyQuestions.size());
                request.setAttribute("judgesize",judgeQuestions.size());
                request.setAttribute("uname",user.getName());
                return "index";
            }
        }catch (Exception e){

            return "erro";
        }
        return "index1";
    }


}
