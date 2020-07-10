package com.example.answer.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Data
@NoArgsConstructor
public class MyToken {
    private Set<Integer> single;
    private Set<Integer> many;
    private Set<Integer> judge;
}
