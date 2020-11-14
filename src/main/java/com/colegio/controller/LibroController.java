package com.colegio.controller;

import java.awt.Dialog.ModalityType;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Libro;
import com.colegio.entidad.TipoLibro;
import com.colegio.servicio.LibroService;
import com.colegio.servicio.TipoLibroService;

@Controller
public class LibroController {

	@Autowired
	private TipoLibroService tipoLibroService;
	
	@Autowired
	private LibroService libroService;
	
	@RequestMapping("/consultaCrudLibro")
	public String consultaCrudd(String filtro, HttpSession session) {
		List<Libro> lista = libroService.listarPorNombre(filtro+"%");
		session.setAttribute("libros", lista);
		return "crudLibro";
	}
	
	@RequestMapping("/afuera")
	public String afueraa(HttpSession session) {
		List<Libro> lista = libroService.listarTodos();
		session.setAttribute("libros", lista);
		return "crudLibro";
	}
	
	@RequestMapping("/cargaTipoLibro")
	@ResponseBody
	public List<TipoLibro> listaTipoLibro(){
		return tipoLibroService.listarTodos();
	}
	
	@RequestMapping("/registraActualizaCrudLibro")
	public String RegistraActualiza(Libro obj, HttpSession session) {
		try {
			Libro afuera = libroService.insertaActualizaLibro(obj);
			if(afuera == null) {
				session.setAttribute("MENSAJE", "Existe ERROR");
			}else {
				session.setAttribute("MENSAJE", "Registro o actualizacion correcta");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:afuera";
	}
	
	
	@RequestMapping("/eliminaCrudLibro")
	public String delete(Integer id, HttpSession session) {
		try {
			Optional<Libro> obj = libroService.buscarPorId(id);
			if(obj.isPresent()) {
				libroService.eliminaLibro(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe ID");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		
		return "redirect:afuera";
	}
	
	
	
	
	
	
	
	
	
	
}






