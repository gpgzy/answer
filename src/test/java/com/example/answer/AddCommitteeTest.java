//package com.example.answer;
//
//import com.example.answer.entity.Branch;
//import com.example.answer.entity.Committee;
//import com.example.answer.repository.BranchRepository;
//import com.example.answer.repository.CommitteeRepository;
//import jxl.Cell;
//import jxl.Sheet;
//import jxl.Workbook;
//import jxl.read.biff.BiffException;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.annotation.Rollback;
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
//public class AddCommitteeTest {
//    @Autowired
//    private CommitteeRepository committeeRepository;
//    @Autowired
//    private BranchRepository branchRepository;
//    @Test
//    public void test_addCommittee(){
//        try{
//            jxl.Workbook wb =null;
//            InputStream is = new FileInputStream("D://comittee_qinshui.xls");
//            wb = Workbook.getWorkbook(is);
//
//            int sheetSize = wb.getNumberOfSheets();
//            Sheet sheet = wb.getSheet(0);
//            int row_total = sheet.getRows();
//            for (int j = 2; j < row_total; j++) {
//                Cell[] cells = sheet.getRow(j);
//                Committee committee = new Committee();
//                committee.setName(cells[1].getContents());
//                committee.setSum(Integer.valueOf(cells[2].getContents()));
//                //committee.setSum(Integer.valueOf(cells[4].getContents()));
//                //log.debug(committee.toString());
//                //System.out.println("<option>"+committee.getName()+"</option>");
//                //System.out.println("<option>"+committee.getName()+"</option>");
//           committeeRepository.save(committee);
//            }
//        }catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (BiffException e){
//            e.printStackTrace();
//        }
//    }
//    @Test
//    public void addBranch(){
//        //branchRepository.deleteAll();
//        try{
//            jxl.Workbook wb =null;
//            InputStream is = new FileInputStream("D://branch_qinshui.xls");
//            wb = Workbook.getWorkbook(is);
//
//            int sheetSize = wb.getNumberOfSheets();
//            Sheet sheet = wb.getSheet(0);
//            int row_total = sheet.getRows();
//            for (int j = 2; j < row_total; j++) {
//                Cell[] cells = sheet.getRow(j);
//                String name = cells[0].getContents();
//                Committee committee = committeeRepository.findByName(name);
//                Branch branch = new Branch();
//                branch.setName(cells[1].getContents());
//                branch.setSum(Integer.valueOf(cells[2].getContents()));
//                branch.setCommittees(committee);
//                //branch.setSum(Integer.valueOf(cells[5].getContents()));
//                //log.debug(branch.getName()+" "+branch.getSum());
//                branchRepository.save(branch);
//            }
//        }catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (BiffException e){
//            e.printStackTrace();
//        }
//    }
//}
