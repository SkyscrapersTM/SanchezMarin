package com.cibertec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistroProductoController {
	
	@RequestMapping("/registroProducto")
	public String registrarProducto() {
		
		return "intranetRegistroProducto";
	}

}
