// ------------  Paquete e importaciones ------------
package analizador; 

import java_cup.runtime.*;

%%	
//-------> Directivas (No tocar)

%public 
%class Lexer
%cup
%char
%column
%line
%unicode
%ignorecase

%{ 

%} 

// ------> Expresiones Regulares 


PAREN_IZQ = "("
PAREN_DER = ")"
IGUAL = "="
PUNTOYCOMA = ";"
COMA = ","
ASTERISCO = "*"
MAS = "+"

int = "TIPO"
ID = [A-Za-z][A-Za-z0-9]*
ENTERO = [0-9]+
DECIMAL = [0-9]+("."[  |0-9]+)?
LETRA = [a-zA-Z]
COMENTARIO =(\/)(\/)[^\n]*\n

%%
// ------------  Reglas Lexicas -------------------



<YYINITIAL>"int" {return new Symbol (sym.TIPO, yytext());}

{ID}            {return new Symbol(sym.ID, yycolumn, yyline, yytext());}

//{int}            {return new Symbol(sym.TIPO, yycolumn, yyline, yytext());}

{COMENTARIO}    {System.out.println("Se reconocio token comentario " + " Lexema: " + yytext());}

{ENTERO}        {return new Symbol(sym.ENTERO, yycolumn, yyline, yytext());}

{DECIMAL}        {return new Symbol(sym.DECIMAL, yycolumn, yyline, yytext());}

{IGUAL}        {return new Symbol(sym.IGUAL, yycolumn, yyline, yytext());}

{PUNTOYCOMA}    {return new Symbol(sym.PUNTOYCOMA, yycolumn, yyline, yytext());}

{COMA}          {return new Symbol(sym.COMA, yycolumn, yyline, yytext());}

{ASTERISCO}     {return new Symbol(sym.ASTERISCO, yycolumn, yyline, yytext());}

{LETRA}         {return new Symbol(sym.LETRA, yycolumn, yyline, yytext());}

{MAS}         {return new Symbol(sym.MAS, yycolumn, yyline, yytext());}

{ASTERISCO}         {return new Symbol(sym.ASTERISCO, yycolumn, yyline, yytext());}

{PAREN_IZQ}         {return new Symbol(sym.PAREN_IZQ, yycolumn, yyline, yytext());}

{PAREN_DER}         {return new Symbol(sym.PAREN_DER, yycolumn, yyline, yytext());}









//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }

