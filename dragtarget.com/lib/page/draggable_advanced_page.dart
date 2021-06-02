import 'package:dragtargetwidget/data/data.dart';
import 'package:dragtargetwidget/main.dart';
import 'package:dragtargetwidget/widget/draggable_widget.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class DraggableAdvancedPage extends StatefulWidget {
  @override
  _DraggableAdvancedPageState createState() => _DraggableAdvancedPageState();
}

class _DraggableAdvancedPageState extends State<DraggableAdvancedPage> {
  final List<Animal> all = allAnimals;
  final List<Animal> land = [];
  final List<Animal> air = [];

  void removeAll(Animal toRemove) {
    all.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    land.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    air.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
  }

  final double size = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTarget(context,
                text: 'All',
                animals: all,
                acceptTypes: AnimalType.values,
                onAccept: (data) => setState(() {
                      removeAll(data);
                      air.add(data);
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTarget(
                  context,
                  text: 'Animals',
                  animals: land,
                  acceptTypes:[ AnimalType.land],
                  onAccept: (data) => setState(() {
                    removeAll(data);
                    land.add(data);
                  }),
                ),
                buildTarget(context,
                    text: 'Birds',
                    animals: air,
                    acceptTypes:[ AnimalType.air],
                    onAccept: (data) => setState(() {
                          removeAll(data);
                          air.add(data);
                        }))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Animal> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Animal> onAccept,
  }) {
    return CircleAvatar(
      radius: size / 2,
      child: DragTarget<Animal>(
          builder: (context, candidateData, rejectDate) => Stack(
                children: [
                  ...animals.map((animal) => DraggableWidget(animal: animal)),
                  IgnorePointer(child: Center(child: buildText(text))),
                ],
              ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (acceptTypes.contains(data.type)) {
              Utils.showSnackBar(
                context,
                text: 'This is correct 🥳 ',
                color: Colors.green,
              );
            } else {
              Utils.showSnackBar(context,
                  text: 'This Looks Wrong 🤔', color: Colors.red);
            }
            onAccept(data);
          }),
    );
  }

  Widget buildText(String text) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 12),
      ]),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
      ),
    );
  }
}
