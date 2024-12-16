import 'package:form_inputs/form_inputs.dart';

extension NameX on Name {
  String get initials {
    final parts = value.split(' ');
    final initials = parts.map((part) => part[0]).take(2).join();
    return initials.toUpperCase(); // Ensure the initials are uppercase
  }
}
