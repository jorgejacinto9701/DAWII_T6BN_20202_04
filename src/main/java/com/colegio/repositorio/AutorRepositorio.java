package com.colegio.repositorio;


import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.Autor;

public interface AutorRepositorio extends  JpaRepository<Autor, Integer>  {

}
