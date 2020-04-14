package com.example.answer.component;

import com.example.answer.entity.Score;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;


import java.util.List;

@Slf4j
@Data
public class UserUtil {
    public  int maxScore(List<Score> list){
        int max = -1;
        for (Score score: list) {
            if(max<score.getScores())
            {
                max = score.getScores();
            }
        }
        return max;
    }
}
