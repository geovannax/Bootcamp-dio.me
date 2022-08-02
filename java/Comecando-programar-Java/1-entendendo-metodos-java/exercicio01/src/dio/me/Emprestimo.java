package dio.me;

public class Emprestimo {

    public static void valorFinalEmprestimo (int valorDesejado , int quantidadeParcela){
        float quantidadeDeJurosPorParcela = 2;
        float valorTotalEmprestimo = (quantidadeDeJurosPorParcela*quantidadeParcela)+valorDesejado;
        System.out.println("O valor total que sera pago do emprestimo, solicitado="+valorTotalEmprestimo);
    }

}
