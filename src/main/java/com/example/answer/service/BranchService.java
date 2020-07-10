package com.example.answer.service;

import com.example.answer.entity.Branch;
import com.example.answer.entity.Committee;
import com.example.answer.repository.BranchRepository;
import com.example.answer.repository.CommitteeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BranchService {
    @Autowired
    private BranchRepository branchRepository;
    @Autowired
    private CommitteeRepository committeeRepository;
    public Branch getBranchById(int id){
        return branchRepository.findById(id);
    }
    public Committee getCommitteeById(int id){
        return committeeRepository.findById(id);
    }
    public Branch getBranchByName(String name){
        return branchRepository.findByName(name);
    }
    public Committee getByCommitteeName(String name){
        return committeeRepository.findByName(name);
    }
    public List<Committee> getAllCommittee(){
        return committeeRepository.findAll();
    }
}
