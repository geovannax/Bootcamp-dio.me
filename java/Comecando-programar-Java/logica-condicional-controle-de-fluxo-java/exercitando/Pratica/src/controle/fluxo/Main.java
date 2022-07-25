package controle.fluxo;

public class Main {
    public static void main(String[] args) {

        int mes=7;

        // Exiba o nome do mês do ano de acordo com seu número
        // verifique se o mês é julho, dezembro ou Janeiro para exibir "Ferias"

        switch (mes){
            case 1:
                System.out.println("Janeiro, mes de ferias");
            break;
            case 2:
                System.out.println("Fevereiro");
            break;
            case 3:
                System.out.println("Março");
            break;
            case 4:
                System.out.println("Abril");
            break;
            case 5:
                System.out.println("Maio");
            break;
            case 6:
                System.out.println("Junho");
            break;
            case 7:
                System.out.println("Julho, mes de ferias.");
            break;
            case 8:
                System.out.println("Agosto");
            break;
            case 9:
                System.out.println("Setembro");
            break;
            case 10:
                System.out.println("outubro");
            break;
            case 11:
                System.out.println("Novembro");
            break;
            default:
                System.out.println("Dezembro, mes de ferias");

        }


    }

}
