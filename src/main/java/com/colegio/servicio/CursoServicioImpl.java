package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Curso;
import com.colegio.entidad.Libro;
import com.colegio.repositorio.CursoRepositorio;

@Service
public class CursoServicioImpl implements CursoServicio {

	@Autowired
	private CursoRepositorio cursoRepositorio;
	
	@Override
	public Curso insertaCurso(Curso obj) {
		return cursoRepositorio.save(obj);
	}
	@Override
	public void eliminarCurso(int id) {
		 cursoRepositorio.deleteById(id);
	}
	@Override
	public List<Curso> listarTodos() {
		
		return cursoRepositorio.findAll();
	}
	@Override
	public List<Curso> listaPorNombre(String filtro) {
		
		return cursoRepositorio.listaPorNombre(filtro);
	}
	
	@Override
	public Optional<Curso> buscarPorId(int id) {
		
		return cursoRepositorio.findById(id);
	}
}
