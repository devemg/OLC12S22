package analyzer;

import AST.NodoAST;

import java.util.ArrayList;

public class Datos {
    public static ArrayList<String> errores = new ArrayList<>();
    public static NodoAST raiz;

    public static String getGrafica() {
        if (Datos.raiz != null) {
            return "digraph AST {\n"+Datos.raiz.getGrafica()+"}";
        }
        return "";
    }
}