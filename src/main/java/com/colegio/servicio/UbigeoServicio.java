package com.colegio.servicio;


import java.util.List;

import com.colegio.entidad.Ubigeo;

public interface UbigeoServicio {

	public abstract List<String> traeDepartamentos();

	public abstract List<String> traeProvincias(Ubigeo obj);

	public abstract List<Ubigeo> traeDistritos(Ubigeo ubi);
}
