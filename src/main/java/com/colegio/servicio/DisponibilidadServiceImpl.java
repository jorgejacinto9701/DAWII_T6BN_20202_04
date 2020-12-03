package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Disponibilidad;
import com.colegio.repositorio.DisponibilidaRepository;

@Service
public class DisponibilidadServiceImpl implements DisponibilidadService {

	@Autowired
	private DisponibilidaRepository repository;

	@Override
	public List<Disponibilidad> listaPorCiclo(int idCiclo) {
		return repository.listaPorCiclo(idCiclo);
	}

	@Override
	public List<Disponibilidad> listaTodos() {
		return repository.findAll();
	}

}
