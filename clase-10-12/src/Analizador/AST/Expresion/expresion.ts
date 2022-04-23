export abstract class Expresion {
    linea: number;
    columna: number;

    constructor(linea: number, columna: number) {
        this.linea = linea;
        this.columna = columna;
    }

    abstract getValue(): any;

    abstract getASTCode(): any;
}