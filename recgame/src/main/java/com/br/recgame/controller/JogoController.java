package com.br.recgame.controller;

import java.util.List;
import com.br.recgame.model.Jogo;
import com.br.recgame.service.JogoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/jogo")
public class JogoController {

    @Autowired
    private JogoService service;

    @CrossOrigin(origins = "*")
    @GetMapping
    public List<Jogo> listarJogo(){
        return service.listarJogo();
    }
    @CrossOrigin(origins = "*")
    @PostMapping
    public void inserirJogoJogo(@RequestBody Jogo jogo){
        service.inserirJogo(jogo);
    }

    @CrossOrigin(origins = "*")
    @PutMapping
    public void alterarJogo(@RequestBody Jogo jogo){
        service.alterarJogo(jogo);
    }

    @CrossOrigin(origins = "*")
    @DeleteMapping(value = "/{idJogo}")
    public void deletarJogo(@PathVariable Long idJogo){
        service.deletarJogo(idJogo);

    }
            
}
