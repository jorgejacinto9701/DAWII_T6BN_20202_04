package com.colegio.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Libro;
import com.colegio.entidad.Prestamo;
import com.colegio.entidad.PrestamoHasLibro;
import com.colegio.entidad.PrestamoHasLibroPK;
import com.colegio.entidad.Usuario;
import com.colegio.servicio.LibroService;
import com.colegio.servicio.PrestamoServicio;
import com.colegio.servicio.UsuarioServicio;
import com.colegio.entidad.Mensaje;
import com.colegio.entidad.Seleccion;

@Controller
public class PrestamoController {
	
	@Autowired
	private UsuarioServicio usuarioServicio;
	
	@Autowired
	private LibroService libroServicio;
	
	@Autowired
	private PrestamoServicio prestamoServicio;
	
	//Se almacenan los productos seleccionados
	private List<Seleccion> seleccionados = new ArrayList<Seleccion>();
	
	@RequestMapping("/verPrestamo")
	public String verPrestamo() {
		return "prestamo";
	}	
	
	
	@RequestMapping("/agregarSeleccion")
	@ResponseBody
	public List<Seleccion> agregar(Seleccion obj) {
		seleccionados.add(obj);
		return seleccionados;
	}
	
	@RequestMapping("/listaSeleccion")
	@ResponseBody
	public List<Seleccion> lista(){
		return seleccionados;
	}
	
	@RequestMapping("/eliminaSeleccion")
	@ResponseBody
	public List<Seleccion> eliminar(int idLibro) {
		for (Seleccion x : seleccionados) {
			if (x.getIdLibro() == idLibro) {
				seleccionados.remove(x);
				break;
			}
		}
		return seleccionados;
	}	
	
	@RequestMapping("/registraPrestamo")
	@ResponseBody
	public Mensaje registra(Usuario objCliente) {
		Usuario objUsuario = new Usuario();		
		objUsuario.setIdUsuario(1);
		
		

		List<PrestamoHasLibro> detalles = new ArrayList<PrestamoHasLibro>();
		for (Seleccion x : seleccionados) {
			PrestamoHasLibroPK pk = new PrestamoHasLibroPK();
			pk.setIdLibro(x.getIdLibro());

			PrestamoHasLibro phb = new PrestamoHasLibro();
			
			
			phb.setPrestamoHasLibroPK(pk);

			detalles.add(phb);
		}

		
		Prestamo objPrestamo = new Prestamo();		
		objPrestamo.setUsuario(objCliente);
		objPrestamo.setUsuario(objUsuario);
		objPrestamo.setDetallesPrestamo(detalles);
		objPrestamo.setFechaPrestamo(new Date());
		objPrestamo.setFechaDevolucion(new Date());
		objPrestamo.setFechaEntrega(new Date());
		objPrestamo.setFechaRegistro(new Date());
		objPrestamo.setEstado("ACTIVO");

		Prestamo objIns = prestamoServicio.insertaPrestamo(objPrestamo);
		String salida = "-1";
		

		if (objIns != null) {
			salida = "Se genero el Prestamo con codigo : " + objIns.getIdPrestamo() + "<br><br>";
			salida += "Usuario: " + objIns.getUsuario().getNombres() + "<br><br>";
			salida += "<table class=\"table\"><tr><td>Titulo</td><td>Prestamo</td><td>Devolucion</td><td>Entrega</td><td>Registro</td></tr>";
			
			for (Seleccion x : seleccionados) {
				salida += "<tr><td>"+ x.getTitulo() + "</td><td>" + x.getFechaPrestamo() + "</td><td>" + x.getFechaDevolucion()
				+ "</td><td>" + x.getFechaEntrega() + "</td><td>" + x.getFechaRegistro() + "</td></tr>" ;
				
						
			}
			salida += "</table><br>";
			
			

			seleccionados.clear();
		}

		Mensaje objMensaje = new Mensaje();
		objMensaje.setTexto(salida);

		return objMensaje;
	}

		
		@RequestMapping("/cargaUsuarios")
		@ResponseBody		
		public List<Usuario> listaUsuario(String filtro){
			//Los parametros de la paginacion
			int page = 0;
			int size = 5;
			Pageable paginacion = PageRequest.of(page, size);
			return usuarioServicio.listarPorNombre(filtro+"%", paginacion);
		}
		@RequestMapping("/cargaLibros")
		@ResponseBody
		public List<Libro> listaLibro(String filtro){
			int page = 0;
			int size = 5;
			Pageable paginacion = PageRequest.of(page, size);
			return libroServicio.listarPorNombre(filtro+"%", paginacion);
		}	

}
