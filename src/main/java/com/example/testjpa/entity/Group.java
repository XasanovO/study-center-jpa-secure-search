package com.example.testjpa.entity;

import com.example.testjpa.entity.template.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Builder
@Table(name = "groups")
public class Group extends BaseEntity {
    private String name;

}
