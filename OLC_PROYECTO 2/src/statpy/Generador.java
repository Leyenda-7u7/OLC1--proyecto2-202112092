
package statpy;


public class Generador {
    
    public static void main(String[] args) {
        compilar();
    }

    private static void compilar(){
        
        try {
            
            String ruta = "src/statpy/";  
            
            // Analisis lexico y sintactico JSON
            
            //ruta donde tenemos los archivos con extension .jflex y .cup
            String opcFlex[] = { ruta + "Lexer.jflex", "-d", ruta };
            jflex.Main.generate(opcFlex);
            String opcCUP[] = { "-destdir", ruta, "-parser", "Parser", ruta + "Parser.cup" };
            java_cup.Main.main(opcCUP);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
}