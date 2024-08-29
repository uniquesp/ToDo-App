package com.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entities.Todo;



@Controller
public class HomeController {

	@Autowired
	ServletContext context;
	
	@RequestMapping("/home")
	public String home(Model m) {
		String str = "Home";
		m.addAttribute("page", str);
		List<Todo> list = (List<Todo>) context.getAttribute("list");
		m.addAttribute("todos",list);
		return "home";
	}
	
	@RequestMapping("/add")
	public String addToDo(Model m) {
		String str = "Add";
		m.addAttribute("page", str);
		Todo t = new Todo();
		m.addAttribute("todo", t);
		return "home";
	}
	
	@RequestMapping(value="/saveTodo", method=RequestMethod.POST)
	public String SaveToDo(@ModelAttribute("todo") Todo t, Model m) {
		System.out.println(t);
		t.setTodoDate(new Date());
		//get todo list from context
		@SuppressWarnings("unchecked")
		List<Todo> list = (List<Todo>)context.getAttribute("list");
		list.add(t);
		m.addAttribute("message","Successfully added Todo !!");
		return "home";
		
	}
}
