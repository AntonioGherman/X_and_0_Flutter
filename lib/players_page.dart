
import 'package:flutter/material.dart';

import 'game_page.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({super.key});
  final TextEditingController _playerOne = TextEditingController();
  final TextEditingController _playerTwo = TextEditingController();
  late double _buttonSize;


  // @override
  // void dispose() {
  //   _playerOne.dispose();
  //  // _playerTwo.dispose();
  //   super.dispose();
  // }


  void resetGame(){
    _playerOne.clear();
    _playerTwo.clear();
  }

  @override
  Widget build(BuildContext context) {
    _buttonSize=MediaQuery.of(context).size.width;
    resetGame();
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Players'),
      ),
      body: 
      Padding(
      padding:EdgeInsets.all(10),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Enter the first player',
          style: TextStyle(fontSize: 20)),
          Padding(padding: EdgeInsets.only(top: 15,bottom: 15),
              child:
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First player'),
            keyboardType: TextInputType.name,
            controller: _playerOne,
          )),
          Text('Enter the second player',
              style: TextStyle(fontSize: 20)),
          Padding(padding: EdgeInsets.only(top: 15,bottom: 15),
              child:
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Second player'),
                keyboardType: TextInputType.name,
                controller: _playerTwo,
              )),
          SizedBox(
            width: _buttonSize,
            child:
          ElevatedButton.icon(
            icon: const Icon(Icons.play_circle),
              onPressed: (){
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  GamePage(
                      playerOneName: _playerOne.value.text,
                      playerTwoName: _playerTwo.value.text)));
              },
              label: Text('Play'),

          ))
        ],
      ),
      )
    );
  }
}
