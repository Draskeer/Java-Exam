package com.example.BeHappy.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.BeHappy.model.Message;

public interface MessageRepository extends MongoRepository<Message, String> {
    List<Message> findByUserId(String userId);
}
