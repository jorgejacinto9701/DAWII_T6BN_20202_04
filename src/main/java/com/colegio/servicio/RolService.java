package com.colegio.servicio;

import java.util.List;

import com.colegio.entidad.Rol;

public interface RolService {

	public abstract List<Rol> listaTodos();
	public abstract List<Rol> listaTodosPorAutor(int idUsuario);
}
