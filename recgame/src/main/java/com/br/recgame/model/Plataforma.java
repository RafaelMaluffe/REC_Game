package com.br.recgame.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Plataforma {
    @Id
    private Integer idPlataforma;
    private String descricao;
    private Date dataCadastro;

    public Plataforma() {}

    public Integer getIdPlataforma() {
        return idPlataforma;
    }

    public void setIdPlataforma(Integer idPlataforma) {
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
