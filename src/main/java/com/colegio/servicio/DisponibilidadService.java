package com.colegio.servicio;

import java.util.List;

import com.colegio.entidad.Disponibilidad;

public interface DisponibilidadService {

	public abstract List<Disponibilidad> listaPorCiclo(int idCiclo);
	public abstract List<Disponibilidad> listaTodos();
	
}
