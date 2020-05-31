import 'package:bloc/bloc.dart';
import 'package:flutterapp12/pages/myaccountspage.dart';
import 'package:flutterapp12/pages/myaddpage.dart';
import 'package:flutterapp12/pages/myorderspage.dart';

import 'package:flutterapp12/pages/homepage.dart';

import '../../main.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
  MyAddClickedEvent,


}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState =>  HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
      case NavigationEvents.MyAddClickedEvent:
        yield MyAddPage();
        break;
    }
  }
}