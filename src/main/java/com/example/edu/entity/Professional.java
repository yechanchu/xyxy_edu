package com.example.edu.entity;

public class Professional {

    private String id;
    private String name;

    public Professional() {
    }

    public Professional(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Professional{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
