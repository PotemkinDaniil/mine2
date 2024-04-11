import 'package:fbtest/components/params.dart';
import 'package:flutter/material.dart';

class StartGame extends StatefulWidget {
  const StartGame({super.key});

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  List cards = [];
  List cardsOpen = [];

  generateCard() {
    for (int i = 0; i < countCard; i++) {
      if (i > countDia - 1) {
        cards.add(0);
      } else {
        cards.add(1);
      }
    }
    cards.shuffle();
  }

  resFind(String s) {
    return showAlertDialog(
      context,
      s,
      [
        Text("You find : ",style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
        Image.asset('assets/dia.png', height: 50),
        Text(cardsOpen.where((e) => cards[e] == 1).length.toString(),style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
      ],
      () {
        setState(() {
          cardsOpen = [];
          cards = [];
          generateCard();
        });
        Navigator.of(context).pop();
      },
      "Restart"
    );
  }

  ruleFind(){
    return showAlertDialog(
      context,
      'Mines Finder Rules',
      [
        Text("Find crystals in the field, but beware of bombs. Trust your intuition and be as attentive as possible",style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
      ],
      () {
        Navigator.of(context).pop();
      },
      "Okay"
    );
  }

  @override
  void initState() {
    super.initState();
    generateCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {ruleFind();}, icon: Icon(Icons.info_outline_rounded))
        ],
      ),
      body: Column(children: [
        Expanded(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: countRow),
          itemCount: countCard,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  cardsOpen.add(index);
                });
                if (cards[index] == 0) {
                  resFind('You Lose!');
                }
                if (cardsOpen.where((e) => cards[e] == 1).length == countDia) {
                  resFind('You Win!');
                }
              },
              child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: cardsOpen.contains(index)
                          ? Color.fromARGB(207, 92, 93, 94)
                          : Color.fromARGB(139, 75, 140, 198),
                      borderRadius: BorderRadius.circular(8),
                      border: cardsOpen.contains(index)
                          ? Border.all(
                              color: Color.fromARGB(214, 226, 221, 226),
                              width: 2)
                          : null),
                  child: cardsOpen.contains(index)
                      ? Image.asset(
                          'assets/${cards[index] == 1 ? 'dia' : 'bomb'}.png')
                      : Image.asset('assets/q.png')),
            );
          },
        )),
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
              color: Color.fromARGB(93, 119, 120, 121),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/bomb.png', height: 50),
                  Text(
                    '${countBomb}',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/dia.png', height: 50),
                  Text(
                    '${countDia}/ ${cardsOpen.where((e) => cards[e] == 1).length}',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
            ],
          ),
        )
      ]),
    );
  }
}
