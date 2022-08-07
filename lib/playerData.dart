import 'package:flutter/material.dart';
import 'package:x_o_flutter/game_screen.dart';

class PlayerData extends StatelessWidget {
  static const String routeName = 'DataScreen';
  String player1Name = '';
  String player2Name = '';
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();

  PlayerData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player Data"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (name) {
                player1Name = name;
                print(player1Name);
              },
              controller: txt1,
              decoration: InputDecoration(
                hintText: "player One",
                contentPadding: EdgeInsets.all(8),
                hintStyle: Theme.of(context).textTheme.headline1,
                counterStyle: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: (name) {
                player2Name = name;
                print(player2Name);
              },
              controller: txt2,
              decoration: InputDecoration(
                hintText: "player Two",
                contentPadding: EdgeInsets.all(8),
                hintStyle: Theme.of(context).textTheme.headline1,
                counterStyle: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                txt1.text = '';
                txt2.text = '';
                Navigator.pushNamed(
                  context,
                  GameScreen.routeName,
                  arguments: PlayerModel(
                    player1Name == '' || player1Name == null
                        ? 'Player One'
                        : player1Name,
                    player2Name == '' || player1Name == null
                        ? 'player Two'
                        : player2Name,
                  ),
                );
              },
              child: Text(
                "New Game",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              alignment: Alignment.center,
              child: Text(
                'Created By Hassan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
