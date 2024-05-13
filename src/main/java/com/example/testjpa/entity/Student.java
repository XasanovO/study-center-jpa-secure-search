package com.example.testjpa.entity;

import com.example.testjpa.entity.template.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Builder
public class Student extends BaseEntity {
    private String firstName;
    private String lastName;
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Group group;
}
