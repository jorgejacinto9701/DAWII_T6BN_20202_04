package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Editorial;


public interface EditorialRepositorio extends JpaRepository<Editorial, Integer> {
	
	@Query("select x from Editorial x where x.nombre like :var_parm")
	public abstract List<Editorial> listaPorNombre(@Param("var_parm") String nombre);

}
