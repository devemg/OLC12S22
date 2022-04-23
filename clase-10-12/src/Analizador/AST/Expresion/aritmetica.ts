import { Expresion } from "./expresion";

export enum TipoAritmetica {
    SUMA = 'suma', RESTA = 'resta', MULTIPLICACION = 'multiplicacion', DIVISION = 'division'
}

export class Aritmetica extends Expresion {
    izquierda: Expresion;
    derecha: Expresion;
    tipo: TipoAritmetica;

    constructor(izq: Expresion, der: Expresion, tipo: TipoAritmetica, linea: number, columna: number) {
        super(linea, columna);
        this.izquierda = izq;
        this.derecha = der;
        this.tipo = tipo;
    }

    getValue() {
        const vali = Number(this.izquierda.getValue());
        const vald = Number(this.derecha.getValue());
        switch (this.tipo) {
            case TipoAritmetica.SUMA: return vali + vald;
            case TipoAritmetica.RESTA: return vali - vald;
            case TipoAritmetica.MULTIPLICACION: return vali * vald;
            case TipoAritmetica.DIVISION: return vali / vald;
            default: return -1;
        }
    }

    getASTCode() {
        
    }

}