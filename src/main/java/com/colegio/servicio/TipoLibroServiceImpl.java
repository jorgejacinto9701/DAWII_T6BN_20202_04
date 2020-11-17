package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.TipoLibro;
import com.colegio.repositorio.TipoLibroRepositorio;

@Service
public class TipoLibroServiceImpl implements TipoLibroService{

	@Autowired
	private TipoLibroRepositorio repository;
	
	@Override
	public List<TipoLibro> listarTodos() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

}
