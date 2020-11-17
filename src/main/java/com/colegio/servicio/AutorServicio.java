package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Autor;



public interface AutorServicio {

	public Autor insertaAutor(Autor obj);
	public abstract void eliminaAutor(int id);
	public abstract List<Autor> listarTodosAutor();
	public abstract List<Autor> listarPorNombreAutor(String filtro);
	public abstract Optional<Autor> buscaPorIdAutor(int id);
	
}
