package com.example.demo_data;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {
    private final MyService service;

    public MyController(MyService service) {
        this.service = service;
    }
    
    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/")
    String home() {
        return "API for MyController related resources";
    }

    @ResponseStatus(HttpStatus.FOUND)
    @GetMapping("/all")
    List<MyEntity> getEntities() {
        return service.getAll();
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/")
    MyEntity pushEntity() {
        return service.pushEntity();
    }
}
