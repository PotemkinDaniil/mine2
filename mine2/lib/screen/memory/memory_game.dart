import 'package:fbtest/components/params.dart';
import 'package:flutter/material.dart';

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<MemoryGame> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List cards = [];
  List cardsOpen = [];

  int a = -1;
  int b = -2;
  int att = 5;

  generateCard() {
    for (int i = 0; i < 16; i++) {
      if (i > 8 - 1) {
        cards.add(0);
      } else {
        cards.add(1);
      }
    }
    cards.shuffle();
  }

  resPairs(String r){
    return showAlertDialog(context, r,[Text('${5-att} attempts were used !',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w800),)],() {
        setState(() {
          cardsOpen = [];
          cards = [];
          generateCard();
          att =5;
          a = -1;
          b = -2;
        });
        Navigator.of(context).pop();
      },"Restart");
  }

  rulePairs(){
    return showAlertDialog(
      context,
      'Mines Finder Rules',
      [
        Text("Find the card pairs. This game is aimed at your intuition. You have only 5 attempts. Don't waste them!",style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
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
        title: Text(
          'Attempts: $att',
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {rulePairs();}, icon: Icon(Icons.info_outline_rounded))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: cards.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: a!=-1 && b!=-2?null:
                  () {
                    setState(() {
                      if (a == -1 && !cardsOpen.contains(index)) {
                        a = index;
                        cardsOpen.add(a);
                      } else if (b == -2 && !cardsOpen.contains(index)) {
                        b = index;
                        cardsOpen.add(b);
                        if (cards[a].toString() != cards[b].toString()) {
                          cardsOpen.remove(a);
                          cardsOpen.remove(b);
                          att -= 1;
                        }
                        a = -1;
                        b = -2;
                      }
                    });
                    if (cardsOpen.length == cards.length) {
                      resPairs('You Win!');
                    } else if (att == 0) {
                      resPairs('You Lose!');
                    }
                  },
                  child: AnimatedContainer(
                     duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: cardsOpen.contains(index)
                                  ? [
                                      Color.fromARGB(72, 193, 195, 197),
                                      Color.fromARGB(72, 193, 195, 197)
                                    ]
                                  : [
                                      Color.fromARGB(163, 74, 63, 199),
                                      Color.fromARGB(146, 7, 108, 197)
                                    ]),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Color.fromARGB(214, 226, 221, 226),
                              width: cardsOpen.contains(index) ? 3 : 1)),
                      child: cardsOpen.contains(index)
                          ? Image.asset(
                              'assets/${cards[index] == 1 ? 'dia' : 'bomb'}.png')
                          : Image.asset('assets/q.png')),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
