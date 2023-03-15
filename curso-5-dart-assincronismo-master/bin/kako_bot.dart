import 'dart:io';

import 'calculadora.dart';
import 'questions/good_maners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

// TODO: ARRUMAR OS EVENTOS DE TEMPO
void main() async {
  String kakoBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().kakoBotStream(1, 10);
  var subscriber = myStream.listen((event) {
    print('             KakoBot está ativado por $event segundos');
  }, onDone: () {
    print('KakoBot está sendo finalizado! Faça a última pergunta');
    a = false;
  });

  print('-- Iniciando o KakoBOT, aguarde..--');
  await BotClock().clock(2);

  print('KakoBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      BotClock().clock(2);
      await TimeQuestions(usuario).timeQuestion();
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else if (Calculadora(usuario).isContaF()) {
      Calculadora(usuario).calculadora();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
      await BotClock().clock(2);
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KakoBOT--');
}
