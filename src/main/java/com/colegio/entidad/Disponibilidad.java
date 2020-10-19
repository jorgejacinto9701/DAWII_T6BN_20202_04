package com.colegio.entidad;

import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "disponibilidad")

public class Disponibilidad {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name = "idDisponibilidad")	
	private Integer idDisponibilidad;
	
	@Column(name = "horaInicio")
	private LocalTime horaInicio;
	
	@Column(name = "horaFin")
	private LocalTime horaFin;
	
	@Column(name = "dia")
	private String Dia;
	
	@ManyToOne
	@JoinColumn(name = "idCiclo")
	private Ciclo ciclo;
	
	@ManyToOne
	@JoinColumn(name = "idUsuario")
	private Usuario usuario;
	

}
