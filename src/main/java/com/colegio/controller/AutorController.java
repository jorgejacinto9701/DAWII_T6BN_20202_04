package com.colegio.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Autor;
import com.colegio.entidad.Pais;
import com.colegio.servicio.AutorServicio;
import com.colegio.servicio.PaisServicio;

@Controller
public class AutorController {

	
	@Autowired
	private PaisServicio paisServicio;
	
	@Autowired
	private AutorServicio autorService;
	

	
	@RequestMapping("/cargaPais")
	@ResponseBody
	public List<Pais> listaPais() {
		return paisServicio.listaPais();
	}
	
	
	@RequestMapping("/insertaAutor")
	public String regAutor(Autor obj, HttpSession session) {
		try {
			Autor objSalida = autorService.insertaAutor(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se registra correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:registraAutor";
	}
	
	
}
