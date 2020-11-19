package com.colegio.controller;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Curso;
import com.colegio.entidad.SistemaEvaluacion;
import com.colegio.servicio.CursoServicio;
import com.colegio.servicio.SistemaEvaluacionServicio;

@Controller
public class CursoController {

	
	@Autowired
	private SistemaEvaluacionServicio sistemaEvaluacionServicio;
	
	@Autowired
	private CursoServicio cursoService;
	

	
	@RequestMapping("/cargaSistemaEvaluacion")
	@ResponseBody
	public List<SistemaEvaluacion> listaSistemaEvaluacion() {
		return sistemaEvaluacionServicio.listaSistemaEvaluacion();
	}
	
	
	
	@RequestMapping("/insertaCurso")
	public String regCurso(Curso obj, HttpSession session) {
		try {
			Curso objSalida = cursoService.insertaCurso(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se registra correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaCurso";
	}
	
	@RequestMapping("/consultaCrudCurso")
	public String consulta(String filtro, HttpSession session) {
		List<Curso> lista = cursoService.listaPorNombre(filtro + "%");
		session.setAttribute("Curso", lista);
		return "crudCurso";
	}
	
	@RequestMapping("/registraActualizaCrudCurso")
	public String insertaActualiza(Curso curso, HttpSession session) {
		try {
			Curso obj = cursoService.insertaCurso(curso);
			if (obj == null) {
				session.setAttribute("MENSAJE", "Error al insertar o actualizar");
			}else {
				session.setAttribute("MENSAJE", "Insertado y actualizado correctamente");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al Insertar o actualizar");
		}
		return "redirect:salidaCurso";
	}
	
	@RequestMapping("/eliminaCrudCurso")
	public String delete(Integer id, HttpSession session) {
		try {
			Optional<Curso> obj = cursoService.buscarPorId(id);
			if(obj.isPresent()) {
				cursoService.eliminarCurso(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe ID");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		
		return "redirect:salidaCurso";
	}
	
	@RequestMapping("/salidaCurso")
	public String salida( HttpSession session) {
		List<Curso> lista = cursoService.listarTodos();
		session.setAttribute("curso", lista);
		return "crudCurso";
	}
	
	
}
