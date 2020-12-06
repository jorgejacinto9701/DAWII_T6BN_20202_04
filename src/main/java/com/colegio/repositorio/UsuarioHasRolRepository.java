package com.colegio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.UsuarioHasRol;
import com.colegio.entidad.UsuarioHasRolPK;

public interface UsuarioHasRolRepository 
extends JpaRepository<UsuarioHasRol, UsuarioHasRolPK> {

	
	
}
