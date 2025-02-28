package com.example.quoteapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@SpringBootApplication
@EnableMongoRepositories(basePackages = "com.example.quoteapi.repository")
public class QuoteApiApplication {
    public static void main(String[] args) {
        SpringApplication.run(QuoteApiApplication.class, args);
    }
}
