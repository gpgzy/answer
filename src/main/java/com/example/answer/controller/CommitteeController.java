package com.example.answer.controller;

import com.example.answer.entity.*;
import com.example.answer.service.BranchService;
import com.example.answer.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

@Controller
public class CommitteeController {
    @Autowired
    private BranchService branchService;
    @Autowired
    private ScoreService scoreService;
    @GetMapping("/committee/alluser")
    public String getAll(HttpServletRequest request){
    List<User> list = new LinkedList<>();
    try{
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        request.setAttribute("users",list);
        request.setAttribute("name",admin.getCommittee().getName());
        List<Branch> branches = admin.getCommittee().getBranch();
        request.setAttribute("branchs",branches);
        request.setAttribute("message","");
        return "committeesearch";
    }
    catch (Exception e){
        throw new ResponseStatusException(HttpStatus.FORBIDDEN,"请登录后访问");
    }
}
    @PostMapping("/committee/user")
    public String getUser(HttpServletRequest request,@RequestParam String branchname){
        Branch branch = branchService.getBranchByName(branchname);
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        List<User> users = branch.getUsers();
        request.setAttribute("users",users);
        request.setAttribute("name",admin.getCommittee().getName());
        List<Branch> branches = admin.getCommittee().getBranch();
        request.setAttribute("branchs",branches);
        request.setAttribute("message",branchname+"答题情况");
        return "committeesearch";
    }
    @GetMapping("/committee/branch")
    public String getBranch(HttpServletRequest request){
        try{
            Admin admin = (Admin) request.getSession().getAttribute("admin");
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
        catch (Exception e){
            throw new ResponseStatusException(HttpStatus.FORBIDDEN,"请登录后访问");
        }

    }
}
