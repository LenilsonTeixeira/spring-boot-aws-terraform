package com.lteixeira;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("hello")
@SpringBootApplication
public class SpringBootAwsTerraformApplication {

	@Value("${app.value}")
	private String value;

	@GetMapping
	public String sayHello() {
		return "Hello";
	}

	@GetMapping("/{name}")
	public String sayHelloByName(@PathVariable("name") String name) {
		return "Hello: "+ name + " By APP value= "+ value;
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootAwsTerraformApplication.class, args);
	}

}
