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
@Table(name = "sistemaEvaluacion")
public class SistemaEvaluacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idSistemaEvaluacion;
	private String nombre;
	private String estado;
}





