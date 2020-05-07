package com.example.answer;

public class StringBuild {
    public static void main(String[] args) {
        String name = "晋城 高平 长治 北京 上海";
        char a = name.charAt(0);
        int sum = 0;
        for (int i = 0;i<name.length();i++)
        {
            if (name.charAt(i)==' ')
            {
                sum++;
            }
        }
        String arr[] = name.split(" ", sum+1);
        for (int i = 0;i<arr.length;i++)
        {
            String reslut = "\""+arr[i]+"\""+",";
            System.out.print(reslut);
        }
    }
}
