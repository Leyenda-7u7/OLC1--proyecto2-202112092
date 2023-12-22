package principal;

import analizador.Lexer;
import analizador.Parser;
import java.io.StringReader;

public class Main {

    public static void main(String[] args) throws Exception {
        
        //Frame ventana = new Frame();
        
        //ventana.show();
        analizador("src/statpy/", "Lexer.jflex", "Parser.cup");
        
        System.out.println( "---- Ejemplo 3 ----" );
        String entrada = "(5.2+2)*3" ;

        Lexer lex = new Lexer(new StringReader(entrada));
        //System.out.println( entrada );
        Parser sintax = new Parser(lex);
        System.out.println(sintax.parse().value);
        System.out.println( "---- Fin ejemplo 3 ----" );
        
        
    }
    public static void analizador(String ruta, String jflexFile, String cupFile){
        try {
            String opcionesJflex[] =  {ruta+jflexFile,"-d",ruta};
            jflex.Main.generate(opcionesJflex);

            String opcionesCup[] =  {"-destdir", ruta,"-parser","Parser",ruta+cupFile};
            java_cup.Main.main(opcionesCup);
            
        } catch (Exception e) {
            System.out.println("No se ha podido generar los analizadores");
            System.out.println(e);
        }
    }
    
    

}