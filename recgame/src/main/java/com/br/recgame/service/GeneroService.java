package com.br.recgame.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.br.recgame.model.Genero;
import com.br.recgame.repository.GeneroRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneroService {

    @Autowired
    private GeneroRepository repository;

    public List<Genero> listarGenero(){
        return repository.findAll();

    }

    public void inserirGenero(Map<String, Object> genero){
        Genero gen = new Genero();

        gen.setIdGenero(Integer.parseInt(genero.get("idGenero").toString()));
        gen.setDescricao(genero.get("descricao").toString());
        try {
            gen.setDataCadastro(new SimpleDateFormat("dd/MM/yyyy").parse(genero.get("dataCadastro").toString()));
        } catch (Exception e) {
            gen.setDataCadastro(null);
        
        }
        repository.insert(gen);
    
}
