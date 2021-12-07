package student.gl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import student.gl.entities.Student;
import student.gl.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/list")
	public String listBooks(Model model) {
		System.out.println("Get the List");
		
		List<Student> students = studentService.findAll();
		model.addAttribute("Student",students);
		return "student-list";
	}

	@Transactional
	@RequestMapping("/add")
	public String addStudent(Model model) {

		Student student = new Student();

		model.addAttribute("Student", student);

		return "student-form";
	}
	
	@Transactional
	@RequestMapping("/update")
	public String updateStudent(@RequestParam("studentId") int id, Model model) {

		Student student = studentService.findById(id);

		model.addAttribute("Student", student);

		return "student-form";
	}
	
	@Transactional
	@PostMapping("/save")
	public String save(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("department") String department, @RequestParam("country") String country) {
		
		Student student;
		
		if(id != 0) {
			student = studentService.findById(id);
			student.setName(name);
			student.setCountry(country);
			student.setDepartment(department);
		}
		else {
			student = new Student(name,department,country);
		}
		
		studentService.save(student);

		return "redirect:/student/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int id) {
		
        studentService.deleteById(id);
        
        return "redirect:/student/list";
	}
	

}
