package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Disponibilidad;
import com.colegio.repositorio.DiponibilidadRepositorio;

@Service
public class DisponibilidadServicioImpl implements DisponibilidadServicio {
	
	@Autowired
	private DiponibilidadRepositorio disponibilidadRepositorio;	
	@Override
	public Disponibilidad insertaDisponibilidad(Disponibilidad obj) {
		
		return disponibilidadRepositorio.save(obj);
	}
}
