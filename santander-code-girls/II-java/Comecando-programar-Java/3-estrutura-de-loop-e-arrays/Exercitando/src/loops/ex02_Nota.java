package loops;
import java.util.Scanner;
/*
--> Faça um programa que peça uma nota, entre 0 e 10
--> Mostre uma mensagem caso o valor seja inválido e continue pedindo até o usuario informar um valor válido
*/
public class ex02_Nota {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int nota;

            System.out.println("Insira uma nota entre 0 e 1: ");
            nota = scan.nextInt();

        while (nota<0 || nota >10){
            System.out.println("Nota invalida, tente de novo:");
            nota = scan.nextInt();
        }

        System.out.println("Finalizado com sucesso!");
    }
}
