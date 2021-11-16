package dao;

import entity.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

public interface StudentDao {

    @Insert("INSERT INTO student VALUES (#{no}, #{name})")
    int insertStudent(Student student);

    @Update("UPDATE student SET name = #{name} WHERE no = #{no}")
    int updateStudent(Student student);

    @Delete("DELETE FROM student WHERE name = #{name}")
    int deleteStudent(String name);

}

