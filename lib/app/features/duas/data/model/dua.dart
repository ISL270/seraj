import 'package:equatable/equatable.dart';

final class Dua extends Equatable {
  final String? id;

  final String textOfDua;
  final String? numOfRepeat;
  final String? reward;
  final String? priority;
  final String? explanation;

  const Dua({
    required this.textOfDua,
    required this.reward,
    required this.numOfRepeat,
    required this.priority,
    required this.explanation,
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
        textOfDua,
        reward,
        numOfRepeat,
        priority,
        explanation,
      ];
}
