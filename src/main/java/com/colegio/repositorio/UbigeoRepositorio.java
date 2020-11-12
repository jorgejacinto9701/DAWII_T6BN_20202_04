package com.colegio.repositorio;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.colegio.entidad.Ubigeo;

public interface UbigeoRepositorio extends JpaRepository<Ubigeo, Integer> {

	@Query("Select distinct x.departamento from Ubigeo x")
	public abstract List<String> traeDepartamentos() ;
	
	@Query("Select distinct x.provincia from Ubigeo x where x.departamento = :#{#obj.departamento}")
	public abstract List<String> traeProvincias(Ubigeo obj) ;
	
	@Query("Select x from Ubigeo x where x.departamento = :#{#obj.departamento} and x.provincia = :#{#obj.provincia}")
	public abstract List<Ubigeo> traeDistritos(Ubigeo obj) ;
	

}
