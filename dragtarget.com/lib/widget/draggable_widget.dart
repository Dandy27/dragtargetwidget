import 'package:dragtargetwidget/data/data.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final Animal animal;

  const DraggableWidget({
    Key? key,
    required this.animal,
  }) : super(key: key);

  static double size = 150;

  @override
  Widget build(BuildContext context) {
    
    return Draggable(
      data: animal,
      feedback: buildImage(),
      child: buildImage(),
      childWhenDragging: Container(height: size,),);
  }

  Widget buildImage() {
    return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24), color: Colors.white),
    child: Image.asset(animal.imageUrl),
  );
  }
}
