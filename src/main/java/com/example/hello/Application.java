package com.example.hello;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

import java.util.Arrays;

@SpringBootApplication
public class Application {
    private static final Logger LOGGER = LoggerFactory.getLogger(Application.class);

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Value("${app.longstartup.enabled}")
    Boolean longerStartupEnabled;

    @Bean
    public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
        if (longerStartupEnabled) {
            try {
                Thread.sleep(20 * 1000);
            } catch (InterruptedException e) {
                LOGGER.error("Exception while starting the app : {}", e);
            }
        }

        return args -> {

            String[] beanNames = ctx.getBeanDefinitionNames();
            Arrays.sort(beanNames);
            for (String beanName : beanNames) {
                LOGGER.info("{} is provided by Spring Boot ", beanName);
            }

        };
    }

}
