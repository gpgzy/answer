package com.example.answer.repository;

import com.example.answer.entity.Score;
import org.springframework.stereotype.Repository;

@Repository
public interface ScoreRepository extends BaseRepository<Score,Integer> {
}
