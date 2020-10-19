package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Ciclo;
import com.colegio.repositorio.CicloRepositorio;

@Service
public class CicloServicioImpl implements CicloServicio {
	
	@Autowired
	private CicloRepositorio cicloRepositorio;
	@Override
	public List<Ciclo> listaCiclo() {
		
		return cicloRepositorio.findAll();
	}
}
