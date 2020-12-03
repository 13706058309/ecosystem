package com.cykj;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.WebApplicationInitializer;


@SpringBootApplication
@MapperScan("com.cykj.mapper")
@EnableScheduling
public class DemoApplication extends SpringBootServletInitializer {
    public static void main(String[] args) {
        System.out.println("运行了主函数前");
        SpringApplication.run(DemoApplication.class, args);
        System.out.println("运行了主函数后");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(DemoApplication.class);
    }
}
