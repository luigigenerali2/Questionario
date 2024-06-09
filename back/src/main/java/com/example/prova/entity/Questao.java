package com.example.prova.entity;

import jakarta.persistence.*;

@Entity
@Table(name="questao")
public class Questao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="cod_ques")
    private Long cod_ques;
    @Column(name="qtdi_ques")
    private int qtde_ques;
    @Column(name="resp_ques")
    private int resp_ques;
    @Column(name="enu_ques")
    private String enu_ques;

    public Questao() {
        this(0L, 0, 0, "");
    }
    public Questao(Long cod_ques, int qtde_ques, int resp_ques, String enu_ques) {
        this.cod_ques = cod_ques;
        this.qtde_ques = qtde_ques;
        this.resp_ques = resp_ques;
        this.enu_ques = enu_ques;
    }

    public Long getCod_ques() {
        return cod_ques;
    }

    public void setCod_ques(Long cod_ques) {
        this.cod_ques = cod_ques;
    }

    public int getQtde_ques() {
        return qtde_ques;
    }

    public void setQtde_ques(int qtde_ques) {
        this.qtde_ques = qtde_ques;
    }

    public int getResp_ques() {
        return resp_ques;
    }

    public void setResp_ques(int resp_ques) {
        this.resp_ques = resp_ques;
    }

    public String getEnu_ques() {
        return enu_ques;
    }

    public void setEnu_ques(String enu_ques) {
        this.enu_ques = enu_ques;
    }
}
