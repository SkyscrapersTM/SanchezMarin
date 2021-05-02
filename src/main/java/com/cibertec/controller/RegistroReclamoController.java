package com.cibertec.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.entidad.Reclamo;
import com.cibertec.entidad.TipoReclamo;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.servicio.ReclamoServicio;
import com.cibertec.servicio.TipoReclamoServicio;

/**
 * 
 * @author Sebas
 *
 */

@Controller
public class RegistroReclamoController {

	@Autowired
	ClienteServicio clienteservice;

	@Autowired
	ReclamoServicio service;

	@Autowired
	TipoReclamoServicio tipoReclamoservicio;

	@RequestMapping("RegistraReclamo")
	@ResponseBody
	public HashMap<String, Object> registrar(Reclamo obj) {
		HashMap<String, Object> salida = new HashMap<>();
	
		obj.setFechaRegistro(new Date());
		Reclamo objSalida = service.save(obj);

		if (objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		} else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida;
	}

	@RequestMapping("/listaCliente")
	@ResponseBody
	public List<Cliente> listarCliente() {
		List<Cliente> lstCliente = clienteservice.listar();
		return lstCliente;

	}

	@RequestMapping("/listaTipoReclamo")
	@ResponseBody
	public List<TipoReclamo> listarTipoReclamo() {
		List<TipoReclamo> lstTipoReclamo = tipoReclamoservicio.listar();
		return lstTipoReclamo;
	}

}
