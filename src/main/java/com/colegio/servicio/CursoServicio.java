package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Curso;

public interface CursoServicio {

	public Curso insertaCurso(Curso obj);
	public abstract void eliminarCurso(int id);
	public abstract List<Curso>listarTodos();
	public abstract List<Curso>listaPorNombre(String filtro);
	public abstract Optional<Curso> buscarPorId(int id);
	
	
}
