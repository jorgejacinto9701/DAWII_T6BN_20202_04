package com.colegio.servicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Prestamo;
import com.colegio.entidad.PrestamoHasLibro;
import com.colegio.repositorio.PrestamoHasLibroRepositorio;
import com.colegio.repositorio.PrestamoRepositorio;

@Service
public class PrestamoServicioImpl implements PrestamoServicio {
	
	@Autowired
	private  PrestamoRepositorio prestamoRepositorio;
	
	@Autowired
	private PrestamoHasLibroRepositorio detalleRepositorio;
	
	public Prestamo insertaPrestamo(Prestamo obj){
		Prestamo cabecera = prestamoRepositorio.save(obj);
		for( PrestamoHasLibro d: cabecera.getDetallesPrestamo()) {
			d.getPrestamoHasLibroPK().setIdPrestamo(cabecera.getIdPrestamo());
			detalleRepositorio.save(d);
			
		}
		return cabecera;
	}
	

}
