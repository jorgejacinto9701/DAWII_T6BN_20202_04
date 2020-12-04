package com.colegio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Autor;
import com.colegio.entidad.Ciclo;
import com.colegio.entidad.Curso;
import com.colegio.entidad.Disponibilidad;
import com.colegio.entidad.Pais;
import com.colegio.entidad.SistemaEvaluacion;
import com.colegio.entidad.SistemadeEvaluacion;
import com.colegio.entidad.TipoUsuario;
import com.colegio.entidad.Usuario;
import com.colegio.servicio.AutorService;
import com.colegio.servicio.CicloService;
import com.colegio.servicio.CursoServicio;
import com.colegio.servicio.DisponibilidadService;
import com.colegio.servicio.PaisServicio;
import com.colegio.servicio.SistemaEvaluacionServicio;
import com.colegio.servicio.TipoUsuarioServicio;
import com.colegio.servicio.UbigeoServicio;
import com.colegio.servicio.UsuarioServicio;

@Controller
public class ConsultaCursoController {

	@Autowired
	private CursoServicio cursoService;
	

	@Autowired
	private SistemaEvaluacionServicio sistemaEvaluacionService;
	

	@RequestMapping("/ListaSistemaEvaluacion")
	@ResponseBody 
	private List<SistemaEvaluacion> ListaTotalSistemaEvaluacion(){
		return sistemaEvaluacionService.listaSistemaEvaluacion();
	}
	
		
	@RequestMapping("/consultaCursoxEvaluacion")
	@ResponseBody
	public List<Curso> consultaCursoEvaluacion(int parametro) {
		List<Curso>lista=null;
		if (parametro == 0) {
			lista= new ArrayList<>();
		}else if (parametro == -1){
			lista= cursoService.listarTodos();
					
		}else {
			lista= cursoService.listarporEvaluacion(parametro);
		}
		return lista;
	}
	
}
