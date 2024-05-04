import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget{
  const PositionedTiles({super.key});

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles>{
 late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    
    tiles = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        key: UniqueKey(),
        child: const StatefulColorfulTile(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        key: UniqueKey(),
        child: const StatefulColorfulTile(),
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Row(children: tiles)),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.sentiment_very_satisfied)),
      );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorfulTile extends StatefulWidget{

  const StatefulColorfulTile({super.key});

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  late Color color;
  @override
  void initState() {
    super.initState();
    color = RandomColorGenerator.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color,
    );
  }
}

class RandomColorGenerator {
  static Color getColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), 
      random.nextInt(256), 
      random.nextInt(256), 
      1);
  }
}



