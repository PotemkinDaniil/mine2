
import 'package:flutter/material.dart';

int countCard = 25;
int countRow = 5;
int countBomb = 14;
int countDia = 11;
int count = 7;

List diamands = [3, 5, 8, 10, 12, 8, 10, 11];
List bomb = [3, 4, 4, 6, 8, 7, 10, 14];
List cardsCount = [6, 9, 12, 16, 20, 15, 20, 25];
List rowCardCount = [2, 3, 4, 4, 4, 5, 5, 5];



showAlertDialog(BuildContext context,String res,List<Widget> w,var ok,String btn) {

  // set up the button
  Widget okButton = GestureDetector(
    onTap: ok,
    child: Container(
      alignment: Alignment.center,
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white)
      ),
      child: Text(btn,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
      
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color.fromARGB(255, 116, 162, 185),
    title: Text(res,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: w,),
    actions: [okButton]
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: Color.fromARGB(156, 17, 17, 18),
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}






