package com.example.answer.repository;

import com.example.answer.entity.SingleQuestion;
import com.example.answer.entity.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface SingleQuestionRepository extends BaseRepository<SingleQuestion,Integer> {
    @Modifying
    @Query("update SingleQuestion  single set  single.correctSelect =:answer where single.id =:id")
    int setAnswerById(@Param("answer") String answer,@Param("id") int id);
    SingleQuestion findById(@RequestParam("id") int id);
}
