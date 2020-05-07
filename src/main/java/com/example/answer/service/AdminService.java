package com.example.answer.service;

import com.example.answer.entity.Admin;
import com.example.answer.repository.AdminRepository;
import org.aspectj.lang.annotation.Around;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;
    public boolean verifyAdmin(String username,String password){
        List<Admin> list = adminRepository.findAll();
        for (Admin a :
                list) {
            if (username.equals(a.getUsername())&&password.equals(a.getPassword()))
            {
                return true;
            }
        }
        return false;
    }
    public List<Admin> addAdmin(Admin admin){
        adminRepository.save(admin);
        return  adminRepository.findAll();
    }
}
