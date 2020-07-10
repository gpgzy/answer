package com.example.answer.repository;

import com.example.answer.entity.Committee;
import com.example.answer.entity.JudgeQuestion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommitteeRepository extends BaseRepository<Committee,Integer> {
    @Query("select c from Committee c where c.name =:name")
    Committee findByName(@Param("name") String name);
    Committee findById(@Param("id") int id);
}
