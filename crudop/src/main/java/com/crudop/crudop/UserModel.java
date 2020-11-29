package com.crudop.crudop;


import javax.persistence.*;

@Entity
@Table(name = "registertab")
public class UserModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)


    @Column(name = "id")
    private int id;
    @Column
    private int rollno;
    @Column
    private String name;
    @Column
    private String email;
    @Column
    private String password;
    @Column
    private String address;
    @Column
    private int Clas;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRollno() {
        return rollno;
    }

    public void setRollno(int rollno) {
        this.rollno = rollno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getClas() {
        return Clas;
    }

    public void setClas(int clas) {
        Clas = clas;
    }
}
