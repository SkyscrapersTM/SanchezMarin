package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cibertec.entidad.TipoReclamo;

@Repository
public interface TipoReclamoRepository extends JpaRepository<TipoReclamo, Integer>{
	
}
