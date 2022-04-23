///configuraciones
%{
    const { Aritmetica, TipoAritmetica } = require('./AST/Expresion/aritmetica.js');
    const { Relacional, TipoRelacional } = require('./AST/Expresion/relacional.js');
    const { Valor } = require('./AST/Expresion/valor.js');
%}

%lex
%options case-insensitive

%% 
//definir tokens 
// ER      retrun 'NOMBRE_TOKEN'
/* SIMBOLOS */
\s+											                    // se ignoran espacios en blanco
"//".*										                    // comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			                    // comentario multiple líneas

"+"                                                             return 'tk_suma';
"-"                                                             return 'tk_resta';
"*"                                                             return 'tk_por';
"**"                                                            return 'tk_pot';
"/"                                                             return 'tk_div';
"%"                                                             return 'tk_mod';
"{"                                                             return 'tk_llave1';
"}"                                                             return 'tk_llave2';
"("                                                             return 'tk_par1';
")"                                                             return 'tk_par2';
";"                                                             return 'tk_pycoma';
"?"                                                             return 'tk_interrogacion';
":"                                                             return 'tk_dpuntos';
","                                                             return 'tk_coma';
"<"                                                             return 'tk_menor';
">"                                                             return 'tk_mayor';
"<="                                                            return 'tk_menor_igual';
">="                                                            return 'tk_mayor_igual';
"!="                                                            return 'tk_diferente';
"!"                                                             return 'tk_not';
"="                                                             return 'tk_igual';
"||"                                                            return 'tk_or';
"&&"                                                            return 'tk_and';
"@"                                                             return 'tk_arr';
/* PALABRAS RESERVADAS */
"null"                                                          return 'pr_null';
"int"                                                           return 'pr_int';
"double"                                                        return 'pr_double';
"boolean"                                                       return 'pr_boolean';
"string"                                                        return 'pr_string';
"function"                                                      return 'pr_function';
"print"                                                         return 'pr_print';
"for"                                                           return 'pr_for';
"while"                                                         return 'pr_while';
"do"                                                            return 'pr_do';
"if"                                                            return 'pr_if';
"else"                                                          return 'pr_else';
"true"                                                          return 'pr_true';
"false"                                                         return 'pr_false';



/* EXPRESIONES REGULARES */
\"[^\"]*\"				                                        { yytext = yytext.substr(1,yyleng-2); return 'val_cadena'; }
\'[^\']*\'				                                        { yytext = yytext.substr(1,yyleng-2); return 'val_cadena'; }
[0-9]+("."[0-9]+)?                                              return 'val_decimal';
[0-9]+                                                          return 'val_entero';
[a-zA-Z_]+[a-zA-Z_0-9]*\b                                       return 'val_variable';
<<EOF>>                                                         return 'EOF';

.                           { console.log('error léxico'); }

/lex



%left 'tk_or'
%left 'tk_and'
%left 'tk_diferente' 'tk_igual'
%left 'tk_menor_igual' 'tk_mayor_igual' 'tk_menor' 'tk_mayor'
%left 'tk_suma' 'tk_resta'
%left 'tk_por' 'tk_div'
%right UMENOS // precedencia creada para reconocer expresiones con número negativos y no exista conflicto con la resta
%left 'tk_pot'
%left 'tk_mod'
//%right UNOT // precedencia creada para reconocer expresiones con número negativos y no exista conflicto con la diferencia

%start INICIO

%% 
// Producciones

INICIO : EXPRESION EOF {
    return $1;
}
;

EXPRESION : EXPRESION tk_suma EXPRESION {
    $$ = new Aritmetica($1,$3,TipoAritmetica.SUMA,@2.first_line, @2.first_column);
}
| EXPRESION tk_resta EXPRESION {
    $$ = new Aritmetica($1,$3,TipoAritmetica.RESTA,@2.first_line, @2.first_column);
}
|EXPRESION tk_por EXPRESION {
    $$ = new Aritmetica($1,$3,TipoAritmetica.MULTIPLICACION,@2.first_line, @2.first_column);
}
|EXPRESION tk_div EXPRESION {
    $$ = new Aritmetica($1,$3,TipoAritmetica.DIVISION,@2.first_line, @2.first_column);
}
| VALORES
| tk_par1 EXPRESION tk_par2 {
    $$ = $2;
}
| RELACIONALES {
    $$ = $1;
}
;

RELACIONALES : EXPRESION tk_menor EXPRESION {
    $$ = new Relacional($1,$3,TipoRelacional.MENOR,@2.first_line, @2.first_column);
}
|EXPRESION tk_mayor EXPRESION {
    $$ = new Relacional($1,$3,TipoRelacional.MAYOR,@2.first_line, @2.first_column);
}
|EXPRESION tk_menor_igual EXPRESION {
    $$ = new Relacional($1,$3,TipoRelacional.MENORIGUAL,@2.first_line, @2.first_column);
}
|EXPRESION tk_mayor_igual EXPRESION {
    $$ = new Relacional($1,$3,TipoRelacional.MAYORIGUAL,@2.first_line, @2.first_column);
}
|EXPRESION tk_igual tk_igual EXPRESION {
    $$ = new Relacional($1,$3,TipoRelacional.IGUAL,@2.first_line, @2.first_column);
}
|EXPRESION tk_diferente EXPRESION {
    $$ = new Relacional($1,$3,TipoRelacional.DIFERENTE,@2.first_line, @2.first_column);
};

VALORES : val_decimal {
   $$ = new Valor($1,@1.first_line, @1.first_column);
}
| val_entero {
    $$ = new Valor($1,@1.first_line, @1.first_column);
}
;