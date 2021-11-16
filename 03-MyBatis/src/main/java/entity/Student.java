package entity;

import lombok.Data;

@Data
public class Student {

    private String no;
    private String name;
    private String classNo;
    // 一个学生只能在一个班级
    private Clazz clazz;

}
