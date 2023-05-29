package com.example.edu.entity;


public class Log {

    private String id;
    private String operator;
    private String account;

    private String ip;
    private String create_time;;
    private String description;


    public Log() {
    }

    public Log(String id, String operator, String account, String ip, String create_time, String description) {
        this.id = id;
        this.operator = operator;
        this.account = account;
        this.ip = ip;
        this.create_time = create_time;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_ime) {
        this.create_time = create_ime;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id='" + id + '\'' +
                ", operator='" + operator + '\'' +
                ", account='" + account + '\'' +
                ", ip='" + ip + '\'' +
                ", create_ime='" + create_time + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
