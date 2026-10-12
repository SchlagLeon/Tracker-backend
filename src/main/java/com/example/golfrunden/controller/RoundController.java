package com.example.golfrunden.controller;

import com.example.golfrunden.model.Round;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/rounds")
public class RoundController {

    @GetMapping
    public List<Round> getAll() {
        Round r = new Round();
        r.setId(1L);
        r.setDate(LocalDate.now());
        r.setCourseName("Testplatz");
        r.setNote("Erste Testrunde");
        return List.of(r);
    }
}
