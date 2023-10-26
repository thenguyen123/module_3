package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class User4 {
   @GetMapping("/thuc")
    public String get(){
       return "index";
   }
}
