package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Editorial;
import com.colegio.repositorio.EditorialRepositorio;

@Service
public class EditorialServicioImpl implements EditorialServicio{
	
	@Autowired
	private EditorialRepositorio repositorio;
	
	@Override
	public Editorial insertarEditorial(Editorial obj) {
		return repositorio.save(obj);
	}

}
