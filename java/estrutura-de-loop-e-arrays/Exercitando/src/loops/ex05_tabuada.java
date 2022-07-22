package loops;
import java.util.Scanner;
/*
Desenvolva um gerador tabuada de qualquer número inteiro entre 1 e 10
O usuario deve informar de qual numero ele deseja ver a tabuada.
A saida deve ser conforme o exemplo a parte

Tabuada de 5:
5 x 1 =5
5 x 2 = 10
...
5 x 10 = 50
*/

public class ex05_tabuada {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        System.out.println("Informe qual tabuada de 0 a 10 deseja gerar: ");
        int numeroTabuada = scan.nextInt();

        System.out.println("_________________________________ TABUADA DO " + numeroTabuada + " _________________________________");

        for (int count =1; count <= 10; count++){
            System.out.println (numeroTabuada + "x" + count + "=" + numeroTabuada*count);
        }
    }

}
