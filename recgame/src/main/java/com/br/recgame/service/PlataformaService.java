package com.br.recgame.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.br.recgame.model.Plataforma;
import com.br.recgame.repository.PlataformaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlataformaService {
    
    @Autowired
    private PlataformaRepository repository;

    public List<Plataforma> listarPlataformas() {
        return repository.findAll();
    }

    public void inserirPlataforma(Map<String, Object> plataforma) {
        Plataforma plat = new Plataforma();
        plat.setIdPlataforma(Integer.parseInt(plataforma.get("idPlataforma").toString()));
        plat.setDescricao(plataforma.get("descricao").toString());
        try {
            plat.setDataCadastro(new SimpleDateFormat("dd/MM/yyyy").parse(plataforma.get("dataCadastro").toString())); 
        } catch (Exception e) {
            plat.setDataCadastro(null);
        }
        repository.insert(plat);

    }
}
