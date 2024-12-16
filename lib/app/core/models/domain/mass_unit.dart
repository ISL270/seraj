import 'package:equatable/equatable.dart';

sealed class Mass extends Equatable {
  final double value;
  const Mass(this.value);

  Map<String, dynamic> toJson();

  static Mass fromJson(Map<String, dynamic> json) => switch (json['unit'] as String) {
        Kilogram.symbol => Kilogram((json['value'] as num).toDouble()),
        _ => throw UnimplementedError('Unkonwn mass unit'),
      };
}

class Kilogram extends Mass {
  const Kilogram(super.value);

  @override
  Map<String, dynamic> toJson() => {
        'unit': symbol,
        'value': value,
      };

  @override
  String toString() {
    return '$value $symbol';
  }

  @override
  List<Object?> get props => [symbol, value];

  static const symbol = 'kg';
}

// We'll need the code below when we introduce more mass units.

// class Pound extends Mass {
//   static const symbol = 'lb';
//   const Pound(super.value);

//   @override
//   String toString() {
//     return '$value $symbol';
//   }

//   @override
//   List<Object?> get props => [symbol, value];
// }
