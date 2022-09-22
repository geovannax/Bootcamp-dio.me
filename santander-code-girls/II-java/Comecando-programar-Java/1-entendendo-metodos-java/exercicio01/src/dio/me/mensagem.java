package dio.me;

import javax.swing.*;

public class mensagem {
    public static void lerMensagem(int hora){
        if (hora >=0 && hora< 12){
            System.out.println("Bom dia!");
        } else if (hora>=12 && hora<18){
            System.out.println("Boa tarde!");
        } else if (hora>=18 && hora<24) {
            System.out.println("Boa noite!");
        } else {
            System.out.println("hora invalida");
        }

    }
}

