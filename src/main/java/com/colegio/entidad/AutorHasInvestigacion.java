package com.colegio.entidad;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "autor_has_investigacion")
public class AutorHasInvestigacion {

	@EmbeddedId
	private AutorHasInvestigacionPK autorHasInvestigacionPK;

	@ManyToOne
	@JoinColumn(name = "idAutor", nullable = false, insertable = false, updatable = false)
	private Autor autor;

	@ManyToOne
	@JoinColumn(name = "idInvestigacion", nullable = false, insertable = false, updatable = false)
	private Investigacion investigacion;

}
