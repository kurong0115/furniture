package com.house.furniture;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication(scanBasePackages = {"com.house"})
@MapperScan("com.house.furniture.dao")
public class FurnitureApplication {

	public static void main(String[] args) {
		SpringApplication.run(FurnitureApplication.class, args);
	}

}
