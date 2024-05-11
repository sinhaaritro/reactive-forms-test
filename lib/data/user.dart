enum Gender { male, female, others }

enum CardType { credit, debit }

class Card {
  final String cardNumber;
  final CardType cardType;
  final String expiryDate;
  final String cvv;

  Card(
      {required this.cardNumber,
      required this.cardType,
      required this.expiryDate,
      required this.cvv});
}

class Address {
  final String address1;
  final String? address2;
  final String country;
  final String state;
  final int zip;

  Address(
      {required this.address1,
      required this.address2,
      required this.country,
      required this.state,
      required this.zip});
}

class User {
  // System Info
  final String? userName;
  final String? email;
  final String? password;
  // Personal Info
  final String? firstName;
  final String? lastName;
  final Gender? gender;
  final String? genderName;
  final DateTime? dateOfBirth;
  final Address? birthLocation;
  final List<Address>? address;
  final List<Card>? cards;
  // Contact Info
  final List<String>? phoneAndEmail;

  User({
    this.userName,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.gender,
    this.genderName,
    this.dateOfBirth,
    this.birthLocation,
    this.address,
    this.cards,
    this.phoneAndEmail,
  });
}
