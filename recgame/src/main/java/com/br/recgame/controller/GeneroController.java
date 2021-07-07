package com.br.recgame.controller;

import java.util.List;
import java.util.Map;

import com.br.recgame.model.Genero;
import com.br.recgame.service.GeneroService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/genero")
public class GeneroController {

    @Autowired
    private GeneroService service;

    @GetMapping
    public List<Genero> listarGenero(){
        return service.listarGenero();
    }

    @PostMapping
    public void inserirGenero(@RequestBody Map<String, Object> genero){
        service.inserirGenero(genero);
    }

}
