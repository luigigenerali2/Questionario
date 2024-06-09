package com.example.prova.Service;

import com.example.prova.repository.ItemRepository;
import com.example.prova.repository.QuestaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemService {
    @Autowired
    ItemRepository itemRepository;
}
