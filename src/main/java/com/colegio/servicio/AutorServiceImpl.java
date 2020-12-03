package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Autor;
import com.colegio.repositorio.AutorRepository;

@Service
public class AutorServiceImpl implements AutorService {

	@Autowired
	private AutorRepository autorRepositorio;
	

	@Override
	public Autor insertaAutor(Autor obj) {
		
		return autorRepositorio.save(obj);
	}
	@Override
	public void eliminaAutor(int id) {
		autorRepositorio.deleteById(id);
	}
	@Override
	public List<Autor> listarTodos() {
		return autorRepositorio.findAll();
	}
	
	
	@Override
	public List<Autor> listarPorNombreAutor(String filtro) {
		return autorRepositorio.ListaPorNombreAutor(filtro);
	}
	
	@Override
	public Optional<Autor> buscaPorIdAutor(int id) {
		return autorRepositorio.findById(id);
	}

}
