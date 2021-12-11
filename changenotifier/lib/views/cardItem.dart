import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree/basketProvider.dart';
import 'package:tree/models/Basket.dart';
import 'package:tree/models/BasketList.dart';

import '../toggleProvider.dart';

class cardItem extends StatefulWidget {
  const cardItem({Key? key}) : super(key: key);

  @override
  _cardItemState createState() => _cardItemState();
}

class _cardItemState extends State<cardItem> {
  BasketList newbasket = new BasketList();
  List<Basket> newbasketList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newbasketList = newbasket.addBasket();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Provider.of<DarkModeModel>(context, listen: false).darkMode;
    //final addtobasket =Provider.of<basketProvider>(context, listen: false).getCount;
    return Scaffold(
      // body: Container(),
      body: ListView.builder(
          itemCount: newbasketList.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: isDarkMode ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Column(
                    children: [
                      Text(
                        newbasketList[index].id.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            color: isDarkMode ? Colors.white : Colors.black),
                      ),
                      Text(
                        newbasketList[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            color: isDarkMode ? Colors.white : Colors.black),
                      ),
                      Text(
                        newbasketList[index].quantity.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            color: isDarkMode ? Colors.white : Colors.black),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<basketProvider>(context, listen: false)
                              .addToBasket(newbasketList[index],
                                  newbasketList[index].id);
                        },
                        icon: Icon(
                          Icons.add,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
