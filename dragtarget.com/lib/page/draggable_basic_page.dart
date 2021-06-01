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
      body: Column(
        children: [buildOrigin(), buildTarget(context)],
      ),
    );
  }

  Widget buildTarget(BuildContext context, {required String text,
  required AnimalType acceptType,})
  

   => CircleAvatar(
      radius: 75,
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(''),
      // ! TODO VERIFICAR 
    );
  

  Stack buildOrigin() {
    return Stack(
      alignment: Alignment.center,
      children: all
          .map(
            (animal) => DraggableWidget(animal: animal),
          )
          .toList(),
    );
  }
}
