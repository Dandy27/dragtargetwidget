import 'package:dragtargetwidget/main.dart';
import 'package:flutter/material.dart';

class DraggbleTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Center(
        child: Draggable(
          child: buildText('Drag Me', Colors.purple),
          feedback: Material(
            child: buildText('Dragged', Colors.green),
          ),
          childWhenDragging: buildText('Behind', Colors.red),
        ),
      ),
    );
  }

  Widget buildText(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: color,
      ),
      alignment: Alignment.center,
      height: 100,
      width: 160,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 32),
      ),
    );
  }
}
