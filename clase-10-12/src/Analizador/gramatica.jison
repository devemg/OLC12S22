///configuraciones
%{

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
"date"                                                          return 'pr_date';
"counter"                                                       return 'pr_counter';
"time"                                                          return 'pr_time';
"function"                                                      return 'pr_function';
"print"                                                         return 'pr_print';
"for"                                                           return 'pr_for';
"while"                                                         return 'pr_while';
"do"                                                            return 'pr_do';
"if"                                                            return 'pr_if';
"else"                                                          return 'pr_else';
"true"                                                          return 'pr_true';
"false"                                                         return 'pr_false';
"create"                                                        return 'pr_create';
"use"                                                           return 'pr_use';
"drop"                                                          return 'pr_drop';
"not"                                                           return 'pr_not';
"exists"                                                        return 'pr_exists';
"database"                                                      return 'pr_database';
"table"                                                         return 'pr_table';
"primary"                                                       return 'pr_primary';
"key"                                                           return 'pr_key';
"alter"                                                         return 'pr_alter';
"add"                                                           return 'pr_add';
"truncate"                                                      return 'pr_truncate';
"rollback"                                                      return 'pr_rollback';
"commit"                                                        return 'pr_commit';
"user"                                                          return 'pr_user';
"with"                                                          return 'pr_with';
"password"                                                      return 'pr_password';
"on"                                                            return 'pr_on';
"grant"                                                         return 'pr_grant';
"revoke"                                                        return 'pr_revoke';
"insert"                                                        return 'pr_insert';
"into"                                                          return 'pr_into';
"values"                                                        return 'pr_values';
"set"                                                           return 'pr_set';
"where"                                                         return 'pr_where';
"update"                                                        return 'pr_update';
"delete"                                                        return 'pr_delete';
"from"                                                          return 'pr_from';
"select"                                                        return 'pr_select';
"where"                                                         return 'pr_where';


/* EXPRESIONES REGULARES */
\"[^\"]*\"				                                        { yytext = yytext.substr(1,yyleng-2); return 'val_cadena'; }
\'[^\']*\'				                                        { yytext = yytext.substr(1,yyleng-2); return 'val_cadena'; }
[0-9]+("."[0-9]+)?                                              return 'val_decimal';
[0-9]+                                                          return 'val_entero';
[a-zA-Z_]+[a-zA-Z_0-9]*\b                                       return 'val_variable';
<<EOF>>                                                         return 'EOF';

.                           { console.log('error léxico'); errores.push(new ErrorLexico(yytext, yylloc.first_line, yylloc.first_column)); }

/lex



%left 'tk_interrogacion' 'tk_dpuntos'
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

INICIO : EOF
;