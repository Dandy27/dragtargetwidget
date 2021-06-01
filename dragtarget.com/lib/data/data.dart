enum AnimalType { land, air }

class Animal {
  final String imageUrl;
  final AnimalType type;

  Animal({required this.imageUrl, required this.type});
}

final allAnimals = [
  Animal(imageUrl: 'assets/animal1.png', type: AnimalType.land),
  Animal(imageUrl: 'assets/bird1.png', type: AnimalType.air),
  Animal(imageUrl: 'assets/bird2.png', type: AnimalType.air),
  Animal(imageUrl: 'assets/animal2.png', type: AnimalType.land),
  Animal(imageUrl: 'assets/bird3.png', type: AnimalType.air),
  Animal(imageUrl: 'assets/animal3.png', type: AnimalType.land),
];
