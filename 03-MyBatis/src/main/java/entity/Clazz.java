package entity;

import lombok.Data;

import java.util.List;

@Data
public class Clazz {

    private String classNo;
    private String className;
    // 一个班级可以有多个学生
    private List<Student> studentList;

}
