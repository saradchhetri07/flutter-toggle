import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:tree/basketProvider.dart';
import 'package:tree/toggleProvider.dart';

import 'views/cardItem.dart';

void main() => runApp(
  
  RunApp(),
    );

class RunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DarkModeModel()
        ),
         ChangeNotifierProvider(
          create: (_) => basketProvider()
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: gethome(),
      ),
    );
  }
}

class gethome extends StatefulWidget {
  const gethome({Key? key}) : super(key: key);

  @override
  _gethomeState createState() => _gethomeState();
}

class _gethomeState extends State<gethome> {
  @override
  Widget build(BuildContext context) {
    //double _height = MediaQuery.of(context).size.height;
    final isDarkMode =
        Provider.of<DarkModeModel>(context, listen: false).darkMode;
    final finalCount= Provider.of<basketProvider>(context, listen: false).getCount;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,

        
          
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                //SizedBox(width: 20.0,),

                 Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                child: SlidingSwitch(
                  
                    value: false,
                    width: 250,
                    onChanged: (bool value) {
                      //print(value);
                    },
                    height: 55,
                    animationDuration: const Duration(milliseconds: 200),
                    onTap: () {
                      setState(() {
                        Provider.of<DarkModeModel>(context, listen: false).toggle();
                      });
                    },
                    //onDoubleTap: () {},
                    onSwipe: () {},
                    textOff: "Off",
                    textOn: "on",
                    colorOn: const Color(0xff6682c0),
                    colorOff: const Color(0xff6682c0),
                    background: const Color(0xffe4e5eb),
                    buttonColor: const Color(0xfff7f5f7),
                    inactiveColor: const Color(0xff636f7b),
                  ),
              ),
              Container(
                 child:Stack(
                   children: [
                    IconButton(onPressed: (){
                      setState(() {
                        
                      });
                      //Provider.of<basketProvider>(context, listen: false).addToBasket(newbasket, id)
                    }, icon: Icon(Icons.shopping_basket,color: isDarkMode?Colors.white:Colors.black,),),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      child: Container(
                      height: 20.0,
                      width: 20,
                      //color: Colors.green,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(6.0)
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Center(
                        child: Text(
                          finalCount.toString()),
                      ),
                    )
                    
                    )
                   ],
                 )
               
              )
        
              ],),
              Expanded(child: cardItem())
        
             
            ],
          ),
        
      )
      
      // CustomScrollView(slivers: [
      //   SliverAppBar(
      //     floating: true,
      //     expandedHeight: 100,
      //     backgroundColor: Colors.white,
      //     pinned: true,
      //   actions: [
      //      Padding(
      //        padding: const EdgeInsets.only(top:8.0,right: 8.0),
      //        child: 
      //      ),

      //   ],
      //   ),
      //   SliverToBoxAdapter(
      //     child: cardItem(),
      //   )
        
      // ],)
        // Column(
         
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(top:8.0,right:8.0),
        //       child: SlidingSwitch(
        //         value: false,
        //         width: 250,
        //         onChanged: (bool value) {
        //           print(value);
        //         },
        //         height: 55,
        //         animationDuration: const Duration(milliseconds: 200),
        //         onTap: () {
        //           setState(() {
        //             Provider.of<DarkModeModel>(context, listen: false).toggle();
        //           });
        //         },
        //         //onDoubleTap: () {},
        //         onSwipe: () {},
        //         textOff: "Off",
        //         textOn: "on",
        //         colorOn: const Color(0xff6682c0),
        //         colorOff: const Color(0xff6682c0),
        //         background: const Color(0xffe4e5eb),
        //         buttonColor: const Color(0xfff7f5f7),
        //         inactiveColor: const Color(0xff636f7b),
        //       ),
        //     ),
            
        //   ],
        // ),
      
    );
  }
}


