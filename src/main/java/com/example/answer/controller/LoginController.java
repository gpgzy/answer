package com.example.answer.controller;

import com.example.answer.component.EncryptComponent;
import com.example.answer.component.IpUtil;
import com.example.answer.component.LoginJudgeUtil;
import com.example.answer.component.TimeUtil;
import com.example.answer.entity.*;
import com.example.answer.service.BranchService;
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
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/api/")
@Slf4j
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private EncryptComponent encryptComponent;
    @GetMapping("login")
    public String hello(){
        return "login";
    }
    @PostMapping("login")
    public String   login(@RequestParam String name,
                       @RequestParam String branch,
                        @RequestParam String telNo,@RequestParam String inputStr,
                        @RequestParam String identity,
                        HttpSession session, HttpServletRequest request,
                        HttpServletResponse response){
        if (LoginJudgeUtil.judge(name, branch, telNo)==false)
            return "erro";
        request.setAttribute("now", TimeUtil.getLocalTime());
        try{
            String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
            if (random == null||!random.equals(inputStr)) {
                return "erro";
            }
            else if (random.equals(inputStr)) {
                User user = new User();
                user.setName(name);
                user.setMaxScore(0);
                user.setTelNo(telNo);
                Branch branch1 = branchService.getBranchByName(branch);
                user.setBranch(branch1);
                user.setIdentity(identity);
                log.debug(user.getName()+" "+user.getTelNo()+"登录IP "+IpUtil.getIpAddr(request));
                if(userService.getByTel(telNo)==null)
                {
                    userService.addUser(user);
                }
                else if (userService.getByTel(telNo).getMaxScore() !=0){
                    return "nochance";
                }
                Set<Integer> singleset =  new HashSet<>();
                    while (singleset.size()<20){
                        int questionNo =(int)(Math.random()*174+1);
                        singleset.add(questionNo);
                    }
                    //session.setAttribute("singleset",singleset);
                    List<SingleQuestion> singleQuestions = new LinkedList<>();
                    for (Integer i:singleset){
                        SingleQuestion singleQuestion = questionService.getById(i);
                        singleQuestions.add(singleQuestion);
                    }
                    Set<Integer> JudgeSet = new HashSet<>();
                    while (JudgeSet.size()<15){
                        int questionNo =(int)(Math.random()*95+1);
                        JudgeSet.add(questionNo);
                    }
                    Set<Integer> manySet = new HashSet<>();
                    while (manySet.size()<15){
                        int questionNo =(int)(Math.random()*123+1);
                        manySet.add(questionNo);
                    }
                    //session.setAttribute("judgeset",JudgeSet);
                    //session.setAttribute("manyset",manySet);
                    List<ManyQuestion> manyQuestions = new LinkedList<>();
                    List<JudgeQuestion> judgeQuestions = new LinkedList<>();
                    for (Integer i:JudgeSet){
                        JudgeQuestion judgeQuestion = questionService.getJudgeById(i);
                        judgeQuestions.add(judgeQuestion);
                    }
                    for (Integer i:manySet){
                        ManyQuestion manyQuestion = questionService.getManyById(i);
                        manyQuestions.add(manyQuestion);
                    }
                MyToken myToken = new MyToken();
                myToken.setSingle(singleset);
                myToken.setJudge(JudgeSet);
                myToken.setMany(manySet);
                String question = encryptComponent.encryptToken(myToken);
                //log.debug(question);
                response.setHeader("question",question);
                request.setAttribute("question",question);
                    request.setAttribute("tel",telNo);
                    request.setAttribute("single",singleQuestions);
                    request.setAttribute("judge",judgeQuestions);
                    request.setAttribute("many",manyQuestions);
                    request.setAttribute("uname",user.getName());
                    return "index";
            }
        }catch (Exception e){

            return "nochance";
        }
        return "index1";
    }


}
