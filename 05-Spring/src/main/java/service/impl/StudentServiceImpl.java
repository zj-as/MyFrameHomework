package service.impl;

import entity.Student;
import mapper.StudentMapper;
import service.StudentService;

import java.util.List;

public class StudentServiceImpl implements StudentService {

    private StudentMapper studentMapper;

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    public List<String> queryStudentClassByArray(String[] studentNames) {
        List<String> classNames = studentMapper.queryStudentClassByArray(studentNames);
        return classNames;
    }

    @Override
    public List<String> queryStudentClassByList(List<Student> studentList) {
        List<String> classNames = studentMapper.queryStudentClassByList(studentList);
        return classNames;
    }

}
