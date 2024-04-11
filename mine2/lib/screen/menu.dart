import 'dart:io';

import 'package:fbtest/components/params.dart';
import 'package:fbtest/screen/game/level_game.dart';
import 'package:fbtest/screen/game/enter_game.dart';
import 'package:fbtest/screen/game/settings_game.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  exitGame(){
    return showAlertDialog(context, 'Do you want exit game?', [
      GestureDetector(
        onTap: (){Navigator.of(context).pop();},
        child: menuButton('No'),
      ),
      GestureDetector(
        onTap: (){exit(0);},
        child: menuButton('Yes'),
      )
    ], (){Navigator.of(context).pop();;}, 'back');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            exitGame();
          }, icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/title.png'),
          GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => EnterGame()));},
            child: menuButton('Start'),
          ),
           GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LevelGame()));},
            child: menuButton('Levels'),
          ),
          GestureDetector(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsGame()));},
            child: menuButton('Settings'),
          ),
        ],
      ),
    );
  }
}




 menuButton(String s) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 69, 116, 197),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 5)),
      child: Text(
        s.toUpperCase(),
        style: TextStyle(
            fontSize: 32,
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.w800),
      ),
    );
  }