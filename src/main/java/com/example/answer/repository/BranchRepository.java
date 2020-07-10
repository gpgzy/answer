package com.example.answer.repository;

import com.example.answer.entity.Branch;
import com.example.answer.entity.Committee;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BranchRepository extends BaseRepository<Branch,Integer> {
    @Query("select c from Branch c where c.name =:name")
    Branch findByName(@Param("name") String name);
    Branch findById(@Param("id") int id);
}
