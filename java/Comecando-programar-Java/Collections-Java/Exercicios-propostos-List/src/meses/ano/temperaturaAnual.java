package meses.ano;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

/*
Faça  um programa que:
- receba a temperatura média dos 6 primeiros meses do ano e amarzene-as em uma lista. (temperaturas aleatórias) v
- Calcule a média semestral das temperaturas v
- Mostre todas as temperaturas acima destá media e o mês que ocorreram (Mostrar mês por extenso: 1- Janeiro)
 */


public class temperaturaAnual {
    @Override
    public String toString() {
        return "temperaturaAnual{}";
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Criando a lista
        List <Double> temperatures = new ArrayList<>();

        int mes = 0;
        // Adcionando temperatura média dos 6 primeiros meses
        for (int i = 0; i <= 5; i++){
            mes ++ ;
            System.out.println("Informe a temperatura media do mes "+ mes +": ");
            double temperaturas = scanner.nextDouble();
            temperatures.add(i, temperaturas);
        }

        // Exibindo a lista
        System.out.println(temperatures);
        // System.out.println(temperatures.toString());

        // Calculando a média das temperaturas
        Iterator <Double> iterator = temperatures.iterator();
        Double soma=0d;
        while (iterator.hasNext()){

            // adicionando elemento capitado pelo iterator na variavél next
            double next = iterator.next();

            soma+=next;
        }
        double media = soma/temperatures.size();
        System.out.println("A media das temperaturas dos ultimos 6 meses e= " + media );


       // Mostrando as temeperaturas acima da media e o mes
        System.out.println("---------- MESES COM TEMPERATURAS ACIMA DA MEDIA ----------");
        if (temperatures.get(0) > media ){
            System.out.println("1 - Janeiro = " + temperatures.get(0));
        }

        if (temperatures.get(1) > media ){
        System.out.println("2 - Fevereiro = " + temperatures.get(1));
        }

        if (temperatures.get(2) > media ) {
            System.out.println("3 - Marco = " + temperatures.get(2));
        }

        if (temperatures.get(3) > media ){
            System.out.println("4 - Abril = " + temperatures.get(3));
        }

        if (temperatures.get(4) > media ){
            System.out.println("5 - Maio = " + temperatures.get(4));
        }

        if (temperatures.get(5) > media ){
            System.out.println("6 - Junho = " + temperatures.get(5));
        }

    }

    }





