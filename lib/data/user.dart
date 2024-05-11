import 'address.dart';
import 'card.dart';

enum Gender {
  male,
  female,
  others;

  String get humanReadableName {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.others:
        return 'Others';
      default:
        return '';
    }
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
