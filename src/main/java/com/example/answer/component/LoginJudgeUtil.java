package com.example.answer.component;

public class LoginJudgeUtil {
    public static boolean judge( String name, String idCard,
                                 String committee,String branch,
                                 String telNo){
        boolean result = true;
        if(name.length()>10||name.length()<=1)
            result = false;
        if (idCard.length()>19||idCard.length()<13)
            result  =false;
        if (committee.length()>30||branch.length()>30)
            result = false;
        if (telNo.length()!= 11)
            result = false;
        return result;
    }
}
