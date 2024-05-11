enum CardType { credit, debit }

class Card {
  final CardType cardType;
  final int cardNumber;

  Card({
    required this.cardNumber,
    required this.cardType,
  });

  @override
  String toString() {
    return 'Card{cardNumber: $cardNumber, cardType: $cardType}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Card &&
          runtimeType == other.runtimeType &&
          cardNumber == other.cardNumber &&
          cardType == other.cardType;

  @override
  int get hashCode => cardNumber.hashCode ^ cardType.hashCode;

  Card copyWith({CardType? cardType, int? cardNumber}) {
    return Card(
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
    );
  }
}
