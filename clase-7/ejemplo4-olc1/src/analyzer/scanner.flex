package analyzer;
import java_cup.runtime.Symbol;

%%

%class Scanner
%public
%line
%char
%unicode
%cup
%ignorecase

%{
%}

%%
// expresion regular              codigo asociado
"Evaluar"                   { return new Symbol(sym.EVALUAR, yyline, (int) yychar, yytext());}

"+"                   { return new Symbol(sym.SUMA, yyline, (int)yychar, yytext());}
"-"                   { return new Symbol(sym.RESTA, yyline, (int)yychar, yytext());}
"*"                   { return new Symbol(sym.POR, yyline, (int)yychar, yytext());}
"/"                   { return new Symbol(sym.DIV, yyline, (int)yychar, yytext());}
";"                   { return new Symbol(sym.PTCOMA, yyline, (int)yychar, yytext());}


[ \n\t\r]+                        {}
[0-9]+                            { return new Symbol(sym.NUMERO, yyline, (int)yychar, yytext()); }
[0-9]+("."[0-9]+)?                { return new Symbol(sym.DECIMAL, yyline, (int)yychar, yytext()); }

. {
    Datos.errores.add("Este es un error léxico: "+yytext() + "en línea "+yyline+" y columna "+yychar);
}
