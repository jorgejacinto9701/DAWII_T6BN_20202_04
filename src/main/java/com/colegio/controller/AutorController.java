package com.colegio.controller;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Autor;
import com.colegio.entidad.Pais;
import com.colegio.servicio.AutorService;
import com.colegio.servicio.PaisServicio;

@Controller
public class AutorController {

	
	@Autowired
	private PaisServicio paisServicio;
	
	@Autowired
	private AutorService autorService;
	

	@RequestMapping("/verAutor")
	public String ver() {
		return "Registra Autor";
	}
	

	
	@RequestMapping("/cargaPais")
	@ResponseBody
	public List<Pais> listaPais() {
		return paisServicio.listaPais();
	}
	
	@RequestMapping("/consultaCrudAutor")
	public String consultaAutor(String filtro, HttpSession session) {
		List<Autor> lista = autorService.listarPorNombreAutor(filtro + "%");
		session.setAttribute("autores", lista);
		return "crudAutor";
	}
	
	@RequestMapping("/registraActualizaCrudAutor")
	public String insertaActualizaAutor(Autor autor, HttpSession session) {
		try {
			Autor obj = autorService.insertaAutor(autor);
			if (obj == null) {
				session.setAttribute("MENSAJE", "Error al insertar o actualizar");
			}else {
				session.setAttribute("MENSAJE", "Insertado y actualizado correctamente");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al Insertar o actualizar");
		}
		return "redirect:salidaAutor";
	}
	
	@RequestMapping("/eliminaCrudAutor")
	public String eliminaAutor(String id, HttpSession session) {
		try {
			Optional<Autor> obj = autorService.buscaPorIdAutor(Integer.parseInt(id));
			if (obj.isPresent()) {
				autorService.eliminaAutor(Integer.parseInt(id));
				session.setAttribute("MENSAJE", "Se elimina correctamente");
			}else {
				session.setAttribute("MENSAJE", "El ID enviado no existe");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al eliminar");
		}
		return "redirect:salidaAutor";
	}
	
	@RequestMapping("/salidaAutor")
	public String salida( HttpSession session) {
		List<Autor> lista = autorService.listarTodos();
		session.setAttribute("autores", lista);
		return "crudAutor";
	}
	
	
		
}
