package com.example.answer.repository;

import com.example.answer.entity.ManyQuestion;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ManyQuestionRepository extends BaseRepository<ManyQuestion,Integer> {
    @Modifying
    @Query("update ManyQuestion  many set  many.correctSelect =:answer where many.id =:id")
    int setAnswerById(@Param("answer") String answer, @Param("id") int id);
}
