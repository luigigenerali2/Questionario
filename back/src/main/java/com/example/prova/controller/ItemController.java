package com.example.prova.controller;

import com.example.prova.entity.Item;
import com.example.prova.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("api/item")
public class ItemController {
    @Autowired
    ItemRepository itemRepo;

    @GetMapping("get-itens/{cod_ques}")
    ResponseEntity<List<Item>> getItemByQuestao(@PathVariable(value = "cod_ques") Long codQues) {
        List<Item> items = itemRepo.findByCodQues(codQues);
        if (items.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(items);
    }
}
