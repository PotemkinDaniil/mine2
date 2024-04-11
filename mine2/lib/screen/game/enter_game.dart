import 'package:fbtest/components/params.dart';
import 'package:fbtest/screen/game/start_game.dart';
import 'package:fbtest/screen/menu.dart';
import 'package:flutter/material.dart';

class EnterGame extends StatefulWidget {
  const EnterGame({super.key});

  @override
  State<EnterGame> createState() => _EnterGameState();
}

class _EnterGameState extends State<EnterGame> {

  boxSelect(String icon,String r){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: (){
          if(count > 0){
            setState(() {
              count--;
            });
          }else{
            setState(() {
              count = 7;
            });
          }
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 42)),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(icon))
              ),
              child: Text(r,style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w800),),
            )
          ],
        ),
        IconButton(onPressed: (){
          if(count < diamands.length-1){
             setState(() {
              count++;
            });
          }else{
            setState(() {
              count = 0;
            });
          }
        }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 42))
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text('Mines count'.toUpperCase(),style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 21,fontWeight: FontWeight.w800),)),
          boxSelect('assets/bomb.png',bomb[count].toString()),
          Container(
            margin: EdgeInsets.all(10),
            child: Text('Row count'.toUpperCase(),style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 21,fontWeight: FontWeight.w800),)),
          boxSelect('assets/dia.png',rowCardCount[count].toString()),
          Container(
            margin: EdgeInsets.all(10),
            child: Text('Diamands count'.toUpperCase(),style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 21,fontWeight: FontWeight.w800),)),
          boxSelect('assets/dia.png',diamands[count].toString()),
          GestureDetector(
            onTap: (){
              setState(() {
                countCard = cardsCount[count];
                countRow = rowCardCount[count];
                countBomb = bomb[count];
                countDia  = diamands[count];
              });
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartGame()));
            },
            child: menuButton('Enter'),
          )
        ],
      ),
    );
  }
}