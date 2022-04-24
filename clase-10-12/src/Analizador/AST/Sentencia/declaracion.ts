import { Expresion } from "../Expresion/expresion";
import { TablaSimbolos } from "../tabla-simbolos";
import { TipoDato } from "../tipo-dato";
import { Sentencia } from "./sentencia";

export class Declaracion extends Sentencia {
    tipo: TipoDato;
    nombre: string;
    valor: Expresion;

    constructor(tipo: TipoDato, nombre: string, valor: Expresion, linea: number, columna: number) {
        super(linea, columna);
        this.tipo = tipo;
        this.nombre = nombre;
        this.valor = valor;
    }

    ejectuar(tablaSimbolos: TablaSimbolos) {
        //1. validar si el nombre no existe en la tabla de simbolos
        //2. si existe, es error 
        //3. Definir el valor a asignar (si existe una asignacion, obtener el valor de exp. Si no existe, obtener valor por defecto)
        //4. si no existe la variable en TS, voy a crear el simbolo
        //5. Guardar en la TS
        if (!tablaSimbolos.existe(this.nombre)) {
            const valor = this.valor ? this.valor.getValue() : 0;
            tablaSimbolos.agregar(this.tipo, valor, this.nombre, this.linea, this.columna);
        } else {
            // ERROR SEMANTICO
        }
    }

}