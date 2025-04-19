package com.app.repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.app.model.AccountCreationDetails;
import com.app.model.Transact;

import jakarta.transaction.Transactional;

public interface TransactionRepository   extends JpaRepository<Transact, Integer>
 {
	@Modifying
    @Transactional
    @Query(value = "INSERT INTO transact (a_cid,cnm, amount, transaction_date,transaction_type, cid) VALUES (:aCid, :cnm,:amount, :transactionDate,:transactionType, :cid)", nativeQuery = true)
    void insertTransaction(@Param("aCid") int aCid, 
    		               @Param("cnm") String cnm,
                           @Param("amount") double amount, 
                           @Param("transactionDate") LocalDate transactionDate, 
                           @Param("transactionType")String transactionType,
                           @Param("cid") int cid);

List<Transact>findByCid(int cid);

List<Transact> findByCidAndAmountAndLoanTypeAndStatusIn(int cid, double amount, String loanType,
		List<String> activeStatuses);

boolean existsByCidAndLoanType(int cid, String loanType);

List<Transact> getTransactionsByCid(int cid);


//public List<Transact> findByAllTransaction(); 


}