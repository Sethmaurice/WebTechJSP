import org.junit.jupiter.api.Test;
import com.example.student_mis.model.Semester;
import com.example.student_mis.Service.SemesterInteface;
import com.example.student_mis.Service.SemesterServiceImpl;


import java.time.LocalDate;
import java.util.UUID;
public class testInsert {
    @Test
    public void testSemester(){
        Semester semester = new Semester();
        semester.setId(UUID.randomUUID());
        semester.setName("Neo Joram");
        semester.setStartDate(LocalDate.parse("2023-09-01"));
        semester.setEndDate(LocalDate.parse("2023-12-22"));

        SemesterInteface service = new SemesterServiceImpl();
        service.addSemester(semester);
    }
}
