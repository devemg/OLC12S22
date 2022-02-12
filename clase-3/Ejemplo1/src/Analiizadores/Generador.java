/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analiizadores;

/**
 *
 * @author devemg
 */
public class Generador {
    public static void main(String[] args) {
		try {
			String ruta =  "src/Analiizadores/";
			String opcFlex[] =  {ruta+"Lexico.jflex","-d",ruta};
			jflex.Main.generate(opcFlex);
			
			String opcCup[] =  {"-destdir", ruta,"-parser","Sintactico",ruta+"Sintactico.cup"};
			java_cup.Main.main(opcCup);
		} catch (Exception e) {
		}
	}
}
