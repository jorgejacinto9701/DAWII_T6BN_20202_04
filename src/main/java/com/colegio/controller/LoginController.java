package com.colegio.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.colegio.entidad.Opcion;
import com.colegio.entidad.Rol;
import com.colegio.entidad.Usuario;
import com.colegio.servicio.UsuarioServicio;

@Controller
public class LoginController {

	@Autowired
	private UsuarioServicio servicio;

	@RequestMapping("/verLogin")
	public String verLogin() { return "login"; }
	
	@RequestMapping("/verIntranetHome")
	public String verHome() { return "intranetHome"; }

	
	@RequestMapping("/registraCurso")
	public String regCurso() { return "intranetRegistraCurso"; }

	@RequestMapping("/registraAutor")
	public String regAutor() { return "intranetRegistraAutor"; }
	
	@RequestMapping("/registraLibro")
	public String regLibro() { return "intranetRegistraLibro"; }
	
	@RequestMapping("/registraEditorial")
	public String regEditorial() { return "intranetRegistraEditorial"; }
	
	@RequestMapping("/registraDisponibilidad")
	public String regDisponibilidad() { return "intranetRegistraDisponibilidad"; }
	
	@RequestMapping("/registraHistorialPortal")
	public String regHistorialPortal() { return "intranetRegistraHistorialPortal"; }
	
	@RequestMapping("/registraUsuario")
	public String regUsuario() { return "intranetRegistraUsuario"; }
	
	
	@RequestMapping("/crudAutor")
	public String crudAutor() { return "crudAutor"; }
	
	@RequestMapping("/crudPortal")
	public String crudPortal() { return "crudPortal"; }
	
	@RequestMapping("/crudCurso")
	public String crudCurso() { return "crudCurso"; }
	
	@RequestMapping("/crudEditorial")
	public String crudEditorial() { return "crudEditorial"; }
	
	@RequestMapping("/crudLibro")
	public String crudLibro() { return "crudLibro"; }
	
	@RequestMapping("/crudUsuario")
	public String crudUsuario() { return "crudUsuario"; }
	
	
	
	
	@RequestMapping("/enlaceConsultaCurso")
	public String enlaceConsultaCurso() { return "intranetConsultaAutor"; }
	
	@RequestMapping("/enlaceConsultaAutor")
	public String enlaceConsultaAutor() { return "intranetConsultaCurso"; }

	
	@RequestMapping("/enlaceConsultaLibro")
	public String enlaceConsultaLibro() { return "intranetConsultaLibro"; }

	
	@RequestMapping("/enlaceConsultaEditorial")
	public String enlaceConsultaEditorial() { return "intranetConsultaEditorial"; }

	
	@RequestMapping("/enlaceConsultaDisponibilidad")
	public String enlaceConsultaDisponibilidad() { return "intranetConsultaDisponibilidad"; }

	
	
	
	@RequestMapping("/enlaceTransaccionPrestamo")
	public String enlaceTransaccionPrestamo() { return "intranetTransaccionPrestamo"; }

	@RequestMapping("/enlaceTransaccionAutoresDeLibro")
	public String enlaceTransaccionAutoresDeLibro() { return "intranetTransaccionAutoresDeLibro"; }

	@RequestMapping("/enlaceTransaccionRolesDeUsuario")
	public String enlaceTransaccionRolesDeUsuario() { return "intranetTransaccionRolesDeUsuario"; }

	@RequestMapping("/enlaceTransaccionOpcionesDeRol")
	public String enlaceTransaccionOpcionesDeRol() { return "intranetTransaccionOpcionesDeRol"; }

	
	@RequestMapping("/login")
	public String login(Usuario usu, HttpSession  session, HttpServletRequest request) {
		
		Usuario objUsu = servicio.login(usu);
		if(objUsu == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		}else {
			List<Rol> roles = servicio.traerRolesDeUsuario(objUsu.getIdUsuario());
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(objUsu.getIdUsuario());
			
			session.setAttribute("objUsuario", objUsu);
			session.setAttribute("objRoles", roles);
			session.setAttribute("objMenus", menus);
			return "redirect:home";
		}
	}
	
	@RequestMapping("/home")
	public String salida() {
		return "intranetHome";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//Destruir todos los objetos de la sesion mediante programación
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}

}
