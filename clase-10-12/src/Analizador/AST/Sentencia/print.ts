import { Expresion } from "../Expresion/expresion";
import { TablaSimbolos } from "../tabla-simbolos";
import { Sentencia } from "./sentencia";

export class Print extends Sentencia {
    valor: Expresion;

    constructor(valor: Expresion, linea: number, columna: number) {
        super(linea, columna);
        this.valor = valor;
    }

    ejectuar(tablaSimbolos: TablaSimbolos) {
        const value = this.valor.getValue();
        console.log(value);
    }

}