package com.colegio.repositorio;

import java.awt.Dialog.ModalityType;

import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.Pais;

public interface PaisRepositorio extends JpaRepository<Pais, Integer> {

}
