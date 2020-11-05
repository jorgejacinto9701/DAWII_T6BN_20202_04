package com.colegio.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "institucion")
public class Institucion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idInstitucion;
	private String nombre;
	private String nivel;
	private String codigo;
	@Lob
	private byte[] logo;
}
