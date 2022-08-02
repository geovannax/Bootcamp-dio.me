package loops;
import java.util.Scanner;
/*
Faça um programa que calcule o fatorial de um número inteiro fornecido pelo usuário.
ex.: 5!=120
*/
public class ex06_fatorial {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int multiplicacao = 1 ;

        System.out.println("Informe um numero inteiro para realizar o fatorial= ");
        int fatorial = scan.nextInt();

        System.out.println("----------------- FATORIAL DE " + fatorial + "-----------------");

        for (int count = fatorial; count >= 1 ; count --) {
            multiplicacao *= count;
        }

        System.out.println("O fatorial de "+ fatorial + " e = " + multiplicacao);

    }
}
