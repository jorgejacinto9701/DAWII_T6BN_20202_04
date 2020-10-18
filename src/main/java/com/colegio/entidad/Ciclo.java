package com.colegio.entidad;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "ciclo")
public class Ciclo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idCiclo")
	private Integer idCiclo;
	
	private String Nombre;
	private String Estado;
	
	@JsonIgnore
	@OneToMany(mappedBy = "ciclo")
	private List<Disponibilidad> disponibilidades;


}
