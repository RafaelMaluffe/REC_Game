package com.br.recgame.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Jogo {
    @Id
    private Long idJogo;
    @Transient
    public final String SEQUENCIA = "jogo_sequencia";
    private String descricao;
    private Date dataCadastro;
    private String imagem;
    private Long plataforma;
    private List<Long> genero;

    // Provavelmente atributos de avalição e situação

    public Long getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(Long plataforma) {
        this.plataforma = plataforma;
    }

    public List<Long> getGenero() {
        return genero;
    }

    public void setGenero(List<Long> genero) {
        this.genero = genero;
    }

    public Jogo() {
    };

    public Long getIdJogo() {
        return idJogo;
    }

    public void setIdJogo(Long idJogo) {
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

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    @Override
    public String toString() {
        return "Jogo [dataCadastro=" + dataCadastro + ", descricao=" + descricao + ", genero=" + genero + ", idJogo="
                + idJogo + ", plataforma=" + plataforma + "]";
    }

}
