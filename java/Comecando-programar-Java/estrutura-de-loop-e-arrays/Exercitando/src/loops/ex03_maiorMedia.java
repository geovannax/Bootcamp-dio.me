package loops;

import java.util.Scanner;

/*
Faça um programa que:
--> leia 5 números
--> Informe o maior número
--> Informe a média desses números
*/

public class ex03_maiorMedia {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int numero;
        int cont = 0;
        int maior = 0;
        int soma = 0;
        do{
            System.out.println("Insira o numero: ");
            numero = scan.nextInt();
            if (maior < numero) maior = numero;
            cont++;
            soma += numero;
        }while (cont < 5);

        System.out.println("O maior numero e: " + maior);
        System.out.println("A media dos números inseridos e= : " + soma/5);

    }


}
