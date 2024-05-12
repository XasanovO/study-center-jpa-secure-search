package com.example.testjpa.entity;

import com.example.testjpa.entity.template.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Student extends BaseEntity {
    private String firstName;
    private String lastName;
    @ManyToOne
    private Group group;
}
