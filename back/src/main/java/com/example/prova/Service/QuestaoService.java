package com.example.prova.Service;

import com.example.prova.entity.Questao;
import com.example.prova.repository.QuestaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestaoService {
    @Autowired
    QuestaoRepository questaoRepository;

}
