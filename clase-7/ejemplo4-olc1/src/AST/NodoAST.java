package AST;

import analyzer.Datos;

import java.util.ArrayList;

public class NodoAST {
    TipoNodo tipo;
    Object valor;
    ArrayList<NodoAST> hijos = new ArrayList<>();
    private String ide = this.toString().replace(".","").replace("@","");

    public NodoAST(TipoNodo tipo, Object valor){
        this.tipo = tipo;
        this.valor = valor;
    }

    public NodoAST(TipoNodo tipo){
        this.tipo = tipo;
        this.valor = null;
    }

    public void agregarHijo(NodoAST hijo) {
        this.hijos.add(hijo);
    }

    public void asignarHijos(ArrayList<NodoAST> hijos) {
        this.hijos = hijos;
    }

    public Object ejecutar() {
        switch (this.tipo) {
            case MULTIPLICACION:
            case DIVISION:
            case SUMA:
            case RESTA:
            case DECIMAL:
            case ENTERO:
                return this.resolverAritmetica();
            case INSTRUCCION:
                System.out.println("El resultado es: " + this.hijos.get(0).ejecutar());
                break;
            case RAIZ:
                this.hijos.forEach(nodoAST -> {
                    nodoAST.ejecutar();
                });
                break;

        }
        return null;
    }

    private Object resolverAritmetica() {
        switch (this.tipo) {
            case DECIMAL:
            case ENTERO:
                return this.valor;
            case SUMA:
                NodoAST izquierdo = this.hijos.get(0);
                NodoAST derecho = this.hijos.get(1);
                if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.ENTERO) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) + Integer.parseInt(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.DECIMAL) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) + Double.parseDouble(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.DECIMAL) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) + Double.parseDouble(derecho.resolverAritmetica().toString());
                }else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.ENTERO) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) + Integer.parseInt(derecho.resolverAritmetica().toString());
                } else {
                    // ERROR
                    Datos.errores.add("Este es un error semántico en una operación aritmetica");
                    System.out.println("!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!");
                    System.out.println(izquierdo.tipo + ", " + derecho.tipo);
                }
                break;
            case RESTA:
                izquierdo = this.hijos.get(0);
                derecho = this.hijos.get(1);
                if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.ENTERO) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) - Integer.parseInt(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.DECIMAL) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) - Double.parseDouble(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.DECIMAL) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) - Double.parseDouble(derecho.resolverAritmetica().toString());
                }else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.ENTERO) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) - Integer.parseInt(derecho.resolverAritmetica().toString());
                } else {
                    // ERROR
                    Datos.errores.add("Este es un error semántico en una operación aritmetica");
                    System.out.println("!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!");
                    System.out.println(izquierdo.tipo + ", " + derecho.tipo);
                }
                break;
            case MULTIPLICACION:
                izquierdo = this.hijos.get(0);
                derecho = this.hijos.get(1);
                if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.ENTERO) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) * Integer.parseInt(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.DECIMAL) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) * Double.parseDouble(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.DECIMAL) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) * Double.parseDouble(derecho.resolverAritmetica().toString());
                }else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.ENTERO) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) * Integer.parseInt(derecho.resolverAritmetica().toString());
                } else {
                    // ERROR
                    Datos.errores.add("Este es un error semántico en una operación aritmetica");
                    System.out.println("!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!");
                    System.out.println(izquierdo.tipo + ", " + derecho.tipo);
                }
                break;
            case DIVISION:
                izquierdo = this.hijos.get(0);
                derecho = this.hijos.get(1);
                if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.ENTERO) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) / Integer.parseInt(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.DECIMAL) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) / Double.parseDouble(derecho.resolverAritmetica().toString());
                } else if (izquierdo.tipo == TipoNodo.ENTERO && derecho.tipo == TipoNodo.DECIMAL) {
                    return Integer.parseInt(izquierdo.resolverAritmetica().toString()) / Double.parseDouble(derecho.resolverAritmetica().toString());
                }else if (izquierdo.tipo == TipoNodo.DECIMAL && derecho.tipo == TipoNodo.ENTERO) {
                    return Double.parseDouble(izquierdo.resolverAritmetica().toString()) / Integer.parseInt(derecho.resolverAritmetica().toString());
                } else {
                    // ERROR
                    Datos.errores.add("Este es un error semántico en una operación aritmetica");
                    System.out.println("!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!");
                    System.out.println(izquierdo.tipo + ", " + derecho.tipo);
                }
                break;
        }
        return -1;
    }

    public String getGrafica() {
        StringBuilder grafica = new StringBuilder();
        grafica.append(this.ide).append("[ label=\"").append(this.tipo);
        if (this.tipo == TipoNodo.DECIMAL || this.tipo == TipoNodo.ENTERO) {
            grafica.append(" (").append(this.valor).append(")");
        }
        grafica.append("\"];\n");
        this.hijos.forEach(nodoAST -> {
            grafica.append(nodoAST.getGrafica());
        });
        this.hijos.forEach(nodoAST -> {
            grafica.append(this.ide).append("->").append(nodoAST.ide).append(";\n");
        });
        return  grafica.toString();
    }

}
