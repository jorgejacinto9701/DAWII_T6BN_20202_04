package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Autor;
import com.colegio.repositorio.AutorRepositorio;

@Service
public class AutorServicioImpl implements AutorServicio {

	@Autowired
	private AutorRepositorio autorRepositorio;
	

	@Override
	public Autor insertaAutor(Autor obj) {
		// TODO Auto-generated method stub
		return autorRepositorio.save(obj);
	}

}
