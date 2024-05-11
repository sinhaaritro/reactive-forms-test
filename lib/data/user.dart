import 'address.dart';
import 'card.dart';

enum Gender {
  male(id: 'male', name: 'Male'),
  female(id: 'female', name: 'Female'),
  others(id: 'others', name: 'Others');

  final String name;
  final String id;

  const Gender({required this.id, String? name}) : name = name ?? id;
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
  final Address? currentAddress;
  // Contact Info
  final List<String>? phoneAndEmail;
  final List<Card>? cards;
  // Family Info

  User({
    this.userName,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.gender,
    this.genderName,
    this.dateOfBirth,
    this.currentAddress,
    this.cards,
    this.phoneAndEmail,
  });
}
