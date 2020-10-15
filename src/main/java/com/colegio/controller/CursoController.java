package com.colegio.controller;


import java.util.List;

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
		return "redirect:registraCurso";
	}
	
	
}
