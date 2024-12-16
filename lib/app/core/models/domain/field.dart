import 'package:athar/app/core/models/domain/length_unit.dart';
import 'package:athar/app/core/models/domain/mass_unit.dart';
import 'package:equatable/equatable.dart';

sealed class Field extends Equatable {
  const Field();

  Map<String, dynamic> toJson();

  static Field fromJson(Map<String, dynamic> json) => switch (json['type']) {
        Time.key => Time.fromJson(json),
        Reps.key => Reps.fromJson(json),
        Weight.key => Weight.fromJson(json),
        Distance.key => Distance.fromJson(json),
        _ => throw UnimplementedError('Unknown field type'),
      };
}

class Time extends Field {
  final Duration value;
  const Time(this.value);

  factory Time.zero() => const Time(Duration.zero);

  @override
  Map<String, dynamic> toJson() => {
        'type': key,
        'value': value.inSeconds,
      };

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(Duration(seconds: (json['value'] as num).toInt()));
  }

  @override
  List<Object?> get props => [value];

  static const key = 'time';
}

class Distance extends Field {
  final Length value;
  const Distance(this.value);

  factory Distance.zero() => const Distance(Kilometer(0));

  @override
  Map<String, dynamic> toJson() => {
        'type': key,
        'value': value.toJson(),
      };

  factory Distance.fromJson(Map<String, dynamic> json) =>
      Distance(Length.fromJson(json['value'] as Map<String, dynamic>));

  @override
  List<Object?> get props => [value];

  static const key = 'distance';
}

class Weight extends Field {
  final Mass value;
  const Weight(this.value);

  factory Weight.zero() => const Weight(Kilogram(0));

  @override
  Map<String, dynamic> toJson() => {
        'type': key,
        'value': value.toJson(),
      };

  factory Weight.fromJson(Map<String, dynamic> json) =>
      Weight(Mass.fromJson(json['value'] as Map<String, dynamic>));

  @override
  List<Object?> get props => [value];

  static const key = 'weight';
}

class Reps extends Field {
  final int value;
  const Reps(this.value);
  factory Reps.zero() => const Reps(0);

  @override
  Map<String, dynamic> toJson() => {
        'type': key,
        'value': value,
      };

  factory Reps.fromJson(Map<String, dynamic> json) {
    return Reps((json['value'] as num).toInt());
  }

  @override
  List<Object?> get props => [value];

  static const key = 'reps';
}

extension FieldX on Field {
  bool get isTime => this is Time;
  bool get isReps => this is Reps;
  bool get isWeight => this is Weight;
  bool get isDistance => this is Distance;
}
