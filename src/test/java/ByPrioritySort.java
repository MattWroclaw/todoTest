import org.junit.Test;
import pack.Task;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class ByPrioritySort {

    @Test
    public void sortByPriority(){
//        given
        Task t1 = new Task();
        t1.setDesk("pie");
        t1.setPriority("HI");

        Task t2 = new Task();
        t2.setDesk("dw");
        t2.setPriority("LO");

        Task t3 = new Task();
        t3.setDesk("tr");
        t3.setPriority("MID");

        Task t4 = new Task();
        t4.setDesk("cz");
        t4.setPriority("HI");

        Task t5 = new Task();
        t5.setDesk("pc");
        t5.setPriority("MID");

        Task t6 = new Task();
        t6.setDesk("sze");
        t6.setPriority("LO");

        List<Task> listaTaskow = new ArrayList<>();
        listaTaskow.add(t1);
        listaTaskow.add(t2);
        listaTaskow.add(t3);
        listaTaskow.add(t4);
        listaTaskow.add(t5);
        listaTaskow.add(t6);

        List<Task> liHi = new ArrayList<>();
        List<Task> liMid = new ArrayList<>();
        List<Task> liLo = new ArrayList<>();
       for (int i = 0 ; i<listaTaskow.size(); i++){
           Task task = listaTaskow.get(i);
           String priority = task.getPriority();

           if(priority.equals("HI")){
               liHi.add(task);
           }
           if(priority.equals("MID")){
               liMid.add(task);
           }
           if(priority.equals("LO")){
               liLo.add(task);
           }

       }

//        when
        System.out.println("Hi's");
        for (Task task : liHi) {
            System.out.print(task.getPriority()+", ");
            System.out.println(task.getDesk());
        }
        System.out.println("Mid's");
        for (Task task : liMid) {
            System.out.print(task.getPriority()+", ");
            System.out.println(task.getDesk());
        }
        System.out.println("Low's");
        for (Task task : liLo) {
            System.out.print(task.getPriority()+", ");
            System.out.println(task.getDesk());
        }

//        then


    }


}
