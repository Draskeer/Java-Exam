package com.example.quoteapi.repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.quoteapi.model.Conversation;

public interface ConversationRepository extends MongoRepository<Conversation, String> {
    Optional<Conversation> findByUserName(String userName);
}
