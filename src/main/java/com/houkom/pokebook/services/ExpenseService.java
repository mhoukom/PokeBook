package com.houkom.pokebook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.houkom.pokebook.models.Expense;
import com.houkom.pokebook.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	
	public Expense addExpense(Expense expense) {
		return expenseRepository.save(expense);
	}

	public Expense findOneExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}else {
		
			return null;
		}
	}
	
	public Expense editExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	public void deleteExpense(Long id) {
		expenseRepository.deleteById(id);
	}
}	
