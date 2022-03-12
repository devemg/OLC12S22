import analyzer.Datos;
import analyzer.Parser;
import analyzer.Scanner;

import javax.xml.crypto.Data;
import java.io.StringReader;

public class Main {

    public static void main(String[] args) {
        try {
            //  evaluar 4 + 7 + 7 + 4;
           Parser parser = new Parser(new Scanner(new StringReader("evaluar 2 * 15.5 - 48; ")));
            parser.parse();
            if (Datos.errores.size() == 0) {
                System.out.println("Analisis éxitoso!");
                Datos.raiz.ejecutar();
                System.out.println(Datos.getGrafica());
            } else {
                int i;
                for (i = 0; i < Datos.errores.size(); i++) {
                    System.out.println(Datos.errores.get(i));
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    //  evaluar 14 / 1; evaluar 14 / 1;
}
