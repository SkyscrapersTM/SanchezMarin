package com.cibertec.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Reclamo;
import com.cibertec.repositorio.ReclamoRepositorio;

@Service
public class ReclamoServicioImpl implements ReclamoServicio {

	@Autowired
	ReclamoRepositorio repository;

	@Override
	public Reclamo save(Reclamo bean) {
		return repository.save(bean);
	}

}
