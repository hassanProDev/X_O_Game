import 'package:flutter/material.dart';
import 'package:x_o_flutter/game_item.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = 'gameScareen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> playTools = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    PlayerModel playerModel =
        ModalRoute.of(context)?.settings.arguments as PlayerModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "X O Game ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                player1Score = 0;
                player2Score = 0;
                setState(() {});
              },
              child: Text(
                'rest the game',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${playerModel.player1Name} (X)',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          '$player1Score',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${playerModel.player2Name} (O)',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          '$player2Score',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameItem(
                    text: '${playTools[0]}',
                    index: 0,
                    func: onPlayerClick,
                  ),
                  GameItem(
                    text: '${playTools[1]}',
                    index: 1,
                    func: onPlayerClick,
                  ),
                  GameItem(
                    text: '${playTools[2]}',
                    index: 2,
                    func: onPlayerClick,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameItem(
                    text: '${playTools[3]}',
                    index: 3,
                    func: onPlayerClick,
                  ),
                  GameItem(
                    text: '${playTools[4]}',
                    index: 4,
                    func: onPlayerClick,
                  ),
                  GameItem(
                    text: '${playTools[5]}',
                    index: 5,
                    func: onPlayerClick,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameItem(
                    text: '${playTools[6]}',
                    index: 6,
                    func: onPlayerClick,
                  ),
                  GameItem(
                    text: '${playTools[7]}',
                    index: 7,
                    func: onPlayerClick,
                  ),
                  GameItem(
                    text: '${playTools[8]}',
                    index: 8,
                    func: onPlayerClick,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String playerRule = 'X';
  int counter = 0;

  void onPlayerClick(int index) {
    if (playTools[index].isNotEmpty) {
      return;
    }

    playTools[index] = playerRule;
    playerRule == 'X' ? playerRule = 'O' : playerRule = 'X';
    counter++;

    if (checkWinner('X')) {
      player1Score += 1;
      restAll();
    } else if (checkWinner('O')) {
      player2Score += 1;
      restAll();
    } else if (counter == 9) {
      restAll();
    }
    setState(() {});
  }

  bool checkWinner(String s) {
    for (int i = 0; i < 9; i += 3) {
      if (playTools[i] == s && playTools[i + 1] == s && playTools[i + 2] == s) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (playTools[i] == s && playTools[i + 3] == s && playTools[i + 6] == s) {
        return true;
      }
    }
    if (playTools[0] == s && playTools[4] == s && playTools[8] == s) {
      return true;
    }
    if (playTools[2] == s && playTools[4] == s && playTools[6] == s) {
      return true;
    }
    return false;
  }

  void restAll() {
    playTools = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }
}

class PlayerModel {
  String player1Name;
  String player2Name;

  PlayerModel(this.player1Name, this.player2Name);
}
