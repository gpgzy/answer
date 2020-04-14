package com.example.answer.service;

import com.example.answer.component.UserUtil;
import com.example.answer.entity.Score;
import com.example.answer.entity.User;
import com.example.answer.repository.ScoreRepository;
import com.example.answer.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@Transactional
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ScoreRepository scoreRepository;
    /**
     *
     * @param user
     * @return
     */
    public List<User> addUser(User user){
        userRepository.save(user);
        log.debug("insert user"+user.getName());
        return userRepository.findAll();
    }
    public User findUserByIdCard(String idCard){
        User user = userRepository.findByIdCard(idCard);
        return user;
    }
    public int updateScoreById(int id){
        User user =userRepository.findById(id);
        UserUtil userUtil = new UserUtil();
        return userRepository.updateMaxScoreById(userUtil.maxScore(user.getScoreList()),id);
    }
    public List<Score> addScore(Score score){
        scoreRepository.save(score);
        return scoreRepository.findAll();
    }
    public List<User> getAll(){
        return userRepository.findAll();
    }
    public List<User> getAll(String committee){
        return userRepository.findByCommittee(committee);
    }
    public List<User> getAll(String committee,String branch){
        return userRepository.findByBranch(branch);
    }
    public int maxScore(List<User> list){
        if (list.size()==0)
        {return 0;}
        else {
            int max = -1;
            for (User user:list) {
                if(max<user.getMaxScore())
                {
                    max = user.getMaxScore();
                }
            }
            return max;
        }

    }
    public int minScore(List<User> list){
        if (list.size()==0)
        {return 0;}
        else {
            int min = 200;
            for (User user:list) {
                if(min>user.getMaxScore())
                {
                    min = user.getMaxScore();
                }
            }
            return min;
        }

    }
    public double averScore(List<User> list){
        if (list.size()==0)
            return 0;
        else {
            int sum = 0;
            for (User user:list) {
                sum += user.getMaxScore();
            }
            double aver =(double) sum/(double)list.size();
            return aver;
        }

    }
}
