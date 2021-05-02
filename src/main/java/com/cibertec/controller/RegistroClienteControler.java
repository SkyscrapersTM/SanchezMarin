package com.cibertec.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.servicio.ClienteServicio;

@Controller
public class RegistroClienteControler {

	
	/**
	 * Auto Deyvis
	 */
	@Autowired
	private ClienteServicio clienteServicio;
	
	@RequestMapping("/registroCliente")
	@ResponseBody
	public HashMap<String, Object> registroCliente(Cliente obj) {
		HashMap<String, Object> salida = new HashMap<>();
		Cliente objSalida = clienteServicio.insertaCliente(obj);
		try {
			if(objSalida != null) {
				salida.put("Mensaje", "Se Registro Correctamente");
			}else {
				salida.put("Mensaje", "Error al registrar");
			}
		} catch (Exception e) {
			salida.put("Mensaje", "Hackeo el sistema");
			e.printStackTrace();
		}
		
		return salida;
	}
	
}
