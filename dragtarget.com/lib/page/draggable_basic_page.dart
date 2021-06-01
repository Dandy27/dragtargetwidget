import 'package:dragtargetwidget/data/data.dart';
import 'package:dragtargetwidget/widget/app_bar_widget.dart';
import 'package:dragtargetwidget/widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:dragtargetwidget/data/data.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildOrigin(),
            buildTargets(context),
          ],
        ),
      ),
    );
  }

  Widget buildTargets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildTarget(
          context,
          text: 'Animals',
          acceptType: AnimalType.land,
        ),
        buildTarget(
          context,
          text: 'Bird',
          acceptType: AnimalType.land,
        ),
      ],
    );
  }

  Widget buildTarget(BuildContext context,
      {required String text, required AnimalType acceptType}) {
    return CircleAvatar(
      radius: 75,
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

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
