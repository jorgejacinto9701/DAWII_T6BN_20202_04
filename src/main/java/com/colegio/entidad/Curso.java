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
@Table(name = "curso")
public class Curso {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idCurso")
	private Integer idCurso;
	private String codigo;
	private String nombre;
	private String estado;
	@ManyToOne
	@JoinColumn(name = "idSistemaEvaluacion")
	private SistemaEvaluacion sistemaevaluacion;
}
