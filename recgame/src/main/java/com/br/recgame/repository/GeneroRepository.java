package com.br.recgame.repository;

import com.br.recgame.model.Genero;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface GeneroRepository extends MongoRepository<Genero, Integer> {
    
}
