package com.example.answer.service;

import com.example.answer.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

@Service
@Transactional
public class ScoreService {
    public List<User> findUserByScore(List<User> list,int score){
        List<User> list1 = new LinkedList<>();
        for (User user:list){
            if (user.getMaxScore()>=score){
                list1.add(user);
            }
        }
        return list1;
    }
    public int maxUserSum(List<User> list,int score){
        //List<User> list1 = new LinkedList<>();
        int sum = 0;
        if (list == null){
            return 0;
        }
        else {
            for (User user:list){
                if (user.getMaxScore()>=score){
                    sum++;
                }
            }
            return sum;
        }
    }
}
