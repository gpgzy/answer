package com.example.answer.repository;

import com.example.answer.entity.JudgeQuestion;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface JudgeQuestionRepository extends BaseRepository<JudgeQuestion,Integer> {
    @Modifying
    @Query("update JudgeQuestion  judge set  judge.answer =:answer where judge.id =:id")
    int setAnswerById(@Param("answer") String answer, @Param("id") int id);
}
