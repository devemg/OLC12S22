import { TipoDato } from "./tipo-dato";

class Simbolo {
    linea: number;
    columna: number;
    valor: any;
    nombre: string;
    tipo: TipoDato;


    constructor(tipo: TipoDato, valor: any, nombre: string, linea: number, columna: number) {
        this.tipo = tipo;
        this.nombre = nombre;
        this.valor = valor;
        this.linea = linea;
        this.columna = columna;
    }
    
}

export class TablaSimbolos {
    simbolos: Simbolo[] = [];

    agregar(tipo: TipoDato, valor: any, nombre: string, linea: number, columna: number) {
        const nuevo = new Simbolo(tipo, valor,nombre, linea, columna);
         this.simbolos.push(nuevo);
    }

    existe(nombre: string): boolean {
        return this.simbolos.findIndex((element) => element.nombre === nombre) > -1;
    }

    obtenerValor(nombre: string): any {
        const simbolo = this.simbolos.find((element) => element.nombre === nombre);
        if (simbolo) {
            return simbolo.valor;
        }
        // error
        return null;
    }

    asignarValor(nombre: string, valor: any) {
        const simbolo = this.simbolos.find((element) => element.nombre === nombre);
        if (simbolo) {
            simbolo.valor = valor;
        }
    }
}