import { Sentencia } from "./Analizador/AST/Sentencia/sentencia";
import { TablaSimbolos } from "./Analizador/AST/tabla-simbolos";

const gramatica = require('../dist/Analizador/gramatica');
var fs = require('fs');

fs.readFile('src/codigo-fuente.txt', (err:any, data:any) => {
    if (err) {
        throw err;
    }
    const text = data.toString();
    const response = gramatica.parse(text);
    const ts = new TablaSimbolos();
    response.forEach((element: Sentencia) => {
        element.ejectuar(ts);
    });
    console.log(ts);
    try {
       
     } catch (e) {
        console.log('error en tiempo de ejecución');
        //console.log(e.getMessage());
     }
});
