package com.dio;
public class Quadrilatero {

    public static double area(double lado){
        return lado * lado;
    }

    public static double area(double base, double altura){
        return base * altura;
    }

    public static double area(double baseMaior, double baseMenor, double altura){
        return ((baseMaior+baseMenor)*altura)/2;
    }

}
