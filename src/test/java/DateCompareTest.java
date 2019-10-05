import lombok.ToString;
import org.junit.Test;
import pack.Task;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class DateCompareTest {

    @Test
    public void datePrint(){
//        given
        LocalDateTime tera = LocalDateTime.now();
        LocalDateTime zara = LocalDateTime.now().minusDays(2L);
//        when

//        then
        System.out.println("tera + zara");
        System.out.println("tera: "+tera);
        System.out.println("zara: "+zara);

        System.out.println("tera minus 100d");
        System.out.println("plus: "+tera.minusDays(100L));
        System.out.println("minus: "+tera.plusDays(100L));

    }

    @Test
    public void dateSortTest(){
//        given
        Task task  = new Task();
        Task task2  = new Task();
        Task task3  = new Task();
        Task task4  = new Task();
        List<Task> listTest = new ArrayList<>();
        LocalDateTime teraz = LocalDateTime.now();

        LocalDateTime pier = teraz;
        LocalDateTime dru = teraz.minusDays(2l);
        LocalDateTime trze = teraz.minusDays(20l);
        LocalDateTime czw  = teraz.minusDays(100L);

        task.setFinishDate(pier);
        task2.setFinishDate(dru);
        task3.setFinishDate(trze);
        task4.setFinishDate(czw);
        System.out.println("########");
        System.out.println(pier);
        System.out.println(dru);
        System.out.println(trze);
        System.out.println(czw);
        System.out.println("#############");
//    when

        listTest.add(task3);
        listTest.add(task4);
        listTest.add(task);
        listTest.add(task2);
        System.out.println("getFinishDate");
        System.out.println(task.getFinishDate());
        System.out.println(task2.getFinishDate());
        System.out.println(task3.getFinishDate());
        System.out.println("koniec get finishdate");
        for (Task t : listTest) {
            System.out.println(t.getFinishDate());
        }

        System.out.println("**************");
        listTest.sort((o1, o2) -> o1.getFinishDate().compareTo(o2.getFinishDate()));
        for (Task tas : listTest) {
            System.out.println(tas.getFinishDate());
        }

//    then



    }

}
