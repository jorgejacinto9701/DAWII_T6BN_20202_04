package com.colegio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Autor;
import com.colegio.entidad.AutorHasInvestigacion;
import com.colegio.entidad.AutorHasInvestigacionPK;
import com.colegio.entidad.Investigacion;
import com.colegio.servicio.AutorHasInvestigacionService;
import com.colegio.servicio.AutorService;
import com.colegio.servicio.InvestigacionService;

@Controller
public class AutorInvestigacionController {

	@Autowired
	private AutorService autorService;
	
	@Autowired
	private InvestigacionService investigacionService;
	
	@Autowired
	private AutorHasInvestigacionService autorHasInvestigacionService;
	
	
	@RequestMapping("/cargaTodosAutor")
	@ResponseBody
	public List<Autor> cargaAutor() {
		return autorService.listarTodos();
	}
	
	@RequestMapping("/cargaTodosInvestigacion")
	@ResponseBody
	public List<Investigacion> cargaInvestigacion() {
		return investigacionService.listaTodos();
	}
	
	@RequestMapping("/cargaInvestigacionPorAutor")
	@ResponseBody
	public List<Investigacion> cargaInvestigacionPorAutorint(int idAutor) {
		return investigacionService.listaTodosPorAutor(idAutor);
	}
	
	@RequestMapping("/agregarUnaInvestigacionPorAutor")
	@ResponseBody
	public List<Investigacion> agregarUnaInvestigacionPorAutor(int idInvestigacion, int idAutor) {
		
		AutorHasInvestigacionPK pk = new AutorHasInvestigacionPK();
		pk.setIdAutor(idAutor);
		pk.setIdInvestigacion(idInvestigacion);
		
		AutorHasInvestigacion obj = new AutorHasInvestigacion();
		obj.setAutorHasInvestigacionPK(pk);
		
		autorHasInvestigacionService.inserta(obj);
		return investigacionService.listaTodosPorAutor(idAutor);
	}
	
	@RequestMapping("/eliminaUnaInvestigacionPorAutor")
	@ResponseBody
	public List<Investigacion> eliminaUnaInvestigacionPorAutor(int idInvestigacion, int idAutor) {
		AutorHasInvestigacionPK pk = new AutorHasInvestigacionPK();
		pk.setIdAutor(idAutor);
		pk.setIdInvestigacion(idInvestigacion);
		
		AutorHasInvestigacion obj = new AutorHasInvestigacion();
		obj.setAutorHasInvestigacionPK(pk);
		
		autorHasInvestigacionService.elimina(obj);
		return investigacionService.listaTodosPorAutor(idAutor);
	}
	
	@RequestMapping("/agregarTodosInvestigacionPorAutor")
	@ResponseBody
	public List<Investigacion> agregarTodosInvestigacionPorAutor(int idAutor) {
		
		List<Investigacion> lista = investigacionService.listaTodosPorAutor(idAutor);
		for (Investigacion x : lista) {
			AutorHasInvestigacionPK pk = new AutorHasInvestigacionPK();
			pk.setIdAutor(idAutor);
			pk.setIdInvestigacion(x.getIdInvestigacion());
			
			AutorHasInvestigacion obj = new AutorHasInvestigacion();
			obj.setAutorHasInvestigacionPK(pk);
			
			autorHasInvestigacionService.elimina(obj);
		}
		
		List<Investigacion> todos = investigacionService.listaTodos();
		for (Investigacion x : todos) {
			AutorHasInvestigacionPK pk = new AutorHasInvestigacionPK();
			pk.setIdAutor(idAutor);
			pk.setIdInvestigacion(x.getIdInvestigacion());
			
			AutorHasInvestigacion obj = new AutorHasInvestigacion();
			obj.setAutorHasInvestigacionPK(pk);
			
			autorHasInvestigacionService.inserta(obj);
		}
		
		return todos;
	}
	
	@RequestMapping("/eliminarTodosInvestigacionPorAutor")
	@ResponseBody
	public List<Investigacion> eliminarTodosInvestigacionPorAutor(int idAutor) {
		
		List<Investigacion> lista = investigacionService.listaTodosPorAutor(idAutor);
		for (Investigacion x : lista) {
			AutorHasInvestigacionPK pk = new AutorHasInvestigacionPK();
			pk.setIdAutor(idAutor);
			pk.setIdInvestigacion(x.getIdInvestigacion());
			
			AutorHasInvestigacion obj = new AutorHasInvestigacion();
			obj.setAutorHasInvestigacionPK(pk);
			
			autorHasInvestigacionService.elimina(obj);
		}
		
		return new ArrayList<Investigacion>();
	}

}
