package com.colegio.repositorio;

import org.hibernate.metamodel.model.convert.spi.JpaAttributeConverter;
import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.TipoLibro;

public interface TipoLibroRepositorio extends JpaRepository<TipoLibro, Integer>{

	
	
}
