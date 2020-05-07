package com.example.answer;

import com.example.answer.component.UserUtil;
import com.example.answer.entity.User;
import com.example.answer.repository.UserRepository;
import com.example.answer.service.UserService;
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
public class UserTest {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;
    @Test
    public void test_finduser(){
        log.debug(userRepository.findByIdCard("140581199911190018").toString());
    }
    @Test
    public void test_updateScore(){
        log.debug("{}",userRepository.updateMaxScoreById(60,1));
    }
    @Test
    public void test_UserUtil(){
        UserUtil userUtil = new UserUtil();
        User user = userRepository.findById(3);
        //log.debug(user.toString());
        log.debug("{}", userUtil.maxScore(user.getScoreList()));
        userService.updateScoreById(3);
    }
}
