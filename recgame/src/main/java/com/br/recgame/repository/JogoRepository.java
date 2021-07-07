package com.br.recgame.repository;

import com.br.recgame.model.Jogo;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface JogoRepository extends MongoRepository<Jogo, Integer> {
    
}
