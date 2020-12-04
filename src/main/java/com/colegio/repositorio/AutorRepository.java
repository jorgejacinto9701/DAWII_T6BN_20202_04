package com.colegio.repositorio;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Autor;


public interface AutorRepository extends  JpaRepository<Autor, Integer>  {
	
	@Query("select x from Autor x where x.nombres like :var_parm")
	public abstract List<Autor> ListaPorNombreAutor(@Param("var_parm") String nombre);
	
	@Query("select x from Autor x where x.pais.idPais = :param")
	public abstract List<Autor> ListaPorPais(@Param("param") int idpais);

}
