import 'package:fbtest/components/params.dart';
import 'package:fbtest/screen/game/start_game.dart';
import 'package:fbtest/screen/memory/memory_game.dart';
import 'package:fbtest/screen/menu.dart';
import 'package:flutter/material.dart';

class LevelGame extends StatelessWidget {
  const LevelGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => MemoryGame()));
            },
            child: menuButton('Cards Pairs'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder:(context, index) {
              return GestureDetector(
                onTap: (){
                   countCard = cardsCount[index];
                   countRow = rowCardCount[index];
                   countBomb = bomb[index];
                   countDia  = diamands[index];
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartGame()));
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(122, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white,width: 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Level ${index+1}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 22),),
                      Container(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/bomb.png',height: 50),
                          Text('${bomb[index]}',style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.w700),)
                        ],
                      )),
                      Container(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/dia.png',height: 50),
                          Text('${diamands[index]}',style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.w700),)
                        ],
                      ))
                    ],
                  ),
                ),
              );
            },),
          ),
        ],
      ),
    );
  }
}