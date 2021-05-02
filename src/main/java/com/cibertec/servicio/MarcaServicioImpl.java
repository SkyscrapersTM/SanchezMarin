package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Marca;
import com.cibertec.entidad.Ubigeo;
import com.cibertec.repositorio.MarcaRepositorio;
import com.cibertec.repositorio.UbigeoRepositorio;

@Service
public class MarcaServicioImpl implements MarcaServicio {

	@Autowired
    private MarcaRepositorio repository;

    @Override
    public Marca insertaMarca(Marca obj) {
        return repository.save(obj);
    }

}
