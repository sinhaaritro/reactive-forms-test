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

class State {
  final Country country;
  final String name;

  State(this.name, this.country);

  @override
  String toString() {
    return 'State{name: $name, country: $country}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is State &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          country == other.country;

  @override
  int get hashCode => name.hashCode ^ country.hashCode;

  State copyWith({String? name, Country? country}) {
    return State(name ?? this.name, country ?? this.country);
  }
}

List<Country> countries = <Country>[Country('India'), Country('USA')];

List<State> states = <State>[
  State('Maharashtra', Country('India')),
  State('Gujarat', Country('India')),
  State('Alaska', Country('USA')),
  State('Texas', Country('USA'))
];
