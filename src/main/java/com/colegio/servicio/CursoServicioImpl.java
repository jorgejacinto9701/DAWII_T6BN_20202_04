package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Curso;
import com.colegio.repositorio.CursoRepositorio;

@Service
public class CursoServicioImpl implements CursoServicio {

	@Autowired
	private CursoRepositorio cursoRepositorio;
	
	@Override
	public Curso insertaCurso(Curso obj) {
		return cursoRepositorio.save(obj);
	}

}
