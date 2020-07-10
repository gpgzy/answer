package com.example.answer.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Row {
    private String name;
    private int sum;//参与人数
    private String ratio;//参与率
    private int max_100;
    private int max_90;
    private int max_80;
    private int max_70;
    private int max_60;
    private double aver;
}
