import { Expresion } from "./expresion";

export class Valor extends Expresion {
    valor: any; 

    constructor(valor: any, linea: number, columna: number) {
        super(linea, columna);
        this.valor = valor;
    }

    getValue() {
        return this.valor;
    }

    
    getASTCode() {
        throw new Error("Method not implemented.");
    }
    
}