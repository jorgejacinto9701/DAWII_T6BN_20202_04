package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Opcion;

public interface OpcionRepository extends JpaRepository<Opcion, Integer>{
	
	@Query("select i from Opcion i, RolHasOpcion x where i.idOpcion = x.opcion.idOpcion and  x.rol.idRol = :param")
	public abstract List<Opcion> listaTodosPorRol(@Param("param") int idRol);

}
