import 'package:test_reactive_forms/data/location.dart';

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
  final Country country;
  final State state;
  final int zip;

  Address(
      {required this.address1,
      required this.address2,
      required this.country,
      required this.state,
      required this.zip});

  @override
  String toString() {
    return 'Address{address1: $address1, address2: $address2, country: $country, state: $state, zip: $zip}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          runtimeType == other.runtimeType &&
          address1 == other.address1 &&
          address2 == other.address2 &&
          country == other.country &&
          state == other.state &&
          zip == other.zip;

  @override
  int get hashCode =>
      address1.hashCode ^
      address2.hashCode ^
      country.hashCode ^
      state.hashCode ^
      zip.hashCode;

  Address copyWith(
      {String? address1,
      String? address2,
      Country? country,
      State? state,
      int? zip}) {
    return Address(
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        country: country ?? this.country,
        state: state ?? this.state,
        zip: zip ?? this.zip);
  }
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
