import 'package:flutter/cupertino.dart';
import 'package:tree/models/BasketList.dart';

import 'models/Basket.dart';

class basketProvider extends ChangeNotifier {
  late int count = 0;
  get getCount => count;

  List<Basket> basketlist = [];
  List<int> itemlist = [];

  addToBasket(Basket newbasket, int id) {
    itemlist.add(id);

    for (int i = 0; i < itemlist.length; i++) {

      print(itemlist);
    }
    notifyListeners();
    //print(basketlist[0].id);
  }
}
