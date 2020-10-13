package com.colegio.entidad;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idUsuario;
	private String nombres;
	private String apaterno;
	private String amaterno;
	private Date fechaNacimiento;
	private Date fechaRegistro;
	private String email;
	private String estado;
	private String celular;
	private String direccion;
	private String dni;
	private String login;
	private String password;

	@Transient 
	private String nombreCompleto;
	

	public String getNombreCompleto() {
		return nombres.concat(" ").concat(apaterno).concat(" ").concat(amaterno);
	}
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}


	
}
