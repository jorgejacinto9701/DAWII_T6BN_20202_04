package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Investigacion;

public interface InvestigacionRepository extends JpaRepository<Investigacion, Integer>{
	
	@Query("Select i from Investigacion i, AutorHasInvestigacion x where i.idInvestigacion = x.investigacion.idInvestigacion and  x.autor.idAutor = :param")
	public abstract List<Investigacion> listaTodosPorAutor(@Param("param") int idAutor);

}
