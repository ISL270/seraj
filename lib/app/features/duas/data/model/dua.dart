import 'package:equatable/equatable.dart';

final class Dua extends Equatable {
  final String? id;

  final String textOfDua;
  final String typeOfDua;
  final String numOfRepeat;
  final String timeOfDua;
  final String? duaNotes;

  const Dua({
    required this.textOfDua,
    required this.typeOfDua,
    required this.numOfRepeat,
    required this.timeOfDua,
    required this.duaNotes,
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
        textOfDua,
        typeOfDua,
        numOfRepeat,
        timeOfDua,
        duaNotes,
      ];
}
