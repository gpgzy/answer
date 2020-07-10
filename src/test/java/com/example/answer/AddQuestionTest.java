//package com.example.answer;
//
//import com.example.answer.entity.Committee;
//import com.example.answer.entity.JudgeQuestion;
//import com.example.answer.entity.ManyQuestion;
//import com.example.answer.entity.SingleQuestion;
//import com.example.answer.repository.JudgeQuestionRepository;
//import com.example.answer.repository.ManyQuestionRepository;
//import com.example.answer.repository.SingleQuestionRepository;
//import jxl.Cell;
//import jxl.Sheet;
//import jxl.Workbook;
//import jxl.read.biff.BiffException;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.annotation.Rollback;
//import org.springframework.test.context.ActiveProfiles;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.InputStream;
//
//@SpringBootTest
//@Slf4j
//@Rollback(value = false)
//@Transactional
//public class AddQuestionTest {
//    @Autowired
//    private SingleQuestionRepository singleQuestionRepository;
//    @Autowired
//    private JudgeQuestionRepository judgeQuestionRepository;
//    @Autowired
//    private ManyQuestionRepository manyQuestionRepository;
//    @Test
//    public void addSingle(){
//        //singleQuestionRepository.deleteAll();
//        try{
//            jxl.Workbook wb =null;
//            InputStream is = new FileInputStream("D://single_qinshui.xls");
//            wb = Workbook.getWorkbook(is);
//
//            int sheetSize = wb.getNumberOfSheets();
//            Sheet sheet = wb.getSheet(0);
//            int row_total = sheet.getRows();
//            for (int j = 1; j < row_total; j++) {
//                SingleQuestion singleQuestion = new SingleQuestion();
//                Cell[] cells = sheet.getRow(j);
//                singleQuestion.setQuestion(cells[1].getContents());
//                singleQuestion.setSelectA(cells[2].getContents());
//                singleQuestion.setSelectB(cells[3].getContents());
//                singleQuestion.setSelectC(cells[4].getContents());
//                singleQuestion.setSelectD(cells[5].getContents());
//                singleQuestion.setCorrectSelect(cells[6].getContents());
//                //log.debug(singleQuestion.toString());
//                singleQuestionRepository.save(singleQuestion);
//            }
//        }catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (BiffException e){
//            e.printStackTrace();
//        }
//    }
//    @Test
//    public void addMany(){
//        try{
//            jxl.Workbook wb =null;
//            InputStream is = new FileInputStream("D://many_qinshui.xls");
//            wb = Workbook.getWorkbook(is);
//
//            int sheetSize = wb.getNumberOfSheets();
//            Sheet sheet = wb.getSheet(0);
//            int row_total = sheet.getRows();
//            for (int j = 1; j < row_total; j++) {
//                ManyQuestion manyQuestion = new ManyQuestion();
//                Cell[] cells = sheet.getRow(j);
//               manyQuestion.setQuestion(cells[1].getContents());
//                manyQuestion.setSelectA(cells[2].getContents());
//                manyQuestion.setSelectB(cells[3].getContents());
//                manyQuestion.setSelectC(cells[4].getContents());
//                manyQuestion.setSelectD(cells[5].getContents());
//                if (!cells[6].getContents().equals("")){
//                    manyQuestion.setSelectE(cells[6].getContents());
//                }
//                if (!cells[7].getContents().equals("")){
//                    manyQuestion.setSelectF(cells[7].getContents());
//                }
//                manyQuestion.setCorrectSelect(cells[8].getContents());
//                //log.debug(manyQuestion.toString());
//                manyQuestionRepository.save(manyQuestion);
//            }
//        }catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (BiffException e){
//            e.printStackTrace();
//        }
//    }
//    @Test
//    public void addJudge(){
//        try{
//            jxl.Workbook wb =null;
//            InputStream is = new FileInputStream("D://judge_qinshui.xls");
//            wb = Workbook.getWorkbook(is);
//
//            int sheetSize = wb.getNumberOfSheets();
//            Sheet sheet = wb.getSheet(0);
//            int row_total = sheet.getRows();
//            for (int j = 1; j < row_total; j++) {
//                JudgeQuestion judgeQuestion = new JudgeQuestion();
//                Cell[] cells = sheet.getRow(j);
//               judgeQuestion.setQuestion(cells[1].getContents());
//               judgeQuestion.setAnswer(cells[2].getContents());
//               //log.debug(judgeQuestion.toString());
//               judgeQuestionRepository.save(judgeQuestion);
//            }
//        }catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (BiffException e){
//            e.printStackTrace();
//        }
//    }
//}
