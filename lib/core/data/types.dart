class UserType {
  static const String Client = 'Client';  //type 1
  static const String TruckOwner = 'TruckOwner';  //type 2
  static const String Admin = 'Admin';
}

class UserStatus {
  static const String Active = 'Active';
  static const String Inactive = 'Inactive';
  static const String Suspended = 'Suspended';
}

class SubscriptionType {
  static const String Free = 'Free';
  static const String Basic = 'Basic';
  static const String Premium = 'Premium';
}

class PaymentType {
  static const String Paystack = 'Paystack';
  static const String Paypal = 'Paypal';
  static const String Flutter = 'Flutter';
  static const String Stripe = 'Stripe';
}

class CargoWeightType {
  static const String Light = '0 - 1000kg';
  static const String Medium = '1001 - 5000kg';
  static const String Heavy = '5001 - 10000kg';
  static const String VeryHeavy = '10001kg and above';
}

List<String> cargoWeightTypes = [
  CargoWeightType.Light,
  CargoWeightType.Medium,
  CargoWeightType.Heavy,
  CargoWeightType.VeryHeavy,
];
