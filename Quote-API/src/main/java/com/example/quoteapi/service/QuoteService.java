package com.example.quoteapi.service;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.example.quoteapi.model.Quote;
import com.example.quoteapi.repository.QuoteRepository;

@Service
public class QuoteService {
    private final QuoteRepository quoteRepository;

    public QuoteService(QuoteRepository quoteRepository) {
        this.quoteRepository = quoteRepository;
    }

    public Quote getRandomQuote() {
        List<Quote> quotes = quoteRepository.findAll();
        if (quotes.isEmpty()) {
            throw new IllegalStateException("No quotes available");
        }
        Random random = new Random();
        return quotes.get(random.nextInt(quotes.size()));
    }

    public Quote saveQuote(Quote quote) {
        return quoteRepository.save(quote);
    }
}
