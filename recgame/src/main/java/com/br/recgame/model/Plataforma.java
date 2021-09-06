package com.br.recgame.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Plataforma {
    @Id
    private Long idPlataforma;
    @Transient
    public final String SEQUENCIA = "plataforma_sequencia";
    private String descricao;
    private Date dataCadastro;

    public Plataforma() {}

    public Long getIdPlataforma() {
        return idPlataforma;
    }

    public void setIdPlataforma(Long idPlataforma) {
        this.idPlataforma = idPlataforma;
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
        return "Plataforma [dataCadastro=" + dataCadastro + ", descricao=" + descricao + ", idPlataforma="
                + idPlataforma + "]";
    }
}
