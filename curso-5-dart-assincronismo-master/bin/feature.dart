void main() {
  // Future myFeature = Future(() {
  //   print('Going back to the future.');
  //   return 21;
  // }).then((value) => print('The value is $value'));

  Future<int> myFutureFunc() async {
    print('I have a function in the Future!');
    await Future.delayed(Duration(seconds: 5));
    print('after 5 seconds'); // 5th
    await Future.delayed(Duration(seconds: 5));
    throw Exception();
    print('5sec again');
    return 12;
  }

  // myFutureFunc()
  //     .then((value) => print('My function value is: $value'))
  //     .onError((error, stackTrace) => print('An Error ocurred'))
  //     .whenComplete(() => print('The Future is Over'));

  Future<int> myFutureErrorFunc(int a, int b) async {
    try {
      if (a > b) {
        throw Exception();
      }
      print('I have a functional Function');
      await Future.delayed(Duration(seconds: 5));
      return 42;
    } catch (e) {
      print('An error ocurred: $e');
      return 42;
    } finally {
      print('The Future is finally over');
    }
  }

  myFutureErrorFunc(2, 1).then((value) => print('the value is: $value'));

  print('Done with main');

  // Future exterminador = Future(() async {
  //   print('Venha comigo se quiser viver');
  //   await Future.delayed(Duration(seconds: 1));
  //   print('.');
  //   await Future.delayed(Duration(seconds: 1));
  //   print('.');
  //   await Future.delayed(Duration(seconds: 1));
  //   print('.');
  //   await Future.delayed(Duration(seconds: 1));
  //   print('.');
  //   await Future.delayed(Duration(seconds: 1));
  //   print('.');
  //   return 'Hasta la vista, baby';
  // }).then((value) => print(value));
}
