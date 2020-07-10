package com.example.answer.controller;

import com.example.answer.entity.*;
import com.example.answer.service.*;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

@Controller
@RequestMapping("/api/")
@Slf4j
public class SuccessController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private UserService userService;
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
    public String getQuestion(@RequestParam String username, @RequestParam String password, HttpServletRequest request) {
        if (adminService.verifyAdmin(username, password)) {
            Admin admin = adminService.getAdmin(username, password);
            request.getSession().setAttribute("admin",admin);
            if (admin.getRole() == Admin.Role.SUPER) {
                //request.getSession().setAttribute("user", new User());
                List<SingleQuestion> singleQuestions = questionService.getAllSingle();
                List<ManyQuestion> manyQuestions = questionService.getAllMany();
                List<JudgeQuestion> judgeQuestions = questionService.getAllJudge();
                request.setAttribute("single", singleQuestions);
                request.setAttribute("many", manyQuestions);
                request.setAttribute("judge", judgeQuestions);
                request.setAttribute("singlesize", singleQuestions.size());
                request.setAttribute("manysize", manyQuestions.size());
                request.setAttribute("judgesize", judgeQuestions.size());
                return "setanswer";
            } else if (admin.getRole() == Admin.Role.GOV) {
                List<Committee> list = branchService.getAllCommittee();
                List<Row> rowList = new LinkedList<>();
                for (Committee committee:list){
                    //List<Branch> list1 = committee.getBranch();
                    List<User> users = userService.getByCommittee(committee.getId()) ;;
//                    for (Branch branch:list1){
//                        users.addAll(branch.getUsers());
//                    }
                    int sum = 0 ;
                    for (User user:users){
                        sum+=user.getMaxScore();
                    }
                    Row row = new Row();
                    row.setName(committee.getName());
                    row.setSum(users.size());
                    double aver = (double)sum/users.size();
                    row.setAver(aver);
                    double ratio =(double) users.size()/committee.getSum()*100;
                    DecimalFormat decimalFormat = new DecimalFormat("00.00");
                    row.setRatio(decimalFormat.format(ratio));
                    row.setMax_100(scoreService.maxUserSum(users,100));
                    row.setMax_90(scoreService.maxUserSum(users,90));
                    row.setMax_80(scoreService.maxUserSum(users,80));
                    row.setMax_70(scoreService.maxUserSum(users,70));
                    row.setMax_60(scoreService.maxUserSum(users,60));
                    rowList.add(row);
                }
                request.setAttribute("row",rowList);
                return "govindex";
            } else  {
                Committee committee = admin.getCommittee();
               List<Branch> branchList = committee.getBranch();
               List<Row> rowList = new LinkedList<>();
               for (Branch branch:branchList){
                   List<User> list = branch.getUsers();
                   int sum = 0;
                   for (User user:list){
                       sum+=user.getMaxScore();
                   }
                   Row row = new Row();
                   row.setName(branch.getName());
                   row.setSum(list.size());
                   double aver = (double)sum/list.size();
                   row.setAver(aver);
                   double ratio =(double) list.size()/branch.getSum()*100;
                   DecimalFormat decimalFormat = new DecimalFormat("00.00");
                   row.setRatio(decimalFormat.format(ratio));
                   row.setMax_100(scoreService.maxUserSum(list,100));
                   row.setMax_90(scoreService.maxUserSum(list,90));
                   row.setMax_80(scoreService.maxUserSum(list,80));
                   row.setMax_70(scoreService.maxUserSum(list,70));
                   row.setMax_60(scoreService.maxUserSum(list,60));
                   rowList.add(row);
               }
               request.setAttribute("row",rowList);
                request.setAttribute("name",admin.getCommittee().getName());
                return "committeeindex";
            }
        } else {
            return "passworderro";
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
