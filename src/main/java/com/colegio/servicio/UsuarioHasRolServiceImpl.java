package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.UsuarioHasRol;
import com.colegio.repositorio.UsuarioHasRolRepository;

@Service
public class UsuarioHasRolServiceImpl implements UsuarioHasRolService{

	@Autowired
	private UsuarioHasRolRepository repository;

	@Override
	public UsuarioHasRol inserta(UsuarioHasRol obj) {
		return repository.save(obj);
	}

	@Override
	public void elimina(UsuarioHasRol obj) {
		repository.delete(obj);
	}
	
	
}
