package mapper;

import entity.Student;

import java.util.List;

public interface StudentMapper {

    List<String> queryStudentClassByArray(String[] studentNames);

    List<String> queryStudentClassByList(List<Student> studentList);

}
