package com.example.answer.controller;

import com.example.answer.entity.*;
import com.example.answer.service.BranchService;
import com.example.answer.service.ScoreService;
import com.example.answer.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

@Controller
@Slf4j
public class GovController {
    @Autowired
    private BranchService branchService;
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private UserService userService;
    @GetMapping("/gov/branch")
    public String getBranch(HttpServletRequest request){
        List<Row> list = new LinkedList<>();
        request.setAttribute("row",list);
        List<Committee> list1 = branchService.getAllCommittee();
        request.setAttribute("committees",list1);
        request.setAttribute("message","");
        return "govsearch";
    }
    @PostMapping("/gov/branch")
    public String getBranchInfo(HttpServletRequest request,@RequestParam String committeename){
        Committee committee  = branchService.getByCommitteeName(committeename);
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
            //log.debug("{}",list.size());
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
        List<Committee> list1 = branchService.getAllCommittee();
        request.setAttribute("committees",list1);
        request.setAttribute("message",committeename+"支部答题情况");
        return "govsearch";
    }
    @GetMapping("/gov/all")
    public String  getAll(HttpServletRequest request){
        List<Committee> list = branchService.getAllCommittee();
        List<Row> rowList = new LinkedList<>();
        for (Committee committee:list){
            //List<Branch> list1 = committee.getBranch();
            List<User> users = userService.getByCommittee(committee.getId()) ;
//            for (Branch branch:list1){
//                //log.debug("123");
//                users.addAll(branch.getUsers());
//            }
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
    }
    @GetMapping("/gov/user")
    public String getAdminUser( HttpServletRequest request){
        List<User> list = new LinkedList<>();
        request.setAttribute("users",list);
        request.setAttribute("message","");
        return "govuser";
    }
    @PostMapping("/gov/user")
    public String getUser(HttpServletRequest request,@RequestParam String committee,@RequestParam String branchname){
        Branch branch = branchService.getBranchByName(branchname);
        List<User> users = branch.getUsers();
        request.setAttribute("users",users);
        request.setAttribute("message",committee+" "+branchname+"答题情况");
        return "govuser";
    }

}
