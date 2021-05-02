package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Cliente;
import com.cibertec.repositorio.ClienteRepositorio;

@Service
public class ClienteServicioImp implements ClienteServicio {

	@Autowired
	private ClienteRepositorio repository;
	
	public Cliente insertaCliente(Cliente obj) {
		return repository.save(obj);
	}

	@Override
	public List<Cliente> listar() {
		return repository.findAll();
	}

}
