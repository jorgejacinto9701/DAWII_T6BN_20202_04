package com.colegio.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="editorial")
public class Editorial {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idEditorial;
	private String nombre;
	private String direccion;
	private String telefono;
	private String correo;
	
	@ManyToOne
	@JoinColumn(name="idPais")
	private Pais pais;
}
