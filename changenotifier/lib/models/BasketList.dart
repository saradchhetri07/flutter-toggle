import 'package:tree/models/Basket.dart';

class BasketList {
   List<Basket> basketList = [];
  Basket basket = new Basket(id: 1, name: "Mango", Image: "", quantity: 10);
 Basket basket1 = new Basket(id: 2, name: "apple", Image: "", quantity: 10);
   Basket basket2 = new Basket(id: 3, name: "tomato", Image: "", quantity: 10);
  Basket basket3 =
      new Basket(id: 4, name: "pineapple", Image: "", quantity: 10);

 List<Basket> addBasket() {
    basketList.add(basket);
    basketList.add(basket1);
    basketList.add(basket2);
    basketList.add(basket3);

    return basketList;
  }

  
}
