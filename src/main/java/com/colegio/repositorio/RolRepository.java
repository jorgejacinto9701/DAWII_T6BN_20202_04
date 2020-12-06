package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Rol;

public interface RolRepository extends JpaRepository<Rol, Integer>{
	
	@Query("select i from Rol i, UsuarioHasRol x where i.idRol = x.rol.idRol and  x.usuario.idUsuario = :param")
	public abstract List<Rol> listaTodosPorAutor(@Param("param") int idUsuario);

}
