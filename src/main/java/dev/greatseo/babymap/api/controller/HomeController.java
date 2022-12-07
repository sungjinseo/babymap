package dev.greatseo.babymap.api.controller;

import dev.greatseo.babymap.api.service.HomeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    /**
     * rest api 형식이 아닌 일반 호출용...하지만 테스트용임
     */
    private final HomeService service;

    public HomeController(HomeService service) {
        this.service = service;
    }

    @RequestMapping("/")
    public @ResponseBody String hello() {
        return "Hello, World";
    }

    @RequestMapping("/greeting")
    public @ResponseBody String greeting() {
        return service.greet();
    }
}
