<template>
  <div class="container mt-5">
    <h1 class="mb-4">Questionário</h1>
    <div v-if="questao" class="card mb-4">
      <div class="card-body">
        <h2 class="card-title">{{ questao.enu_ques }}</h2>
        <ul class="list-group mb-4">
          <li v-for="(item, index) in itens" :key="index" class="list-group-item">
            <div class="form-check">
              <input class="form-check-input" type="radio" :value="item.num_item" v-model="respostaSelecionada" :disabled="questao.respondida" />
              <label class="form-check-label">
                {{ item.text_item }}
              </label>
            </div>
          </li>
        </ul>
        <button class="btn btn-primary" @click="enviarResposta" :disabled="questao.respondida">Responder</button>
      </div>
    </div>
    <div v-else>
      Carregando questão...
    </div>
    <div v-if="feedback" class="alert alert-info">
      <p>{{ feedback }}</p>
      <button class="btn btn-secondary" @click="proximaQuestao">Próxima questão</button>
    </div>
    <div class="mt-4">
      <h3>Histórico de Questões</h3>
      <ul class="list-group">
        <li v-for="(q, index) in historicoQuestoes" :key="index" class="list-group-item list-group-item-action" @click="carregarQuestao(q.cod_ques)">
          {{ q.enu_ques }} - <span :class="{'text-success': q.respondida, 'text-danger': !q.respondida}">{{ q.respondida ? 'Respondida' : 'Não respondida' }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'QuestionarioComponent',
  created() {
    this.QuestaoRandomica();
  },
  data() {
    return {
      questao: null,
      itens: [],
      respostaSelecionada: null,
      feedback: '',
      historicoQuestoes: []
    };
  },
  methods: {
    async QuestaoRandomica() {
      try {
        const response = await axios.get('http://localhost:8080/api/questao/get-rand-questao');
        this.questao = response.data;
        this.questao.respondida = false;
        this.historicoQuestoes.push(this.questao);

        const itensResponse = await axios.get(`http://localhost:8080/api/item/get-itens/${this.questao.cod_ques}`);
        this.itens = itensResponse.data;
      } catch (error) {
        console.error('Erro ao obter a questão ou itens:', error);
      }
    },
    async enviarResposta() {
      if (this.respostaSelecionada === null) {
        alert('Selecione uma resposta!');
        return;
      }

      try {
        const response = await axios.get(`http://localhost:8080/api/questao/get-resposta/${this.questao.cod_ques}`);
        const respostaCorreta = response.data;
        console.log(this.respostaSelecionada)
        if (Number(this.respostaSelecionada) === Number(respostaCorreta)) {
          this.feedback = 'Resposta correta!';
        } else {
          this.feedback = `Resposta incorreta! Resposta correta: ${respostaCorreta}`;
        }
        this.questao.respondida = true;
        this.atualizarHistorico();
      } catch (error) {
        console.error('Erro ao verificar a resposta:', error);
      }
    },
    proximaQuestao() {
      this.feedback = '';
      this.respostaSelecionada = null;
      this.itens = [];
      this.QuestaoRandomica();
    },
    async carregarQuestao(id) {
      try {
        const response = await axios.get(`http://localhost:8080/api/questao/get-questao/${id}`);
        this.questao = response.data;
        
        const itensResponse = await axios.get(`http://localhost:8080/api/item/get-itens/${this.questao.cod_ques}`);
        this.itens = itensResponse.data;
      } catch (error) {
        console.error('Erro ao carregar a questão ou itens:', error);
      }
    },
    atualizarHistorico() {
      const index = this.historicoQuestoes.findIndex(q => q.cod_ques === this.questao.cod_ques);
      if (index !== -1) {
        this.historicoQuestoes[index].respondida = true;
      }
    }
  }
};
</script>
