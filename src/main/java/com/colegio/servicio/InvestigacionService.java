package com.colegio.servicio;

import java.util.List;

import com.colegio.entidad.Investigacion;

public interface InvestigacionService {

	public abstract List<Investigacion> listaTodos();
	public abstract List<Investigacion> listaTodosPorAutor(int idAutor);
}
