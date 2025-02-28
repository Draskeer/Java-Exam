package com.example.quoteapi.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.quoteapi.model.Quote;

public interface QuoteRepository extends MongoRepository<Quote, String> {
}
