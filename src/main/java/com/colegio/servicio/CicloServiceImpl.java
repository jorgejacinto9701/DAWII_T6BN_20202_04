package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Ciclo;
import com.colegio.repositorio.CicloRepository;

@Service
public class CicloServiceImpl implements CicloService {
	
	@Autowired
	private CicloRepository cicloRepositorio;
	@Override
	public List<Ciclo> listaCiclo() {
		
		return cicloRepositorio.findAll();
	}
}
