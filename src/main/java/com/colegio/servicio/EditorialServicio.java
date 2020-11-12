package com.colegio.servicio;

import java.util.List;
import java.util.Optional;
import com.colegio.entidad.Editorial;


public interface EditorialServicio {

	public Editorial insertarActualizaEditorial(Editorial obj);
	public abstract void eliminaEditorial(int id);
	public abstract List<Editorial> listarTodos();
	public abstract List<Editorial> listarPorNombre(String filtro);
	public abstract Optional<Editorial> buscaPorId(int id);
	
}
