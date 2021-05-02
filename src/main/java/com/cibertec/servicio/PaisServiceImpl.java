
package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Pais;
import com.cibertec.repositorio.PaisRepositorio;

@Service
public class PaisServiceImpl implements PaisServicio{

	@Autowired
	private PaisRepositorio repository;

	@Override
	public List<Pais> listaPais() {
		return repository.findAll();
	}
	



}
