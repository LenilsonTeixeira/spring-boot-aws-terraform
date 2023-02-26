package com.lteixeira;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("hello")
@SpringBootApplication
public class SpringBootAwsTerraformApplication {

	@GetMapping
	public String sayHello() {
		return "Hello";
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootAwsTerraformApplication.class, args);
	}

}
