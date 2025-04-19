package com.app.repository;



import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.app.model.AccountCreationDetails;
import com.app.model.Transact;

import jakarta.transaction.Transactional;

@Repository
public interface Homerepository extends JpaRepository<AccountCreationDetails, Integer>

{

	
	public AccountCreationDetails getById(int cid);

public AccountCreationDetails findByCidAndPass(int cid,String ps);

public void save(Iterable<AccountCreationDetails> accout);	
@Modifying
@Transactional
@Query("UPDATE AccountCreationDetails a SET a.balance = a.balance + :amount WHERE a.cid = :cid")
void updateBalance(@Param("cid") int cid, @Param("amount") double amount);

public Optional<AccountCreationDetails> findByCid(int cid);
  //AccountCreationDetails findById(int cid);

}




