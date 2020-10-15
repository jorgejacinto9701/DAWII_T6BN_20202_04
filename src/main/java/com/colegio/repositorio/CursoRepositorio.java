package com.colegio.repositorio;


import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.Curso;

public interface CursoRepositorio extends  JpaRepository<Curso, Integer>  {

}
