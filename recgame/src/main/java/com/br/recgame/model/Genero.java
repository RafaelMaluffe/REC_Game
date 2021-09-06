package com.br.recgame.model;

import java.util.Date;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Genero {
    @Id
    private long idGenero;
    @Transient
    public final String SEQUENCIA = "genero_sequencia";
    private String descricao;
    private Date dataCadastro;

    public Genero() {};

  

    public long getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(long idGenero) {
        this.idGenero = idGenero;
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

    public void setDataCadastro(Date dataCadasto) {
        this.dataCadastro = dataCadasto;
    }

    @Override
    public String toString(){
        return "Id Genero = " + idGenero + " descricao = " + descricao +
         " dataCadastro = " + dataCadastro;

    }

    
}
