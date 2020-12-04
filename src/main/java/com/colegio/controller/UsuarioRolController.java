package com.colegio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Rol;
import com.colegio.entidad.Usuario;
import com.colegio.entidad.UsuarioHasRol;
import com.colegio.entidad.UsuarioHasRolPK;
import com.colegio.servicio.RolService;
import com.colegio.servicio.UsuarioHasRolService;
import com.colegio.servicio.UsuarioServicio;

@Controller
public class UsuarioRolController {

	@Autowired
	private UsuarioServicio usuarioService;
	
	@Autowired
	private RolService rolService;
	
	@Autowired
	private UsuarioHasRolService usuarioHasRolService;
	
	
	@RequestMapping("/cargaAutor")
	@ResponseBody
	public List<Usuario> cargaAutor() {
		return usuarioService.listaUsuario();
	}
	
	@RequestMapping("/cargaInvestigacion")
	@ResponseBody
	public List<Rol> cargaInvestigacion() {
		return rolService.listaTodos();
	}
	
	@RequestMapping("/cargaInvestigacionPorAutor")
	@ResponseBody
	public List<Rol> cargaInvestigacionPorAutorint(int idUsuario) {
		return rolService.listaTodosPorAutor(idUsuario);
	}
	
	@RequestMapping("/agregarUnaInvestigacionPorAutor")
	@ResponseBody
	public List<Rol> agregarUnaInvestigacionPorAutor(int idRol, int idUsuario) {
		
		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdUsuario(idUsuario);
		pk.setIdRol(idRol);
		
		UsuarioHasRol obj = new UsuarioHasRol();
		obj.setUsuarioHasRolPk(pk);
		
		usuarioHasRolService.inserta(obj);
		return rolService.listaTodosPorAutor(idUsuario);
	}
	
	@RequestMapping("/eliminaUnaInvestigacionPorAutor")
	@ResponseBody
	public List<Rol> eliminaUnaInvestigacionPorAutor(int idRol, int idUsuario) {
		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdUsuario(idUsuario);
		pk.setIdRol(idRol);
		
		UsuarioHasRol obj = new UsuarioHasRol();
		obj.setUsuarioHasRolPk(pk);
		
		usuarioHasRolService.elimina(obj);
		return rolService.listaTodosPorAutor(idUsuario);
	}
	
	@RequestMapping("/agregarTodosInvestigacionPorAutor")
	@ResponseBody
	public List<Rol> agregarTodosInvestigacionPorAutor(int idUsuario) {
		
		List<Rol> lista = rolService.listaTodosPorAutor(idUsuario);
		for (Rol x : lista) {
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdUsuario(idUsuario);
			pk.setIdRol(x.getIdRol());
			
			UsuarioHasRol obj = new UsuarioHasRol();
			obj.setUsuarioHasRolPk(pk);
			
			usuarioHasRolService.elimina(obj);
		}
		
		List<Rol> todos = rolService.listaTodos();
		for (Rol x : todos) {
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdUsuario(idUsuario);
			pk.setIdRol(x.getIdRol());
			
			UsuarioHasRol obj = new UsuarioHasRol();
			obj.setUsuarioHasRolPk(pk);
			
			usuarioHasRolService.inserta(obj);
		}
		
		return todos;
	}
	
	@RequestMapping("/eliminarTodosInvestigacionPorAutor")
	@ResponseBody
	public List<Rol> eliminarTodosInvestigacionPorAutor(int idUsuario) {
		
		List<Rol> lista = rolService.listaTodosPorAutor(idUsuario);
		for (Rol x : lista) {
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdUsuario(idUsuario);
			pk.setIdRol(x.getIdRol());
			
			UsuarioHasRol obj = new UsuarioHasRol();
			obj.setUsuarioHasRolPk(pk);
			
			usuarioHasRolService.elimina(obj);
		}
		
		return new ArrayList<Rol>();
	}
	
	
	
}
