package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Libro;

public interface LibroRepositorio extends JpaRepository<Libro, Integer>{
	
	@Query("select l from Libro l, AutorHasLibro a where l.idLibro = a.libro.idLibro and  a.autor.idAutor = :param")
	public abstract List<Libro> listarTodosPorAutor(@Param("param") int idAutor);

	@Query("select x from Libro x where x.titulo like :v_param")
	public abstract List<Libro> listaPorNombre(@Param("v_param") String filtro);
	
}
