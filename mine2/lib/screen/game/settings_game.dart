import 'package:fbtest/screen/game/prv_game.dart';
import 'package:fbtest/screen/menu.dart';
import 'package:flutter/material.dart';

class SettingsGame extends StatelessWidget {
  const SettingsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrvGame()));
            },
            child: menuButton('Privacy Policy'),
          ),
        ],
      ),
    );
  }
}