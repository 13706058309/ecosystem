package com.cykj;

import com.cykj.entity.Talent;
import com.cykj.service.impl.TalentServiceImpl;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
public class DemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
//        Map<String,Object> map = new HashMap<>();
//        map.put("compID",3);
//        TalentServiceImpl talentService = new TalentServiceImpl();
//        for (Talent talent : talentService.findUnviTalentOnPage(map)) {
//            System.out.println(talent);
//        }
    }
}
