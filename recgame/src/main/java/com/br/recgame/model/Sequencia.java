package com.br.recgame.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Sequencia {

    @Id
    private String id;

    private long sequencia;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public long getSequencia() {
        return sequencia;
    }

    public void setSequencia(long sequencia) {
        this.sequencia = sequencia;
    }

    
    
}
