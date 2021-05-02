package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.TipoReclamo;
import com.cibertec.repositorio.TipoReclamoRepository;

@Service
public class TipoReclamoServicioImpl implements TipoReclamoServicio{

	@Autowired
	TipoReclamoRepository repository;
	
	@Override
	public List<TipoReclamo> listar() {
		return repository.findAll();
	}

}
