package com.br.recgame.controller;

import java.util.List;
import java.util.Map;

import com.br.recgame.model.Plataforma;
import com.br.recgame.service.PlataformaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;

@RestController
@RequestMapping("/plataforma")
public class PlataformaController {


    @Autowired
    private PlataformaService service;

    @CrossOrigin(origins = "*")
    @GetMapping
    public List<Plataforma> listaPlataforma() {
        return service.listarPlataformas();
    }

    @CrossOrigin(origins = "*")
    @PostMapping
    public void inserirPlataforma(@RequestBody Map<String, Object> plataforma){
        service.inserirPlataforma(plataforma);

    }

    @CrossOrigin(origins = "*")
    @PutMapping
    public void alterarPlataforma(@RequestBody Map<String, Object> plataforma){
        service.AlterarPlataforma(plataforma);

    }

    @CrossOrigin(origins = "*")
    @DeleteMapping
    public void deletarPlataforma(@RequestBody Map<String, Object> plataforma){
        service.DeletarPlataforma(plataforma);

    }

}
