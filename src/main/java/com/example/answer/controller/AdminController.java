package com.example.answer.controller;

import com.example.answer.entity.User;
import com.example.answer.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.List;

@Controller
@RequestMapping("/")
@Slf4j
public class AdminController {
    @Autowired
    private UserService userService;
    DecimalFormat df = new DecimalFormat("0.00");
    @GetMapping("/api/admin/login")
    public String getLogin(){
        return "adminLogin";
    }
    @GetMapping("/api/admin/test")
    public String testIndex(){
        return "mobilelogin";
    }
    @GetMapping("")
    public String init(){
        return "login";
    }
    @GetMapping("/mobile")
    public String mobileLogin(){
        return "mobilelogin";
    }
    @GetMapping("/api/admin/findall")
    public String findAll(HttpServletRequest request){
        List<User> list = userService.getAll();
        request.setAttribute("list",list);
        request.setAttribute("max",userService.maxScore(list));
        request.setAttribute("min",userService.minScore(list));
        request.setAttribute("aver",df.format(userService.averScore(list)));
        return "alluser";
    }
    @GetMapping("/api/admin/search")
    public String search(){
        return "search";
    }
    @GetMapping("/api/admin/findByCommittee")
    public String findByCommittee(@RequestParam String committee,HttpServletRequest request){
        List<User> list = userService.getAll(committee);
        request.setAttribute("list",list);
        request.setAttribute("max",userService.maxScore(list));
        request.setAttribute("min",userService.minScore(list));
        request.setAttribute("aver",df.format(userService.averScore(list)));
        return "alluser";
    }
    @GetMapping("/api/admin/findByBranch")
    public String findByBranch(@RequestParam String branch,@RequestParam String committee,HttpServletRequest request ){
        List<User> list = userService.getAll(committee,branch);
        request.setAttribute("list",list);
        request.setAttribute("max",userService.maxScore(list));
        request.setAttribute("min",userService.minScore(list));
        request.setAttribute("aver",df.format(userService.averScore(list)));
        return "alluser";
    }
}
