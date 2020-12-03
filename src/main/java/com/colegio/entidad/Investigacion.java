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
@Table(name = "investigacion")
public class Investigacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idInvestigacion;
	private String titulo;
	private String estado;
	private String tipo;
	
}
