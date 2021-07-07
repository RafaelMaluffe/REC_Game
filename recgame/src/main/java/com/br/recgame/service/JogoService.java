package com.br.recgame.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.br.recgame.model.Jogo;
import com.br.recgame.repository.JogoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JogoService {

    @Autowired
    private JogoRepository repository;

    public List<Jogo> listarJogo(){
        return repository.findAll();
    }

    public void inserirJogo(Map<String, Object> jogo ) {
        Jogo jog = new Jogo();
        jog.setIdJogo(Integer.parseInt(jogo.get("idJogo").toString()));
        jog.setDescricao(jogo.get("descricao").toString());
        try {
            jog.setDataCadastro(new SimpleDateFormat("dd/MM/yy").
            parse(jogo.get("dataCadastro").toString()));
        } catch (Exception e) {
            jog.setDataCadastro(null);
        }

    }
    
}
