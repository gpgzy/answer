package com.example.answer;

import com.example.answer.entity.Admin;
import com.example.answer.entity.Branch;
import com.example.answer.entity.Committee;
import com.example.answer.entity.User;
import com.example.answer.repository.AdminRepository;
import com.example.answer.repository.BranchRepository;
import com.example.answer.repository.CommitteeRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.util.List;

@SpringBootTest
@Slf4j
@Rollback
@Transactional
public class AdminTest {
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private CommitteeRepository committeeRepository;
    @Autowired
    private BranchRepository branchRepository;
    @Test
    public void test_addAdmin(){
        Admin admin = new Admin();
        admin.setUsername("gzy");
        admin.setRole(Admin.Role.SUPER);
        admin.setPassword("123456");
        //adminRepository.save(admin);
    }
    @Test
    public void test_addGov(){
        Admin admin = new Admin();
        admin.setUsername("zzb");
        admin.setRole(Admin.Role.GOV);
        admin.setPassword("zzb123456");
        //adminRepository.save(admin);
    }
    @Test
    public void test_AddCommitteeAdmin(){
        List<Committee> committees = committeeRepository.findAll();
        for (Committee committee:committees){
            Admin admin = new Admin();
            DecimalFormat decimalFormat = new DecimalFormat("00");
            admin.setUsername("140521"+decimalFormat.format(committee.getId()));
            admin.setRole(Admin.Role.COMMITTEE);
            admin.setPassword("140521"+decimalFormat.format(committee.getId())+"123");
            admin.setCommittee(committee);
            //adminRepository.save(admin);
        }
    }
    @Test
    public void test_getCommittee(){
        Committee committee = committeeRepository.findById(1);
        List<Branch> branchList = committee.getBranch();
//        for (Branch branch:branchList){
//            //log.debug(branch.getName());
//            List<User> users = branch.getUsers();
//            for (User user:users){
//                log.debug(user.getName());
//            }
//        }
        Branch branch = branchRepository.findById(1);
        List<User> users = branch.getUsers();
        for (User user:users){
            log.debug(user.getName());
        }
    }
}
