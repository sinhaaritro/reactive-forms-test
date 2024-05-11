class Country {
  final String name;

  Country(this.name);

  @override
  String toString() {
    return 'Country{name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  Country copyWith({String? name}) {
    return Country(name ?? this.name);
  }
}

class CountryState {
  final Country country;
  final String name;

  CountryState(this.name, this.country);

  @override
  String toString() {
    return 'State{name: $name, country: $country}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryState &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          country == other.country;

  @override
  int get hashCode => name.hashCode ^ country.hashCode;

  CountryState copyWith({String? name, Country? country}) {
    return CountryState(name ?? this.name, country ?? this.country);
  }
}

List<Country> countries = <Country>[Country('India'), Country('USA')];

List<CountryState> states = <CountryState>[
  CountryState('Maharashtra', Country('India')),
  CountryState('Gujarat', Country('India')),
  CountryState('Alaska', Country('USA')),
  CountryState('Texas', Country('USA'))
];
