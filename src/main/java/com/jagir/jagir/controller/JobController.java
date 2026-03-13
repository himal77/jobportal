package com.jagir.jagir.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JobController {

    @GetMapping("/jobs")
    public String jobs() {
        return "no jobs posted yet";
    }

    @GetMapping("/created")
    public String health() {
        return "Trying to create job";
    }
}
