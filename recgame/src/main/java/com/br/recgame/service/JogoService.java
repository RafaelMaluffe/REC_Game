package com.br.recgame.service;

import java.util.List;
import com.br.recgame.model.Jogo;
import com.br.recgame.repository.JogoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JogoService {

    @Autowired
    private JogoRepository repository;
    @Autowired
    private SequenciaService seq;


    public List<Jogo> listarJogo(){
        return repository.findAll();
    }

    public void inserirJogo(Jogo jogo ) {
       
        jogo.setIdJogo(seq.proxima_sequencia(jogo.SEQUENCIA));
        repository.insert(jogo);

    }
    
    public void alterarJogo(Jogo jogo){
        repository.save(jogo);
    }

    public void deletarJogo(Long id){
        Jogo jogo = new Jogo();
        jogo.setIdJogo(id);
        repository.delete(jogo);
    }
    

}
