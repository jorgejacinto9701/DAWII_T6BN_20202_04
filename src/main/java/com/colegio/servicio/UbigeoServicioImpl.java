package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Ubigeo;
import com.colegio.repositorio.UbigeoRepositorio;

@Service
public class UbigeoServicioImpl implements UbigeoServicio{

	@Autowired
	private UbigeoRepositorio repositorio;

	@Override
	public List<String> traeDepartamentos() {
		return repositorio.traeDepartamentos();
	}

	@Override
	public List<String> traeProvincias(Ubigeo obj) {
		return repositorio.traeProvincias(obj);
	}

	@Override
	public List<Ubigeo> traeDistritos(Ubigeo obj) {
		return repositorio.traeDistritos(obj);
	}



}
