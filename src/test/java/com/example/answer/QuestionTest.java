package com.example.answer;

import com.example.answer.entity.Branch;
import com.example.answer.entity.Committee;
import com.example.answer.repository.BranchRepository;
import com.example.answer.repository.CommitteeRepository;
import com.example.answer.repository.SingleQuestionRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.*;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

@SpringBootTest
@Slf4j
@Transactional
@Rollback
public class QuestionTest {
    @Autowired
    private CommitteeRepository committeeRepository;
    @Autowired
    private BranchRepository branchRepository;
    @Autowired
    private SingleQuestionRepository singleQuestionRepository;
    @Test
    public void randomTest(){
        Set<Integer> set =  new HashSet<>();
        while (set.size()<10){
            int random =(int)(Math.random()*100+1);
            set.add(random);
        }
        for (Integer i:set){
            System.out.println(i);
            log.debug(singleQuestionRepository.findById(i).toString());
        }
        System.out.println(set.size());

    }
    @Test
    public void addCommittee(){
        Committee committee = new Committee();
        committee.setName("东城");
        committee.setSum(200);
        //committeeRepository.save(committee);
    }
    @Test
    public void addBranch(){
        Branch branch = new Branch();
        branch.setName("风和");
        branch.setSum(60);
        Committee committee = committeeRepository.findByName("开发区党工委");
        branch.setCommittees(committee);
        //branchRepository.save(branch);
    }
}
