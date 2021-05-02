package com.cibertec.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Marca;
import com.cibertec.entidad.Pais;
import com.cibertec.servicio.MarcaServicio;
import com.cibertec.servicio.PaisServicio;

@Controller
public class RegistroMarcaController {
	@Autowired
    private PaisServicio paisService;
	@Autowired
    public MarcaServicio servicio;

	@RequestMapping("/listaPais")
    @ResponseBody
    public List<Pais> listaPais(){
        return paisService.listaPais();
    }
	
	
    @ResponseBody
    @RequestMapping("/registraMarca")
    public HashMap<String, Object> registrar(Marca obj){
        HashMap<String, Object> salida = new HashMap<>();


        Marca objSalida = servicio.insertaMarca(obj);

        if (objSalida == null) {
            salida.put("MENSAJE", "Registro erróneo");
        }else {
            salida.put("MENSAJE", "Registro exitoso");
        }
        return salida;
    }
	
}
 