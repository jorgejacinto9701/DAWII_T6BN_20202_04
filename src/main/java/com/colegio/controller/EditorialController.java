package com.colegio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Editorial;
import com.colegio.entidad.Pais;
import com.colegio.servicio.EditorialServicio;
import com.colegio.servicio.PaisServicio;

@Controller
public class EditorialController {

	@Autowired
	private EditorialServicio editorialservice;
	@Autowired
	private PaisServicio paisservice;
	
	@RequestMapping("/verEditorial")
	public String ver() {
		return "Registra Editorial";
	}
	
	@RequestMapping("/ListaPais")
	@ResponseBody
	public List<Pais> listaPais() {
		return paisservice.listaPais();
	}
	@RequestMapping("/insertaEditorial")
	public String regEditorial(Editorial obj, HttpSession session) {
		try {
			Editorial objSalida = editorialservice.insertarEditorial(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se registra correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:registraEditorial";
	}
	
}
