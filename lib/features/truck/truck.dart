class Truck {
  final String id;
  String ownerUsername;
  String title;
  String description;
  String targetWeight;
  List<String> photos;
  bool isAvailable;
  double cost;

  Truck({
    this.id = '',
    this.ownerUsername = '',
    this.title = '',
    this.description = '',
    this.targetWeight = '1-10,000kg',
    this.photos = const [],
    this.isAvailable = true,
    this.cost = 5000,
  });
}

List<Truck> trucksDemoList = [
  Truck(
    id: '1',
    ownerUsername: 'IfeanyiTheSweebor',
    title: 'The Mighty Hauler',
    description:
        'The Mighty Hauler is a powerful truck designed for heavy-duty hauling. With its robust engine and sturdy construction, it can handle any load with ease. Whether you need to transport construction materials or deliver goods across long distances, the Mighty Hauler is up to the task.!',
    photos: [
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
      'https://www.shutterstock.com/shutterstock/photos/10892035/display_1500/stock-photo-big-yellow-trailer-on-the-road-over-dramatic-blue-sky-with-white-clouds-10892035.jpg',
      'https://thumbs.dreamstime.com/b/penske-moving-truck-parking-lot-blue-sky-outdoor-s-parking-lot-lot-hutchinson-kansas-usa-penske-moving-323716156.jpg?w=768',
    ],
  ),
  Truck(
    id: '2',
    ownerUsername: 'MichaelTheGreat',
    targetWeight: '50-2500kg',
    title: 'The Beast of the Road',
    description:
        'The Beast of the Road is the ultimate truck that combines power, performance, and reliability. With its state-of-the-art engine and advanced features, it can conquer any terrain and handle the toughest hauling tasks. Whether you need to transport heavy machinery or deliver goods across challenging landscapes, the Beast of the Road is up to the challenge. Its spacious interior provides comfort for long journeys, and its robust construction ensures durability and safety. Experience the unrivaled power and dominance of the Beast of the Road today!',
    photos: [
      'https://www.shutterstock.com/shutterstock/photos/10892035/display_1500/stock-photo-big-yellow-trailer-on-the-road-over-dramatic-blue-sky-with-white-clouds-10892035.jpg',
      'https://thumbs.dreamstime.com/b/penske-moving-truck-parking-lot-blue-sky-outdoor-s-parking-lot-lot-hutchinson-kansas-usa-penske-moving-323716156.jpg?w=768',
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
    ],
  ),
  Truck(
    id: '3',
    ownerUsername: 'SapaNation',
    targetWeight: "100-5000kg",
    title: 'The Reliable Transporter',
    description:
        'The Reliable Transporter is a versatile truck that can handle a wide range of transportation needs. Whether you need to deliver goods locally or transport heavy loads across long distances, this truck is up to the task. With its powerful engine and durable construction, it offers exceptional reliability and performance. The spacious interior provides comfort for the driver and ensures a smooth ride. Experience the reliability and efficiency of the Reliable Transporter today!',
    photos: [
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      '',
    ],
  ),
  Truck(
    id: '4',
    ownerUsername: 'FaceOfComposure',
    targetWeight: "240-6800kg",
    title: 'The Heavy Duty Hauler',
    description:
        'The Heavy Duty Hauler is a powerful truck designed for heavy-duty hauling. With its robust engine and sturdy construction, it can handle any load with ease. Whether you need to transport construction materials or deliver goods across long distances, the Heavy Duty Hauler is up to the task. It offers exceptional reliability, fuel efficiency, and safety features, making it the perfect choice for professional truckers. Experience the power and performance of the Heavy Duty Hauler today!',
    photos: [
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/fast-moving-truck-993923.jpg?w=768',
    ],
  ),
  Truck(
    id: '5',
    ownerUsername: 'WeMuevee',
    title: 'The Reliable Transporter XL',
    description:
        'The Reliable Transporter XL is a versatile truck that can handle a wide range of transportation needs. Whether you need to deliver goods locally or transport heavy loads across long distances, this truck is up to the task. With its powerful engine and durable construction, it offers exceptional reliability and performance. The spacious interior provides comfort for the driver and ensures a smooth ride. Experience the reliability and efficiency of the Reliable Transporter XL today!',
    photos: [
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/truck-moving-down-street-city-truck-moving-down-street-105358668.jpg?w=768',
      'https://thumbs.dreamstime.com/b/red-truck-moving-highway-7886431.jpg?w=768',
    ],
  ),
];
