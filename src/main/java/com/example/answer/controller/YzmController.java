package com.example.answer.controller;
import com.example.answer.component.RandomValidateCodeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
@Slf4j
@RequestMapping("/")
public class YzmController extends HttpServlet {
    @RequestMapping(value = "/api/getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
            //log.debug(randomValidateCode);
        } catch (Exception e) {
            log.error("获取验证码失败>>>> ", e);
        }

    }
    @RequestMapping(value = "/getVerify")
    public void getVerify2(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
            //log.debug(randomValidateCode);
        } catch (Exception e) {
            log.error("获取验证码失败>>>> ", e);
        }

    }
    @PostMapping(value = "checkVerify")
    public String checkVerify(@RequestParam String inputStr,  HttpSession session) {
        try{
            //从session中获取随机数
            //String inputStr = requestMap.get("inputStr").toString();
            String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
            if (random == null) {
                log.debug("null");
                return "erro";
            }
            if (random.equals(inputStr)) {
                log.debug("true");
                return "index";
            } else {
                log.debug("false");
                return "erro";
            }
        }catch (Exception e){

            return "erro";
        }
    }
}
