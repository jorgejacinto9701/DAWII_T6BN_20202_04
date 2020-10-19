package com.colegio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Ciclo;
import com.colegio.entidad.Disponibilidad;
import com.colegio.entidad.Usuario;
import com.colegio.servicio.CicloServicio;
import com.colegio.servicio.DisponibilidadServicio;
import com.colegio.servicio.UsuarioServicio;

@Controller
public class DisponibilidadController {
	
	@Autowired	
	private CicloServicio cicloService;;	
	@Autowired
	private UsuarioServicio usuarioService;	
	@Autowired
	private DisponibilidadServicio disponibilidadService;	
	
	@RequestMapping("/verDisponibilidad")
	public String ver() {
		return "intranetRegistraDisponibilidad";
	}
	@RequestMapping("/cargaCiclo")
	@ResponseBody
	public List<Ciclo> listaCiclo(){
		return cicloService.listaCiclo();
	}
	
	@RequestMapping("/cargaUsuario")
	@ResponseBody
	public List<Usuario> listaUsuario() {
		return usuarioService.listaUsuario();
	}
	
	@RequestMapping("/insertaDisponibilidad")
	public String regDisponibilidad(Disponibilidad obj, HttpSession session) {
		try {
			Disponibilidad objSalida = disponibilidadService.insertaDisponibilidad(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se Registro correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaDisponibilidad";
	}
			
	@RequestMapping("/salidaDisponibilidad")
	public String salida() {
		return "intranetRegistraDisponibilidad";
	}	

}
