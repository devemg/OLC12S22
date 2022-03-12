package analyzer;

public class Generator {
    public static void main(String[] args) {
        try {
            String ruta =  "src/analyzer/";
            String opcFlex[] =  {ruta+"scanner.flex","-d",ruta};
            jflex.Main.generate(opcFlex);

            String opcCup[] =  {"-destdir", ruta,"-parser","Parser",ruta+"parser.cup"};
            java_cup.Main.main(opcCup);
        } catch (Exception e) {
        }
    }
}
