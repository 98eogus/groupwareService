package com.portfolio.project.domain;

public class EmployeeDto {

    private long id;
    private String name;
    private String position;
    private String department;
    private String email;
    private String phoneNumber;

    // 생성자, getter 및 setter 메서드는 필요에 따라 추가할 수 있습니다.

    public long getId() { return id;}

    public void setId(long id) { this.id = id;}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
