import 'package:flutter/cupertino.dart';

class NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  bool reverse = false;
  PageController _pageController = PageController();

  int get paginaActual {
    return _paginaActual;
  }

  set setPaginaActual(int paginaActual) {
    _paginaActual = paginaActual;
    _pageController.animateToPage(paginaActual,
        duration: const Duration(milliseconds: 500), curve: Curves.slowMiddle);
    notifyListeners();
  }

  set setReverse(bool valor) {
    reverse = valor;
    notifyListeners();
  }

  get getReverse => reverse;

  PageController get pageControl => _pageController;
}
