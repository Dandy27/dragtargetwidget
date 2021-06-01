import 'package:flutter/material.dart';
// import 'package:emojis/emojis.dart'; // to use Emoji collection
// import 'package:emojis/emoji.dart'; // to use Emoji utilities

import 'package:dragtargetwidget/data/data.dart';
import 'package:dragtargetwidget/widget/app_bar_widget.dart';
import 'package:dragtargetwidget/widget/draggable_widget.dart';

import '../utils.dart';

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
          acceptType: AnimalType.air,
        ),
      ],
    );
  }

  Widget buildTarget(BuildContext context,
      {required String text, required AnimalType acceptType}) {
    // Emoji chair;
    // chair = Emoji.byName('Grinning Face');
    // ! TODO NEXT

    return CircleAvatar(
      radius: 75,
      backgroundColor: Theme.of(context).primaryColor,
      child: DragTarget<Animal>(
        builder: (context, candidateData, rejectData) => Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 24),
        )),
        onWillAccept: (data) => true,
          onAccept: (data) {
            if (data.type == acceptType) {
              Utils.showSnackBar(
                context,
                text: 'This Is Correct 🥳',
                color: Colors.green,
              );

              setState(() {
                score += 50;
                all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
              });
            } else {
              setState(() => score -= 20);

              Utils.showSnackBar(
                context,
                text: 'Try Again! 😥',
                color: Colors.red,
              );
            }
          },
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
