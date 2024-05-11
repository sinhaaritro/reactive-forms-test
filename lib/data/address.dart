import 'package:test_reactive_forms/data/location.dart';

class Address {
  final String address1;
  final String? address2;
  final Country country;
  final CountryState state;
  final int zip;

  Address({
    required this.address1,
    required this.address2,
    required this.country,
    required this.state,
    required this.zip,
  });

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
      CountryState? state,
      int? zip}) {
    return Address(
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        country: country ?? this.country,
        state: state ?? this.state,
        zip: zip ?? this.zip);
  }
}
