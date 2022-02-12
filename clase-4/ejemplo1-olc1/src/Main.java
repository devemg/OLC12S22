import analyzer.Datos;
import analyzer.Parser;
import analyzer.Scanner;

import java.io.StringReader;

public class Main {

    public static void main(String[] args) {
        try {
            Parser parser = new Parser(new Scanner(new StringReader("evaluar 14 / 1; evaluar 14 / 1; evaluar 14 / 1; evaluar 14 / 1;")));
            parser.parse();
            if (Datos.errores.size() == 0) {
                System.out.println("Analisis éxitoso!");
                int i;
                for (i = 0; i < Datos.resultados.size(); i++) {
                    System.out.println("Resultado: " + Datos.resultados.get(i));
                }
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
    // evalur 14 / 1a; evaluar 14 / 1; evaluar 14 / 1; evaluar 14 / 1;
}
