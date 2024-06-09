package com.example.prova.controller;


import com.example.prova.entity.Questao;
import com.example.prova.repository.QuestaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.Optional;
import java.util.List;
import java.util.Random;

@RestController
@RequestMapping("api/questao")
public class QuestaoController {

    @Autowired
    QuestaoRepository quesRepo;

    @GetMapping("get-questao/{id}")
    ResponseEntity<Questao> getQuestao(@PathVariable(value = "id") Long id) {
        Optional<Questao> questao = quesRepo.findById(id);
        if (questao.isPresent()) {
            return ResponseEntity.ok().body(questao.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("get-rand-questao")
    ResponseEntity<Questao> getQuestaoAleatoria() {
        List<Questao> questoes = quesRepo.findAll();
        if (questoes.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Random random = new Random();
        int randomIndex = random.nextInt(questoes.size());
        Questao randomQuestao = questoes.get(randomIndex);
        return ResponseEntity.ok().body(randomQuestao);
    }

    @GetMapping("get-resposta/{id}")
    ResponseEntity<Integer> getResposta(@PathVariable(value="id") Long id) {
        Optional<Questao> questao = quesRepo.findById(id);
        if (questao.isPresent()) {
            int resposta = questao.get().getResp_ques();
            return ResponseEntity.ok().body(resposta);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
