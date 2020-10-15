package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.SistemaEvaluacion;
import com.colegio.repositorio.SistemaEvaluacionRepositorio;

@Service
public class SistemaEvaluacionServicioImpl implements SistemaEvaluacionServicio {

	@Autowired
	private SistemaEvaluacionRepositorio sistemaEvaluacionRepositorio;
	
	@Override
	public List<SistemaEvaluacion> listaSistemaEvaluacion() {
		return sistemaEvaluacionRepositorio.findAll();
	}


	


}
