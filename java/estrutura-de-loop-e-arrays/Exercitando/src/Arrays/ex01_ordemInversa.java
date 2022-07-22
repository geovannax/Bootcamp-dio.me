package Arrays;
import java.util.Scanner;
/*
Crie um vetor de 6 números inteiros
e mostre-os na ordem inversa
*/
public class ex01_ordemInversa {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int[] vetor = {1,2,3,4,5,6};

        System.out.println("Vetor na ordem crescente: ");

        for (int i=0; i < vetor.length; i++) {

            System.out.println( vetor [i] + "");

        }
        System.out.println("\n Vetor na ordem Inversa");

        for (int i= (vetor.length - 1); i >= 0; i--) {

            System.out.println( vetor [i] + "");

        }

    }
}
