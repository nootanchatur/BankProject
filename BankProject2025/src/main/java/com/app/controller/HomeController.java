package com.app.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.model.AccountCreationDetails;
import com.app.model.Transact;
import com.app.model.TransferRequest;
import com.app.repository.Homerepository;
import com.app.repository.TransactionRepository;
import com.app.serviceI.HomeServiceI;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController
{
	@Autowired
	Homerepository hr;
	@Autowired
	HomeServiceI hs;
	
	@GetMapping("/")
	public String preLogin()
	{
		return"login";
	}
	@GetMapping("/reg")
	public String preRegister()
	{
	return "Register";
	}
	@RequestMapping("/regData")
	public String regData(@ModelAttribute AccountCreationDetails a)
	{
		System.out.println("Saving information");
		hs.saveData(a);
        System.out.println("Account details:"+a);
		return "login";
	}
	
	@PostMapping("/log")
    public String loginC(@RequestParam("cid") int cid,
                         @RequestParam("pass") String pass,
                         Model model) {      
        
        if (cid ==101) {
        	 Iterable<AccountCreationDetails>list=	hs.getAllData();
        	 model.addAttribute("data", list);
            return "Sucess"; // Admins have CID from 1 to 10
        } else {
        	 AccountCreationDetails user = hs.loginC(cid, pass);

             if (user == null) {
                 model.addAttribute("error", "Invalid Customer ID or Password. Please try again.");
                 return "login";
             }else {
   
            	 model.addAttribute("a", user);
                 return "Transaction"; // Others are Users
             }
        	
        }
        
    }	
@GetMapping("/wel")
public String welCome()
{
return "OscW";
}
@GetMapping("welNext")
public String wNext()
{
	return"WRegister";
}

  
@PostMapping("/credit")
public String creditAmount(
    @RequestParam("cid") int cid,
    @RequestParam(required = true, defaultValue = "") String cnm,
    @RequestParam("amount") double amount,
    @RequestParam("transactionDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate transactionDate,
    @RequestParam("transactionType") String transactionType,
    @ModelAttribute AccountCreationDetails a,
    Model m) {
	

    System.out.println("credited amount:" + amount + 
                       " customer id:" + cid +
                       "name is:"+cnm +
                       " Date: " + transactionDate +
                       " type:" + transactionType);
    hs.creditAmount(cid, cnm,amount, transactionDate, transactionType,cid, a);

  a.setBalance(a.getBalance()+amount);
hr.updateBalance(cid, amount);

m.addAttribute("amount", amount);
System.out.println("account cuurent balnce is="+a.getBalance());
m.addAttribute("dateTime", transactionDate);
 m.addAttribute("transactionType", transactionType);
    return "Tsucess";
}

@PostMapping("/withdraw")
public String preWithdrow(@RequestParam("cid")int cid,
		@RequestParam(value = "amount", required = false, defaultValue = "0.0") double amount,
		@RequestParam(value = "balance", required = false, defaultValue = "0.0") double balance,
	    @RequestParam("transactionType") String transactionType,

        @ModelAttribute AccountCreationDetails a,
	Model m)
{
	hs.withdrawAmount(cid, transactionType,amount);
	m.addAttribute("amount", amount);
    m.addAttribute("CurrentBalance", balance - amount);
    m.addAttribute("transactionType", transactionType);

	m.addAttribute("a", a);
	return"withdrawPage";
}

@PostMapping("/checkBalance")
public String checkBalance(@RequestParam(name = "cid", required = false) Integer cid,
		@RequestParam(value = "balance", required = false, defaultValue = "0.0") double balance,
        @ModelAttribute AccountCreationDetails a,
Model m) {
	AccountCreationDetails user=hs.checkBalance(cid, balance);        
      
	 m.addAttribute("a", user);
	 double b=user.getBalance();
     System.out.println("your balnace is"  +b);
     m.addAttribute("b", b);
        m.addAttribute("cid", cid);
    
    return "Normal";
}
@Autowired
TransactionRepository trs;




@PostMapping("/viewTransaction")
public String viewTransactions(@RequestParam("cid") int cid, Model model) {
    List<Transact> transactions = hs.getTransactionsByCid(cid); // ✅ Make sure this returns ALL types
    model.addAttribute("transactions", transactions);
return 	"ViewTransactionPage";
}


@GetMapping("/transfer")
public String showTransferForm(Model model) {
    model.addAttribute("transferRequest", new TransferRequest());
    return "TransferPage"; // return transfer.jsp
}

@PostMapping("/transfer")
public String doTransfer(@ModelAttribute("transferRequest") TransferRequest request,
                         Model model) {
    try {
        String message = hs.transferAmount(request);
        model.addAttribute("successMessage", message);
    } catch (RuntimeException e) {
        model.addAttribute("errorMessage", e.getMessage());
    }

    return "TransferPage"; // return transfer.jsp again
}




@GetMapping("/resetMpin")
public String showResetMpinForm() {
    return "resetMpinPage"; // JSP: resetMpin.jsp
}

@PostMapping("/resetMpin")
public String resetMpin(@RequestParam("cid") int cid,
		@RequestParam(name = "pass", required = false) String pass,
		@RequestParam(name = "confirmMpin", required = false) String confirmMpin,

                        Model model) {

	System.out.println("Received CID: " + cid);
	System.out.println("pass = " + pass);
	System.out.println("confirmMpin = " + confirmMpin);
	model.addAttribute("cid", cid);

System.out.println("pass is="+pass);
	if(pass!=null && pass.equals(confirmMpin))
	{
		model.addAttribute("cid", cid);

		 model.addAttribute("error", "MPINs do not match.");
  return "resetMpinPage";
	}
    boolean success = hs.updateMpin(cid, confirmMpin);
    if (success) {
        model.addAttribute("message", "MPIN reset successfully.");
    } else {
        model.addAttribute("error", "Failed to reset MPIN. Invalid Customer ID?");
    }

    return "resetMpinPage";
}

@GetMapping("/mpass")
public String preMpass()
{
	return"PBRequestjsp";
}


@PostMapping("/passbook")
public String handleRegistration(
		@RequestParam(name = "cid", required = true) Integer cid, 
		@RequestParam(name = "mob", required = true) String mob, 
        Model model) {

    // You can add validation, saving to DB, etc.
    System.out.println("CID: " + cid);
    System.out.println("Mobile: " + mob);

    // Example: Check if CID exists and show success or error
    boolean valid = hs.verifyCidAndMobile(cid, mob);

    if (valid) {
        model.addAttribute("message", "Registration Successful!");
        System.out.println("hello");
        return "Msucess"; // Show a JSP page named "successPage.jsp"
    } else {
        model.addAttribute("error", "Invalid Customer ID or Mobile Number");
        return "PBRequestjsp"; // Show the registration form again
    }
}



 
@PostMapping("/apply-loan")
public String applyLoan(@ModelAttribute Transact loan, 
                        @RequestParam(name = "cid", required = true) Integer cid, double amount,String loanType,
                        Model m) {

    if (cid == null) {
        m.addAttribute("error", "Session expired. Please log in again.");
        return "login";
    }

    loan.setCid(cid);

    boolean exists = trs.existsByCidAndLoanType(loan.getCid(), loan.getLoanType());

    if(exists)
    {
        m.addAttribute("error", "You have already applied for this loan.");
        return "loanDupalicatePage"; // Create this JSP to show the message
    }
    Transact saved = hs.applyLoan(loan);

    List<Transact> loans = hs.getLoansByAccount(cid, amount, loanType);
    m.addAttribute("loans", loans);
    m.addAttribute("message", "Loan Application Submitted!");

    return "loanSucess";
}

@GetMapping("/aLoan")
public String showLoanForm(HttpServletRequest request, Model model) {
    HttpSession session = request.getSession();
    Integer cid = (Integer) session.getAttribute("cid");
    if (cid != null) {
        model.addAttribute("accountId", cid);
    }
    model.addAttribute("loan", new Transact());
    return "loanPage";
}


@GetMapping("/my-loans/{cid}")
public String viewLoans(@PathVariable int cid, Model model,double amount,String loanType) {
    List<Transact> loans = hs.getLoansByAccount(cid, amount, loanType);
    model.addAttribute("loans", loans);
    
    return "loanSucess"; // JSP
}




}












