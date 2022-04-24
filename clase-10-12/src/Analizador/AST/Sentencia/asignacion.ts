import { Expresion } from "../Expresion/expresion";
import { TablaSimbolos } from "../tabla-simbolos";
import { Sentencia } from "./sentencia";

export class Asignacion extends Sentencia {
    nombre: string;
    valor: Expresion;

    constructor(nombre: string, valor: Expresion, linea: number, columna: number) {
        super(linea, columna);
        this.nombre = nombre;
        this.valor = valor;
    }

    ejectuar(tablaSimbolos: TablaSimbolos) {
       if (tablaSimbolos.existe(this.nombre)) {
        const valor = this.valor.getValue();
        // comprobar tipos 
        // CASTEOS 
        tablaSimbolos.asignarValor(this.nombre, valor);
       } else {
           // error
       }
    }
}