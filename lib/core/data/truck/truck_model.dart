class TruckEntity {
  final String id;
  String ownerId;
  String title;
  String description;
  String targetWeight;
  List<String> photos;

  TruckEntity({
    this.id = '',
    this.ownerId = '',
    this.title = '',
    this.description = '',
    this.targetWeight = '1-10,000kg',
    this.photos = const [],
  });
}

List<TruckEntity> trucksDemoList = [
  TruckEntity(
    id: '1',
    ownerId: '1',
    title: 'Truck 1',
    description: 'This is a truck description',
    photos: [
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
      'https://www.shutterstock.com/shutterstock/photos/10892035/display_1500/stock-photo-big-yellow-trailer-on-the-road-over-dramatic-blue-sky-with-white-clouds-10892035.jpg',
      'https://thumbs.dreamstime.com/b/penske-moving-truck-parking-lot-blue-sky-outdoor-s-parking-lot-lot-hutchinson-kansas-usa-penske-moving-323716156.jpg?w=768',
    ],
  ),
  TruckEntity(
    id: '2',
    ownerId: '1',
    targetWeight: '50-2500kg',
    title: 'The Best Truck in the World',
    description:
        'This is a truck description that describes the very best truck in the world. If you have any arguments, argue with your keyboard. Thank you and God bless you as I test a long form of truck title for the UI design.',
    photos: [
      'https://www.shutterstock.com/shutterstock/photos/10892035/display_1500/stock-photo-big-yellow-trailer-on-the-road-over-dramatic-blue-sky-with-white-clouds-10892035.jpg',
      'https://thumbs.dreamstime.com/b/penske-moving-truck-parking-lot-blue-sky-outdoor-s-parking-lot-lot-hutchinson-kansas-usa-penske-moving-323716156.jpg?w=768',
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
    ],
  ),
  TruckEntity(
    id: '3',
    ownerId: '2',
    targetWeight: "100-5000kg",
    title: 'This is a Truck Title of the Third Truck',
    description: 'This is a truck description of the third truck sample',
    photos: [
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      '',
    ],
  ),
  TruckEntity(
    id: '4',
    ownerId: '3',
    targetWeight: "240-6800kg",
    title: 'This is a Truck Title of the Fourth Truck',
    description: 'This is a truck description of the fourth truck sample',
    photos: [
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
    ],
  ),
  TruckEntity(
    id: '5',
    ownerId: '4',
    title: 'This is a Truck Title of the Fifth Truck',
    description: 'This is a truck description of the fifth truck sample',
    photos: [
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/red-truck-moving-highway-7886431.jpg?w=768',
    ],
  ),
];
