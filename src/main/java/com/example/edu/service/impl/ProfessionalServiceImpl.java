package com.example.edu.service.impl;

import com.example.edu.entity.Professional;
import com.example.edu.mapper.ProfessionalMapper;
import com.example.edu.service.ProfessionalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfessionalServiceImpl implements ProfessionalService {


    @Autowired
    private ProfessionalMapper mapper;

    @Override
    public List<Professional> findAll() {
        return mapper.findAll();
    }

    @Override
    public void save(Professional professional) {
        mapper.save(professional);
    }

    @Override
    public void update(Professional professional) {
        mapper.update(professional);
    }

    @Override
    public Professional findProfessionalById(String id) {
        return mapper.findProfessionalById(id);
    }

    @Override
    public void delete(String id) {
        mapper.delete(id);
    }


}
