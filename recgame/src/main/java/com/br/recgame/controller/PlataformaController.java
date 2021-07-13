package com.br.recgame.controller;

import java.util.List;
import java.util.Map;

import com.br.recgame.model.Plataforma;
import com.br.recgame.service.PlataformaService;

//import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/plataforma")
public class PlataformaController {


    @Autowired
    private PlataformaService service;

   // @CrossOrigin(origins = "*")
    @GetMapping
    public List<Plataforma> listaPlataforma() {
        return service.listarPlataformas();
    }


    @PostMapping
    public void inserirPlataforma(@RequestBody Map<String, Object> plataforma){
       // JSONObject jsonPlataforma = new JSONObject(plataforma);
        service.inserirPlataforma(plataforma);

    }
}
