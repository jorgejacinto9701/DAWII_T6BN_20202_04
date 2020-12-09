package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Opcion;
import com.colegio.entidad.Rol;
import com.colegio.entidad.Usuario;
import com.colegio.repositorio.UsuarioRepositorio;

@Service
public class UsuarioServicioImpl implements UsuarioServicio{

	@Autowired
	private UsuarioRepositorio repositorio;	
	@Override
	public Usuario login(Usuario bean) {
		return repositorio.login(bean);
	}
	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario) {
		return repositorio.traerEnlacesDeUsuario(idUsuario);
	}
	@Override
	public List<Rol> traerRolesDeUsuario(int idUsuario) {
		return repositorio.traerRolesDeUsuario(idUsuario);
	}
	@Override
	public List<Usuario> listaUsuario() {		
		return repositorio.findAll();
	}
	@Override
	public List<Usuario> listarPorNombre(String filtro, Pageable pegable) {
		return repositorio.listaPorNombre(filtro);
	}
	@Override
	public Usuario insertaActualizaUsuario(Usuario obj) {
		return repositorio.save(obj);
	}

	@Override
	public Optional<Usuario> buscaPorId(int id) {
		return repositorio.findById(id);
	}
	@Override
	public void eliminaUsuario(int id) {
		repositorio.deleteById(id);
		
	}
}
