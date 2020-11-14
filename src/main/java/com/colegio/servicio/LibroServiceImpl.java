package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Libro;
import com.colegio.repositorio.LibroRepositorio;

@Service
public class LibroServiceImpl implements LibroService{

	@Autowired
	private LibroRepositorio repository;
	
	@Override
	public Libro insertaActualizaLibro(Libro obj) {
		
		return repository.save(obj);
	}

	@Override
	public void eliminaLibro(int id) {
		
		repository.deleteById(id);
	}

	@Override
	public List<Libro> listarTodos() {
		
		return repository.findAll();
	}

	@Override
	public List<Libro> listarPorNombre(String filtro) {
		
		return repository.listaPorNombre(filtro);
	}

	@Override
	public Optional<Libro> buscarPorId(int id) {
		
		return repository.findById(id);
	}

}
