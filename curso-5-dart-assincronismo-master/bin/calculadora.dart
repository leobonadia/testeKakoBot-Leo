// ignore_for_file: unused_local_variable

class Calculadora {
  String question;
  bool isConta = false;

  Calculadora(this.question);

  bool isContaF() {
    if (question.contains('mais') ||
        question.contains('menos') ||
        question.contains('vezes') ||
        question.contains('dividido') ||
        question.contains('Mais') ||
        question.contains('Menos') ||
        question.contains('Vezes') ||
        question.contains('Dividido')) {
      isConta = true;
    }
    return isConta;
  }

  calculadora() {
    takeNumbers();
    if (question.contains('mais') || question.contains('Mais')) {
      soma(takeNumbers().first, takeNumbers().last);
    } else if (question.contains('menos') || question.contains('Menos')) {
      subtracao(takeNumbers().first, takeNumbers().last);
    } else if (question.contains('vezes') || question.contains('Vezes')) {
      multiplicacao(takeNumbers().first, takeNumbers().last);
    } else if (question.contains('dividido') || question.contains('Dividido')) {
      divisao(takeNumbers().first, takeNumbers().last);
    }
  }

  soma(int a, int b) {
    print('A soma de $a mais $b é igual a ${a + b}');
  }

// TODO: ARRUMAR AS OUTRAS OPERAÇÕES IGUAL A SOMA
  int subtracao(int a, int b) {
    return a - b;
  }

  int multiplicacao(int a, int b) {
    return a * b;
  }

  double divisao(int a, int b) {
    return a / b;
  }

  List<int> takeNumbers() {
    List<int> numbers = [];
    List<String> stringSeparada = question.split(' ');
    for (int i = 0; i < stringSeparada.length; i++) {
      if (int.tryParse(stringSeparada[i]) != null) {
        int a = int.parse(stringSeparada[i]);
        numbers.add(a);
      }
    }
    return numbers;
  }
}

void main() {
  List<int> numbersList = [];
  String question = '1 mais 1';
  List<String> stringSeparada = question.split(' ');
  print(stringSeparada);

  for (int i = 0; i < stringSeparada.length; i++) {
    if (int.tryParse(stringSeparada[i]) != null) {
      int number = int.parse(stringSeparada[i]);
      print(number);
      numbersList.add(number);
      print(numbersList);
    } else {
      print('nada');
    }
  }
}
