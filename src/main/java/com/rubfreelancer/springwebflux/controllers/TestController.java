package com.rubfreelancer.springwebflux.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rubfreelancer.springwebflux.models.Person;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("test")
@RestController
public class TestController {
	
	@GetMapping
	public Person get() {
		log.error("Errror");
		Person p = new Person();
		p.setId("Prueba");
		return p;
	}
}
