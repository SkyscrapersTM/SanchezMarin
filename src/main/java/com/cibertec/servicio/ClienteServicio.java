package com.cibertec.servicio;

import java.util.List;

import com.cibertec.entidad.Cliente;

public interface ClienteServicio {
	
	public Cliente insertaCliente(Cliente obj);
	public List<Cliente> listar();
}
