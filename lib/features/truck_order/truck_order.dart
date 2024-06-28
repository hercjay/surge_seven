class TruckOrder {
  final String id;
  final String truckId;
  final String clientUsername;
  final String pickupLocation;
  final String destinationLocation;
  final String pickupDate;
  final String dropoffDate;
  final String cargoWeight;

  TruckOrder({
    this.id = '',
    this.truckId = '',
    this.clientUsername = '',
    this.pickupLocation = '',
    this.destinationLocation = '',
    required this.pickupDate,
    required this.dropoffDate,
    this.cargoWeight = '0 - 1000kg',
  });
}
