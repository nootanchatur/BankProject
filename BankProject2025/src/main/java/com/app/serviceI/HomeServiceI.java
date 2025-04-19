package com.app.serviceI;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.app.model.AccountCreationDetails;
import com.app.model.Transact;
import com.app.model.TransferRequest;

public interface HomeServiceI {

	public void saveData(AccountCreationDetails a);


	public Iterable<AccountCreationDetails> getAllData();

	public AccountCreationDetails loginC(int ci, String ps);
	
	public AccountCreationDetails loginU(int ci, String ps);

	void creditAmount(int accId,String cnm, double amount,LocalDate transactionDate,String transactionType,int cid,AccountCreationDetails a);


	void withdrawAmount(int accId, String transactionType, double amount);


	 AccountCreationDetails checkBalance(int cid,double balance);


//List<Transact>viewTranasaction(int cid);


public String transferAmount(TransferRequest request);


public boolean updateMpin(int cid, String pass);


public boolean verifyCidAndMobile(int cid, String mob);


public List<Transact> getLoansByAccount(int cid,double amount,String loanType);


public Transact applyLoan(Transact loan);


public List<Transact> getTransactionsByCid(int cid);
























 
   

}
