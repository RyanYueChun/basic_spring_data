package com.example.demo_data;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class MyService {

    private final MyRepository myRepository;

    public MyService(MyRepository myRepository) {
        this.myRepository = myRepository;
    }

    public MyEntity getEntity(Long id) {
        return myRepository.getReferenceById(id);
    }
    
    public List<MyEntity> getAll() {
        return myRepository.findAll();
    }

    public MyEntity pushEntity() {
        // Create the MyEntity instance
        MyEntity entity = new MyEntity();
        entity.setEmail("email");
        entity.setName("name");
        entity.setPassword("password");

        // Create the MyProduct instance and set the myentity reference
        MyProduct mp = new MyProduct();
        mp.setMyentity(entity);

        // Set the products list with the new product
        entity.setProducts(Arrays.asList(mp));

        // Save the entity along with its products
        return myRepository.save(entity);
    }
}
