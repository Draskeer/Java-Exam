package com.example.quoteapi.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.quoteapi.model.Conversation;
import com.example.quoteapi.model.Message;

public interface MessageRepository extends MongoRepository<Message, String> {
    List<Message> findByConversation(Conversation conversation);
}
