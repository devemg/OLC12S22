package Analiizadores; 
import java_cup.runtime.Symbol; 

%%

%class Lexico
%public
%line
%char
%unicode
%cup
%ignorecase


%%
// expresion regular              codigo asociado
"Evaluar"                   { return new Symbol(sym.EVALUAR, yyline, yychar, yytext());}

"+"                   { return new Symbol(sym.SUMA, yyline, yychar, yytext());}
"-"                   { return new Symbol(sym.RESTA, yyline, yychar, yytext());}
"*"                   { return new Symbol(sym.POR, yyline, yychar, yytext());}
"/"                   { return new Symbol(sym.DIV, yyline, yychar, yytext());}
";"                   { return new Symbol(sym.PTCOMA, yyline, yychar, yytext());}


[ \n\t\r]+                        {}
[0-9]+                            { return new Symbol(sym.NUMERO, yyline, yychar, yytext()); }
[0-9]+("."[0-9]+)?                { return new Symbol(sym.DECIMAL, yyline, yychar, yytext()); }

. {
    System.out.println("Este es un error léxico: "+yytext() + "en línea"+yyline+" y columna "+yychar);
}
