package com.colegio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.AutorHasInvestigacion;
import com.colegio.entidad.AutorHasInvestigacionPK;

public interface AutorHasInvestigacionRepository extends JpaRepository<AutorHasInvestigacion, AutorHasInvestigacionPK>{

}
