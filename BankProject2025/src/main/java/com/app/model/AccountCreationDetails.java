package com.app.model;

import java.util.List;

import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.ColumnTransformer;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.ManyToAny;
import org.hibernate.annotations.Type;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Version;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

@Entity
@DynamicUpdate
public class AccountCreationDetails {
	@Id
private int cid;
private  String cnm;
private String pass;
private String cAdharNo;
private String cPanNo;
private String bod;
private String age;
private String mob;
private String email;
private String message;
@Convert(converter = AccountTypeConverter.class)
private String accType;
private int version = 0; 
private double balance;

public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getCnm() {
	return cnm;
}
public void setCnm(String cnm) {
	this.cnm = cnm;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getcAdharNo() {
	return cAdharNo;
}
public void setcAdharNo(String cAdharNo) {
	this.cAdharNo = cAdharNo;
}
public String getcPanNo() {
	return cPanNo;
}
public void setcPanNo(String cPanNo) {
	this.cPanNo = cPanNo;
}
public String getBod() {
	return bod;
}
public void setBod(String bod) {
	this.bod = bod;
}
public String getAge() {
	return age;
}
public void setAge(String age) {
	this.age = age;
}

public String getMob() {
	return mob;
}
public void setMob(String mob) {
	this.mob = mob;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAccType() {
	return accType;
}
public void setAccType(String accType) {
	this.accType = accType;
}
public double getBalance() {
	return balance;
}
public void setBalance(double d) {
	this.balance = d;
}



}
