package com.example.quoteapi.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.example.quoteapi.model.Conversation;
import com.example.quoteapi.model.Message;
import com.example.quoteapi.repository.ConversationRepository;
import com.example.quoteapi.repository.MessageRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/api/conversations")
public class ConversationController {

    @Autowired
    private ConversationRepository conversationRepository;

    @Autowired
    private MessageRepository messageRepository;

    @PostMapping("/message")
    public Message saveMessage(@RequestParam String userName, @RequestParam String text) {
        Optional<Conversation> optionalConversation = conversationRepository.findByUserName(userName);
        Conversation conversation;
        if (optionalConversation.isPresent()) {
            conversation = optionalConversation.get();
        } else {
            conversation = new Conversation();
            conversation.setUserName(userName);
            conversationRepository.save(conversation);
        }

        Message userMessage = new Message();
        userMessage.setContent(text);
        userMessage.setTimestamp(LocalDateTime.now());
        userMessage.setConversation(conversation);
        messageRepository.save(userMessage);

        // Fetch a random quote from the quotes API
        RestTemplate restTemplate = new RestTemplate();
        String quoteApiUrl = "http://localhost:8080/api/quotes/random";
        String randomQuoteResponse = restTemplate.getForObject(quoteApiUrl, String.class);

        // Parse the JSON response to extract the text property
        ObjectMapper objectMapper = new ObjectMapper();
        String randomQuoteText = "";
        try {
            JsonNode jsonNode = objectMapper.readTree(randomQuoteResponse);
            randomQuoteText = jsonNode.get("text").asText();
        } catch (Exception e) {
            e.printStackTrace();
            randomQuoteText = "Error fetching quote";
        }

        Message botMessage = new Message();
        botMessage.setContent(randomQuoteText);
        botMessage.setTimestamp(LocalDateTime.now());
        botMessage.setConversation(conversation);
        messageRepository.save(botMessage);

        return botMessage;
    }

    @GetMapping
    public List<Conversation> getAllConversations() {
        return conversationRepository.findAll();
    }

    @GetMapping("/{userName}")
    public List<Message> getConversationByUserName(@PathVariable String userName) {
        System.out.println("Fetching conversation for user: " + userName);
        Optional<Conversation> optionalConversation = conversationRepository.findByUserName(userName);
        if (optionalConversation.isPresent()) {
            System.out.println("Conversation found for user: " + userName);
            Conversation conversation = optionalConversation.get();
            List<Message> messages = messageRepository.findByConversation(conversation);
            conversation.setMessages(messages);
            System.out.println("Messages: " + messages);
            return messages;
        } else {
            System.out.println("No conversation found for user: " + userName);
            return null;
        }
    }
}
