package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.TipoUsuario;
import com.colegio.repositorio.TipoUsuarioRepositorio;

@Service
public class TipoUsuarioImplServicioImpl implements TipoUsuarioServicio {

	@Autowired
	private TipoUsuarioRepositorio tipoEvaluacionRepositorio;

	@Override
	public List<TipoUsuario> listaTipoUsuario() {
		return tipoEvaluacionRepositorio.findAll();
	}
	





}
