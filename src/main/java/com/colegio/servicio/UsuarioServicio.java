package com.colegio.servicio;

import java.util.List;

import com.colegio.entidad.Opcion;
import com.colegio.entidad.Rol;
import com.colegio.entidad.Usuario;

public interface UsuarioServicio {

	public abstract Usuario login(Usuario bean);
	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);
	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);	
	public abstract List<Usuario> listaUsuario();	
}




