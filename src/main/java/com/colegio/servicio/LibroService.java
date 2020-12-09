package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;

import com.colegio.entidad.Libro;

public interface LibroService {
	
	public abstract List<Libro> listarTodos();
	public abstract List<Libro> listarTodosPorAutor(int idAutor);

	public abstract Libro insertaActualizaLibro(Libro obj);
	public abstract void eliminaLibro(int id);

	public abstract List<Libro> listarPorNombre(String filtro, Pageable pegable);

	public abstract Optional<Libro> buscarPorId(int id);
}
