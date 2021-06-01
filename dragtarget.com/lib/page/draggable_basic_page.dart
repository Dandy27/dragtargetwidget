import 'package:dragtargetwidget/data/data.dart';
import 'package:dragtargetwidget/widget/app_bar_widget.dart';
import 'package:dragtargetwidget/widget/draggable_widget.dart';
import 'package:flutter/material.dart';

class DraggableBasicPage extends StatefulWidget {
  @override
  _DraggableBasicPageState createState() => _DraggableBasicPageState();
}

class _DraggableBasicPageState extends State<DraggableBasicPage> {
  final List<Animal> all = allAnimals;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(score: score),
      body: Center(child: Stack(alignment: Alignment.center,
      children: all.map((animal) => DraggableWidget(animal: animal),).toList(),)),
    );
    
  }
}
