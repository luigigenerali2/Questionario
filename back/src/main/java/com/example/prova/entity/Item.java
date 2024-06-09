package com.example.prova.entity;

import jakarta.persistence.*;

@Entity
@Table(name="item")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="cod_item")
    private Long cod_item;
    @Column(name="text_item")
    private String text_item;
    @Column(name="num_item")
    private int num_item;
    @Column(name="cod_ques")
    private Long cod_ques;

    public Item() {
        this(0L, "", 0, 0L);
    }

    public Item(long cod_item, String text_item, int num_item, Long cod_ques) {
        this.cod_item = cod_item;
        this.text_item = text_item;
        this.num_item = num_item;
        this.cod_ques = cod_ques;
    }

    public Long getCod_item() {
        return cod_item;
    }

    public void setCod_item(Long cod_item) {
        this.cod_item = cod_item;
    }

    public String getText_item() {
        return text_item;
    }

    public void setText_item(String text_item) {
        this.text_item = text_item;
    }

    public int getNum_item() {
        return num_item;
    }

    public void setNum_item(int num_item) {
        this.num_item = num_item;
    }

    public Long getCod_ques() {
        return cod_ques;
    }

    public void setCod_ques(Long cod_ques) {
        this.cod_ques = cod_ques;
    }
}
