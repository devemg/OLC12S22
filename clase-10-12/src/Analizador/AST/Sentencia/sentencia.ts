import { TablaSimbolos } from "../tabla-simbolos";

export abstract class Sentencia {
    linea: number;
    columna: number;

    constructor(linea: number, columna: number) {
        this.linea = linea;
        this.columna = columna;
    }

    abstract ejectuar(tablaSimbolos: TablaSimbolos): any;

}