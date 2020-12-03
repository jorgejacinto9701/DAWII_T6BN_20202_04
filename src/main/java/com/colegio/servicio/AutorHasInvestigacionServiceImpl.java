package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.AutorHasInvestigacion;
import com.colegio.repositorio.AutorHasInvestigacionRepository;

@Service
public class AutorHasInvestigacionServiceImpl implements AutorHasInvestigacionService{

	@Autowired
	private AutorHasInvestigacionRepository repository;

	@Override
	public AutorHasInvestigacion inserta(AutorHasInvestigacion obj) {
		return repository.save(obj);
	}

	@Override
	public void elimina(AutorHasInvestigacion obj) {
		repository.delete(obj);
	}
	
	
}
