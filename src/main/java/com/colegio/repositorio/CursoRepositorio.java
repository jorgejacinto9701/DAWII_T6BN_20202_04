package com.colegio.repositorio;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Curso;
import com.colegio.entidad.Editorial;

public interface CursoRepositorio extends  JpaRepository<Curso, Integer>  {

	@Query("select x from Curso x where x.codigo like :v_param")
	public abstract List<Curso> listaPorNombre(@Param("v_param") String filtro);
	
	//@Query("select x from Editorial x where x.nombre like :var_parm")
	//public abstract List<Editorial> listaPorNombre(@Param("var_parm") String nombre);

	
}
