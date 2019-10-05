import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class TableTest {

    @Test
    public void testDruku() {
//  given
        List<String> lista = new ArrayList<>();
        lista.add("zero");
        lista.add("jeden");
        lista.add("dwa");
        lista.add("trzy");
        lista.add("cztery");
        for (String s : lista) {
            System.out.print("Element: "+lista.indexOf(s)+"+");
            System.out.print(s+" /");
        }
        System.out.println();
//        when
        lista.remove(2);
        for (String s : lista) {
            System.out.print("Element: "+lista.indexOf(s)+"+");
            System.out.print(s+" /");
        }
        System.out.println();
//        then
        for (String s : lista) {
            System.out.print("Element: "+lista.indexOf(s)+"+");
            System.out.print(s+" /");
        }

    }
}
