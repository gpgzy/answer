package com.example.answer.repository;

import com.example.answer.entity.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends BaseRepository<User,Integer> {
    @Query("select u from User u where u.idCard =:uidcard")
    User findByIdCard(@Param("uidcard") String idcard);
    @Modifying
    @Query("update User u set u.maxScore =:max where u.id =:id")
    int updateMaxScoreById(@Param("max") int max,@Param("id") int id);
    User findById(@Param("id") int id);
    @Query("select u from User u where u.branch.committees.id=:cid")
    List<User> findByCommitteeId(@Param("cid") int cid);
    @Query("select u from User u where u.telNo=:tel")
    User findByTelNo(@Param("tel") String tel);
}
