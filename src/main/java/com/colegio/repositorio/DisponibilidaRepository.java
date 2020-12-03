package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Disponibilidad;

public interface DisponibilidaRepository extends JpaRepository<Disponibilidad, Integer>{

	@Query("Select x from Disponibilidad x where x.ciclo.idCiclo = :param")
	public abstract List<Disponibilidad> listaPorCiclo(@Param(value = "param")int idCiclo);

}
