package com.example.answer;

public class StringBuild2 {
    public static void main(String[] args) {
        String name = "<input id=\"opbtn\" type=\"button\" value=\"添加选项\"/>\t\t\t\t\t<input id=\"delbtn\" type=\"button\" value=\"删除选项\"/>\t\t\t\t\t<!-- <ol id=\"opts\" type=\" \"></ol> -->\t\t\t\t\t<div id=\"opts\">\t\t\t\t\t\t<select id=\"YiJi\" onChange=\"move()\">\t\t\t\t\t\t\t<option>A农、林、牧、渔业</option>\t\t\t\t\t\t\t<option>B采矿业</option>\t\t\t\t\t\t\t<option>C制造业</option>\t\t\t\t\t\t\t<option>D交通运输、仓储和邮政业</option>\t\t\t\t\t\t</select>\t\t\t\t\t\t<select id=\"ErJi\">\t\t\t\t\t\t\t<option selected=\"\">please select</option>\t\t\t\t\t\t</select>\t\t\t\t\t\t本年: 本月<input />千元\t\t\t\t\t\t1-本月<input />千元\t\t\t\t\t\t<br />\t\t\t\t\t\t上年周期：\t\t\t\t\t\t本月<input value=\"56\" readonly />千元\t\t\t\t\t\t1-本月<input value=\"56\" readonly />千元 \t\t\t\t\t\t提示语\t\t\t\t\t\t<span id=\"optips\"></span>\t\t\t\t\t\t<br />";
        char a = name.charAt(0);
        int sum = 0;
        for (int i = 0;i<name.length();i++)
        {
            if (name.charAt(i)==' ')
            {
                sum++;
            }
        }
        String arr[] = name.split("\"", sum+1);
        for (int i = 0;i<arr.length;i++)
        {
            String reslut = arr[i]+"\\"+"\"";
            System.out.print(reslut);
        }
    }
}
