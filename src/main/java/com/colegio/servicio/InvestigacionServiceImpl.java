package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Investigacion;
import com.colegio.repositorio.InvestigacionRepository;

@Service
public class InvestigacionServiceImpl implements InvestigacionService {

	@Autowired
	private InvestigacionRepository repository;


	@Override
	public List<Investigacion> listaTodos() {
		return repository.findAll();
	}


	@Override
	public List<Investigacion> listaTodosPorAutor(int idAutor) {
		return repository.listaTodosPorAutor(idAutor);
	}

}
