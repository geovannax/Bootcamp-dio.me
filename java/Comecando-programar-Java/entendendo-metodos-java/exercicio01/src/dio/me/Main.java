package dio.me;

public class Main {
    public static void main(String[] args) {

        //realizando operações básicas
        calculadora.soma(2,3);
        calculadora.subtracao(2,3);
        calculadora.multiplicacao(2,3);
        calculadora.divisao(2,3);

        //Imprimindo saudações de acordo com a hora do dia
        mensagem.lerMensagem(6);
        mensagem.lerMensagem(13);
        mensagem.lerMensagem(19);
        mensagem.lerMensagem(125);

        //Calculando o valor total de um emprestimo
        Emprestimo.valorFinalEmprestimo(2000,10);
    }
}