package com.example.answer.service;

import com.example.answer.entity.JudgeQuestion;
import com.example.answer.entity.ManyQuestion;
import com.example.answer.entity.SingleQuestion;
import com.example.answer.repository.JudgeQuestionRepository;
import com.example.answer.repository.ManyQuestionRepository;
import com.example.answer.repository.SingleQuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class QuestionService {
    @Autowired
    private SingleQuestionRepository singleQuestionRepository;
    @Autowired
    private ManyQuestionRepository manyQuestionRepository;
    @Autowired
    private JudgeQuestionRepository judgeQuestionRepository;
    public List<SingleQuestion> addSingle(SingleQuestion singleQuestion){
        singleQuestionRepository.save(singleQuestion);
        return singleQuestionRepository.findAll();
    }
    public List<ManyQuestion> addMany(ManyQuestion manyQuestion){
        manyQuestionRepository.save(manyQuestion);
        return manyQuestionRepository.findAll();
    }
    public List<JudgeQuestion> addJudge(JudgeQuestion judgeQuestion){
        judgeQuestionRepository.save(judgeQuestion);
        return judgeQuestionRepository.findAll();
    }
    public List<SingleQuestion> getAllSingle(){
        return singleQuestionRepository.findAll();
    }
    public List<ManyQuestion> getAllMany(){
        return manyQuestionRepository.findAll();
    }
    public List<JudgeQuestion> getAllJudge(){
        return judgeQuestionRepository.findAll();
    }
    public int updateSingleAnswer(int id,String answer){
        return singleQuestionRepository.setAnswerById(answer,id);
    }
    public int updateManyAnswer(int id,String answer){
        return manyQuestionRepository.setAnswerById(answer,id);
    }
    public int updateJudgeAnswer(int id,String answer){
        return judgeQuestionRepository.setAnswerById(answer,id);
    }
    public SingleQuestion getById(int id){
        return singleQuestionRepository.findById(id);
    }
    public ManyQuestion getManyById(int id){
        return manyQuestionRepository.findById(id);
    }
    public JudgeQuestion getJudgeById(int id){
        return judgeQuestionRepository.findById(id);
    }
}
