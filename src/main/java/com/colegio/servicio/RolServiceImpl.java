package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Rol;
import com.colegio.repositorio.RolRepository;

@Service
public class RolServiceImpl implements RolService {

	@Autowired
	private RolRepository repository;


	@Override
	public List<Rol> listaTodos() {
		return repository.findAll();
	}


	@Override
	public List<Rol> listaTodosPorAutor(int idUsuario) {
		return repository.listaTodosPorAutor(idUsuario);
	}

}
