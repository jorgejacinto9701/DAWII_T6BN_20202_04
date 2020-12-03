package com.colegio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Ciclo;
import com.colegio.entidad.Disponibilidad;
import com.colegio.servicio.CicloService;
import com.colegio.servicio.DisponibilidadService;

@Controller
public class ConsultaDisponibilidadController {

	@Autowired
	private CicloService cicloService;
	
	@Autowired
	private DisponibilidadService disponibilidadService;
	
	@RequestMapping("/listaTotalCiclo")
	@ResponseBody
	public List<Ciclo> listaCiclo() {
		return cicloService.listaCiclo();
	}
	
	@RequestMapping("/consultaDisponibilidad")
	@ResponseBody
	public List<Disponibilidad> consuta(int parametro) {
		if (parametro == 0) {
			return new ArrayList<Disponibilidad>();
		}else if (parametro == -1){
			return disponibilidadService.listaTodos();
		}else {
			return disponibilidadService.listaPorCiclo(parametro);
		}
	}
	
	
}
