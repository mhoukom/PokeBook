package com.houkom.pokebook.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.houkom.pokebook.models.Expense;
import com.houkom.pokebook.services.ExpenseService;

@Controller
public class HomeController {
	
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/")
	public String index(Model model, @ModelAttribute("newExpense")Expense newExpense) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	
	@PostMapping("/")
	public String processCreateExpense(@Valid @ModelAttribute("newExpense")Expense newExpense, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}
		expenseService.addExpense(newExpense);
		return "redirect:/";
	}
	
	@GetMapping("/expense/{id}")
	public String showOneExpense(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseService.findOneExpense(id);
		model.addAttribute("expense", expense);
		return "showOneExpense.jsp";
	}
	
	@GetMapping("/expense/{id}/edit")
	public String editExpense(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseService.findOneExpense(id);
		Expense emptyExpense = new Expense();
		model.addAttribute("expense", expense);
		return "editExpense.jsp";
	}
	
	@PutMapping("/expense/{id}/edit")
	public String processEditExpense(@Valid @ModelAttribute("expense")Expense expense, BindingResult result, @PathVariable("id")Long id) {
		if(result.hasErrors()) {
			return "editExpense.jsp";
		}else {
			expenseService.editExpense(expense);
			return "redirect:/";
		}
	}
	
	@DeleteMapping("/expense/{id}/delete")
	public String processDeleteExpense(@PathVariable("id")Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/";
	}
}
