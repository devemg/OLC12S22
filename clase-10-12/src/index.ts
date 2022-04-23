const gramatica = require('../dist/Analizador/gramatica');
var fs = require('fs');

fs.readFile('src/codigo-fuente.txt', (err:any, data:any) => {
    if (err) {
        throw err;
    }
    const text = data.toString();
    const response = gramatica.parse(text);
    console.log('LA RESPUESTA ES: ', response.getValue());
    try {
       
     } catch (e) {
        console.log('error en tiempo de ejecución');
        //console.log(e.getMessage());
     }
});
