package com.app.model;


import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
@Entity
public class Transact {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int accId;
	private int cid;
	private String cnm;
	private double amount;
    private LocalDate transactionDate = LocalDate.now(); // auto-set current date
    private String transactionType; //  This stores "withdraw", "transfer", etc.
    private String loanType; // e.g., Home, Personal, Car
    //private int fromAccountId;
   // private int toAccountId;
    private String status = "PENDING"; // PENDING, APPROVED, REJECTED
    private Integer termInMonths;

   
public String getCnm() {
		return cnm;
	}

	public void setCnm(String cnm) {
		this.cnm = cnm;
	}

	//    public int getFromAccountId() {
//		return fromAccountId;
//	}
//
//	public void setFromAccountId(int fromAccountId) {
//		this.fromAccountId = fromAccountId;
//	}
//
//	public int getToAccountId() {
//		return toAccountId;
//	}
//
//	public void setToAccountId(int toAccountId) {
//		this.toAccountId = toAccountId;
//	}
//
	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	
public Integer getTermInMonths() {
		return termInMonths;
	}

	public void setTermInMonths(Integer termInMonths) {
		this.termInMonths = termInMonths;
	}

public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

@ManyToOne(cascade = CascadeType.ALL)
private AccountCreationDetails a;

public int getCid() {
	return cid;
	}

	public AccountCreationDetails getA() {
		return a;
	}

	public void setA(AccountCreationDetails a) {
		this.a = a;
	}

public void setCid(int cid) {
		this.cid = cid;
	}

	public int getAccId() {
		return accId;
	}

	public void setAccId(int accId) {
		this.accId = accId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}	
	public LocalDate getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(LocalDate transactionDate) {
        this.transactionDate = transactionDate;
    }
}
