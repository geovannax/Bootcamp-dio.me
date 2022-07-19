package br.com.dio;

public class quadrilateros {

    public static void area(float lado){
        float areaQ=lado*lado;
        System.out.println("Area do quadrado="+areaQ);
    }

    public static void area(float base, float altura){
        float areaQ=base*altura;
        System.out.println("Area do quadrado="+areaQ);
    }

    public static void area(float baseMaior, float baseMenor, float altura){
        float areaQ=((baseMaior+baseMenor)*altura)/2;
        System.out.println("Area do quadrado="+areaQ);
    }

}
