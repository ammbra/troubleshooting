package com.example.hello;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HelloController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HelloController.class);

    @Value("${spring.location: default}")
	String location;
    
    @RequestMapping("/")
    public String index() {
            return String.format("Greetings from Spring Boot! Welcome from location %s", location);
    }

}
