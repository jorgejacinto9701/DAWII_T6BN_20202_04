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
@Table(name = "sistemaevaluacion")
public class SistemaEvaluacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idSistemaEvaluacion")
	private Integer idSistemaEvaluacion;
	
	private String nombre;
	
	@JsonIgnore
	@OneToMany(mappedBy = "sistemaevaluacion")
	private List<Curso> cursos;
	
}
