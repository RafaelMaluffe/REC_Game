package com.br.recgame.controller;

import java.util.List;
import java.util.Map;

import com.br.recgame.model.Genero;
import com.br.recgame.service.GeneroService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/genero")
public class GeneroController {

    @Autowired
    private GeneroService service;

    @CrossOrigin(origins = "*")
    @GetMapping
    public List<Genero> listarGenero(){
        return service.listarGenero();
    }

    @CrossOrigin(origins = "*")
    @PostMapping
    public void inserirGenero(@RequestBody Map<String, Object> genero){
        service.inserirGenero(genero);
    }
    
    @CrossOrigin(origins = "*")
    @PutMapping
    public void alterarGenero(@RequestBody Map<String, Object> genero){
        service.AlterarGenero(genero);

    }

    @CrossOrigin(origins = "*")
    @DeleteMapping
    public void deletarGenero(@RequestBody Map<String, Object> genero){
        service.DeletarGenero(genero);

    }

}
