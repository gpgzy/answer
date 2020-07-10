package com.example.answer.controller;

import com.example.answer.entity.Branch;
import com.example.answer.entity.Committee;
import com.example.answer.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/ajax/")
public class AjaxController {
    @Autowired
    private BranchService branchService;
    @GetMapping("branch")
    public Map getBranch(@RequestParam String committee){
        Committee committee1 = branchService.getByCommitteeName(committee);
        List<Branch> branchList = committee1.getBranch();
        ArrayList<String> arr = new ArrayList<>();
        for (Branch branch:branchList){
            arr.add(branch.getName());
        }
        return Map.of("branch",arr);
    }
}
