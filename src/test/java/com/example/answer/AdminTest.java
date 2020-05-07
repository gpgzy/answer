package com.example.answer;

import com.example.answer.entity.Admin;
import com.example.answer.repository.AdminRepository;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Slf4j
@Rollback(value = false)
@Transactional
public class AdminTest {
    @Autowired
    private AdminRepository adminRepository;
    @Test
    public void test_addAdmin(){
        Admin admin = new Admin();
        admin.setUsername("gzz");
        admin.setPassword("123456");
        adminRepository.save(admin);
    }
}
