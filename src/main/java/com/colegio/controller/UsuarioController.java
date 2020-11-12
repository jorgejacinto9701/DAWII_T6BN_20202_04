package com.colegio.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.TipoUsuario;
import com.colegio.entidad.Ubigeo;
import com.colegio.entidad.Usuario;
import com.colegio.servicio.TipoUsuarioServicio;
import com.colegio.servicio.UbigeoServicio;
import com.colegio.servicio.UsuarioServicio;

@Controller
public class UsuarioController {

	@Autowired
	private TipoUsuarioServicio tipoUsuarioService;
	
	@Autowired
	private UbigeoServicio ubigeoServicio;
	
	
	@Autowired
	private UsuarioServicio usuarioService;
	

	
	@RequestMapping("/listaDepartamentos")
	@ResponseBody
	public List<String> listaDep(){
		return ubigeoServicio.traeDepartamentos();
	}
	
	@RequestMapping("/listaProvincias")
	@ResponseBody
	public List<String> listaPro(Ubigeo ubigeo){
		return ubigeoServicio.traeProvincias(ubigeo);
	}
	
	@RequestMapping("/listaDistritos")
	@ResponseBody
	public List<Ubigeo> listaDis(Ubigeo ubigeo){
		return ubigeoServicio.traeDistritos(ubigeo);
	}
	
	
	@RequestMapping("/cargaTipoUsuario")
	@ResponseBody
	public List<TipoUsuario> listaTipoUsuario(){
		return tipoUsuarioService.listaTipoUsuario();
	}
	
	
	@RequestMapping("/")
	public String verCrud() {
		return "crudUsuario";
	}
	
	@RequestMapping("/salida")
	public String salir(HttpSession session) {
		List<Usuario> lista = usuarioService.listaUsuario();
		session.setAttribute("usuarios", lista);
		return "crudUsuario";
	}
	
	@RequestMapping("/consultaCrudUsuario")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Usuario> lista = usuarioService.listarPorNombre(filtro+"%");
		session.setAttribute("usuarios", lista);
		return "crudUsuario";
	}
	
	@RequestMapping("/registraActualizaCrudUsuario")
	public String regAct(Usuario obj, HttpSession session) {
		
	
		try {
			Usuario salida = usuarioService.insertaActualizaUsuario(obj);
			if(salida == null) {
				session.setAttribute("MENSAJE", "Existe ERROR");
			}else {
				session.setAttribute("MENSAJE", "registro o actualización correcta");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:salida";
	}
	
	
	@RequestMapping("/eliminaCrudUsuario")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Usuario> obj = usuarioService.buscaPorId(id);
			if(obj.isPresent()) {
				usuarioService.eliminaUsuario(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salida";
		
		

		
		 
	}
}
