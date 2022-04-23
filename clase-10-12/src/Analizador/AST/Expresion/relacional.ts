import { Expresion } from "./expresion";

export enum TipoRelacional {
    MAYOR, MENOR, IGUAL, DIFERENTE, MAYORIGUAL, MENORIGUAL
}

export class Relacional extends Expresion {
    izquierda: Expresion;
    derecha: Expresion;
    tipo: TipoRelacional;

    constructor(izq: Expresion, der: Expresion, tipo: TipoRelacional, linea: number, columna: number) {
        super(linea, columna);
        this.izquierda = izq;
        this.derecha = der;
        this.tipo = tipo;
    }

    getValue() {
        const vali = Number(this.izquierda.getValue());
        const vald = Number(this.derecha.getValue());
        switch (this.tipo) {
            case TipoRelacional.DIFERENTE: return vali !== vald;
            case TipoRelacional.IGUAL: return vali == vald;
            case TipoRelacional.MENOR: return vali < vald;
            case TipoRelacional.MAYOR: return vali > vald;
            case TipoRelacional.MENORIGUAL: return vali <= vald;
            case TipoRelacional.MAYORIGUAL: return vali >= vald;
            default: return -1;
        }
    }

    getASTCode() {
        
    }

}