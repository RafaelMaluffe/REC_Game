package com.br.recgame.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Jogo {
    @Id
    private Integer idJogo;
    private String descricao;
    private Date dataCadastro;

    public Jogo() {};

    public Integer getIdJogo() {
        return idJogo;
    }

    public void setIdJogo(Integer idJogo) {
        this.idJogo = idJogo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    @Override
    public String toString() {
        return "Jogo [dataCadastro=" + dataCadastro + ", descricao=" +
        descricao + ", idJogo=" + idJogo + "]";
    };

    
    
    
}
