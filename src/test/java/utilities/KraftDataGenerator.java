package utilities;

import com.github.javafaker.Faker;

import java.util.LinkedHashMap;
import java.util.Map;

public class KraftDataGenerator {

    /**
     * {
     *   "name": "aFm",
     *   "email": "dev@krafttechexlab.com",
     *   "password": "123467",
     *   "about": "About Me",
     *   "terms": "10"
     * }
     */

    public static Map<String,Object> createUser(){
        Faker faker = new Faker();
        String name = faker.name().fullName();
        String email = name + "@gmail.com";
        String password = "1234567";
        String about = "Excellent Kraft Student";
        String terms = "10";
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("name", name);
        map.put("email", email);
        map.put("password", password);
        map.put("about", about);
        map.put("terms", terms);
        return map;
    }
}
