package loops;
import java.util.Scanner;

/*
Faça um programa que peça N números inteiros, calcule e mostre:
--> A quantidade de números pares
--> A quantidade de números impares
*/

public class ex04_imparPar {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int count=0 , numerosN;
        int numero;
        int numerosImpares =0, numerosPares =0 ;

        System.out.println("Informe a quantidade de numeros que deseja inserir: " );
        numerosN = scan.nextInt();
        do {
            System.out.println("Informe um numero " );
            numero=scan.nextInt();

            if (numero%2==0) numerosPares++;
            else numerosImpares++;

            count++;
        }while (count < numerosN) ;

        System.out.println("A quantidade de numero pares inseridos e = " + numerosPares);
        System.out.println("A quantidade de numero impares inseridos e = " + numerosImpares);

    }
}
