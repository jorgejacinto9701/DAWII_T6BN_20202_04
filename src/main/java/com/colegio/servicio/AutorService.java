package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Autor;



public interface AutorService {

	public Autor insertaAutor(Autor obj);
	public abstract void eliminaAutor(int id);
	public abstract List<Autor> listarTodos();
	public abstract List<Autor> listarPorNombreAutor(String filtro);
	
	public abstract List<Autor> listarPorPais(int idPais);
	
	public abstract Optional<Autor> buscaPorIdAutor(int id);
	
}
