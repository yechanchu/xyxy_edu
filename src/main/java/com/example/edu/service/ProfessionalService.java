package com.example.edu.service;

import com.example.edu.entity.Professional;

import java.util.List;

public interface ProfessionalService {

    List<Professional> findAll();

    void save(Professional professional);

    void update(Professional professional);

    Professional findProfessionalById(String id);

    void delete(String id);
}
