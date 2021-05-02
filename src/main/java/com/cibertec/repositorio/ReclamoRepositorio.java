package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cibertec.entidad.Reclamo;

@Repository
public interface ReclamoRepositorio extends JpaRepository<Reclamo, Integer>{

}
