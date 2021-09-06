package com.br.recgame.service;

import org.springframework.stereotype.Service;
import com.br.recgame.model.Sequencia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Update;

import java.util.Objects;

import static org.springframework.data.mongodb.core.FindAndModifyOptions.options;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

@Service
public class SequenciaService {
    @Autowired
        private MongoOperations mongoOperations;
        
    public long proxima_sequencia(String seq){
        //na linha de baixo em nenhum momento está sendo atribuido um valor para sequencia
        Sequencia contador = mongoOperations.findAndModify(query(where("_id").is(seq)), new Update().inc("sequencia",1), options().returnNew(true).upsert(true), Sequencia.class);
        //mas a linha abaixo requesita um, será aqui o erro?
     return !Objects.isNull(contador) ? contador.getSequencia() : 1;
    }
    
}
