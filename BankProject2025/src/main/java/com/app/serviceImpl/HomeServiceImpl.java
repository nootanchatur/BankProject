package com.app.serviceImpl;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.model.AccountCreationDetails;
import com.app.model.Transact;
import com.app.model.TransferRequest;
import com.app.repository.Homerepository;
import com.app.repository.TransactionRepository;
import com.app.serviceI.HomeServiceI;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
public class HomeServiceImpl implements HomeServiceI {
	@Autowired
	Homerepository hr;
	@PersistenceContext
    private EntityManager entityManager;
	@Override
@Transactional
	public void saveData(AccountCreationDetails a) {
		hr.save(a);
        System.out.println("Transaction inserted successfully!");
	}

	

	@Override
	public Iterable<AccountCreationDetails> getAllData() {
		return hr.findAll();
	}

	@Override
	public AccountCreationDetails loginC(int ci, String ps) {
		return hr.findByCidAndPass(ci, ps);
	}

	


	@Override
	public AccountCreationDetails loginU(int ci, String ps) {
		return hr.findByCidAndPass(ci, ps);
	}

@Autowired
TransactionRepository trs;
   



 @Transactional
    @Override
    public void withdrawAmount(int accId,String transactionType, double amount) {
	 
	 Optional<AccountCreationDetails> accout = hr.findById(accId);


     AccountCreationDetails account = accout.get();
     double currentBalance = account.getBalance();
     System.out.println("Account current balance: " + currentBalance);
System.out.println("Trnasaction type="+transactionType);
     if (currentBalance < amount) {
         System.out.println("Insufficient balance.");
     }

     account.setBalance(currentBalance - amount);
     hr.save(account); // Save updated balance
     trs.insertTransaction(accId, account.getCnm(), amount, LocalDate.now(), "WITHDRAW", account.getCid());

     System.out.println("Withdrawal successful. New balance: " + account.getBalance());
 }
 public AccountCreationDetails checkBalance(int cid,double balance) {
	 Optional<AccountCreationDetails> accout = hr.findById(cid);
     AccountCreationDetails account = accout.get();

	 System.out.println("hello");
     if (accout != null) {
System.out.println("Account balnace is:"+accout.get().getBalance());   
//hr.save(account);
     } else {
System.out.println("account not found with id");   
}

	return hr.save(account);

	 
 }





@Transactional
public String transferAmount(TransferRequest request) {
	AccountCreationDetails sender = hr.findByCid(request.getFromAccount())
            .orElseThrow(() -> new RuntimeException("Sender not found"));

	AccountCreationDetails receiver = hr.findByCid(request.getToAccount())
            .orElseThrow(() -> new RuntimeException("Receiver not found"));

    if (sender.getBalance() < request.getAmount()) {
        throw new RuntimeException("Insufficient funds");
    }

    sender.setBalance(sender.getBalance() - request.getAmount());
    receiver.setBalance(receiver.getBalance() + request.getAmount());

    hr.save(sender);
    hr.save(receiver);
    //Log transactions
    trs.insertTransaction(sender.getCid(), sender.getCnm(), request.getAmount(), LocalDate.now(), "TRANSFER", sender.getCid());
    trs.insertTransaction(receiver.getCid(), receiver.getCnm(), request.getAmount(), LocalDate.now(), "CREDIT", receiver.getCid());
    System.out.println(sender.getCnm());
    System.out.println(receiver.getCnm());
    return "Transfer successful";
}



@Override
public boolean updateMpin(int cid, String pass) {
        Optional<AccountCreationDetails> optional = hr.findById(cid);
        System.out.println("password is"+pass);
        if (optional.isPresent()) {
        	AccountCreationDetails account = optional.get();
            account.setPass(pass); // Store securely (hashed) in production
            hr.save(account);
            return true;
        }
        return false;
    }


@Override
public boolean verifyCidAndMobile(int cid, String mob) {
    Optional<AccountCreationDetails> optional = hr.findById(cid);
    if (optional.isPresent()) {
        AccountCreationDetails account = optional.get();

        // Normalize phone numbers
        String actualMob = account.getMob().replaceAll("[^0-9]", "").trim();
        String enteredMob = mob.replaceAll("[^0-9]", "").trim();

        System.out.println("Normalized DB Mobile = " + actualMob);
        System.out.println("Normalized Entered Mobile = " + enteredMob);

        return account.getCid() == cid && actualMob.equals(enteredMob);
    }
    return false;
}


public Transact applyLoan(Transact loanApplication) {
    List<String> activeStatuses = Arrays.asList("PENDING", "APPROVED");

    List<Transact> existingLoans = trs.findByCidAndAmountAndLoanTypeAndStatusIn(
        loanApplication.getCid(), 
        loanApplication.getAmount(), 
        loanApplication.getLoanType(), 
        activeStatuses
    );

    if (!existingLoans.isEmpty()) {
        return null; // Duplicate found
    }

    loanApplication.setStatus("PENDING");
    loanApplication.setTransactionDate(LocalDate.now());

    return trs.save(loanApplication);
}

public List<Transact> getLoansByAccount(int cid,double amount,String loanType) {
    List<String> activeStatuses = Arrays.asList("PENDING", "APPROVED");
    return trs.findByCidAndAmountAndLoanTypeAndStatusIn(cid, amount, loanType, activeStatuses);
}



@Override
public void creditAmount(int accId,String cnm , double amount, LocalDate transactionDate, String transactionType,
		int cid, AccountCreationDetails a) {
	 if (transactionType == null || transactionType.isEmpty()) {
	        throw new RuntimeException("Transaction type cannot be null or empty");
	    }
	    trs.insertTransaction(accId,cnm, amount, transactionDate, "credit",cid);
	   // trs.insertTransaction(accId, a.getCnm(), amount, transactionDate, transactionType, cid);

	}



@Override
public List<Transact> getTransactionsByCid(int cid) {
	return trs.findByCid(cid);
}	
}


























