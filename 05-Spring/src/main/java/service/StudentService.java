package service;

import entity.Student;

import java.util.List;

public interface StudentService {

    List<String> queryStudentClassByArray(String[] studentNames);

    List<String> queryStudentClassByList(List<Student> studentList);

}
