package com.colegio.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tipoEvaluacion")
public class TipoEvaluacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idTipoEvaluacion;
	private String nombre;
	private String estado;
}





