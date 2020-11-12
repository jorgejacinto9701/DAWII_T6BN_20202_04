package com.colegio.controller;

import java.util.List;
import java.util.Optional;

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
	
	@RequestMapping("/consultaCrudEditorial")
	public String consulta(String filtro, HttpSession session) {
		List<Editorial> lista = editorialservice.listarPorNombre(filtro + "%");
		session.setAttribute("editoriales", lista);
		return "crudEditorial";
	}
	
	@RequestMapping("/registraActualizaCrudEditorial")
	public String insertaActualiza(Editorial editorial, HttpSession session) {
		try {
			Editorial obj = editorialservice.insertarActualizaEditorial(editorial);
			if (obj == null) {
				session.setAttribute("MENSAJE", "Error al insertar o actualizar");
			}else {
				session.setAttribute("MENSAJE", "Insertado y actualizado correctamente");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al Insertar o actualizar");
		}
		return "redirect:salidaEditorial";
	}
	
	@RequestMapping("/eliminaCrudEditorial")
	public String elimina(String id, HttpSession session) {
		try {
			Optional<Editorial> obj = editorialservice.buscaPorId(Integer.parseInt(id));
			if (obj.isPresent()) {
				editorialservice.eliminaEditorial(Integer.parseInt(id));
				session.setAttribute("MENSAJE", "Se elimina correctamente");
			}else {
				session.setAttribute("MENSAJE", "El ID enviado no existe");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al eliminar");
		}
		return "redirect:salidaEditorial";
	}
	
	@RequestMapping("/salidaEditorial")
	public String salida( HttpSession session) {
		List<Editorial> lista = editorialservice.listarTodos();
		session.setAttribute("editoriales", lista);
		return "crudEditorial";
	}
	
	
}
