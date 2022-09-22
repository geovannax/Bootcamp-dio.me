package com.dio;

public class Main {
    public static void main(String[] args) {

        double areaQuadrado = com.dio.Quadrilatero.area(4);
        System.out.println("A area do quadrado e="+areaQuadrado);

        double areaRetangulo = com.dio.Quadrilatero.area(4, 8);
        System.out.println("A area do retangulo e="+areaRetangulo);

        double areaTrapezio = com.dio.Quadrilatero.area(8,4,10);
        System.out.println("A area do trapezio e="+areaTrapezio);

    }

}
