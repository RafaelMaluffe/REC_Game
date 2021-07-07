package com.br.recgame.repository;

import com.br.recgame.model.Plataforma;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface PlataformaRepository extends MongoRepository<Plataforma, Integer> {
}
