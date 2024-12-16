String getInitials(String fullName) {
  final parts = fullName.split(' ');
  final initials = parts.map((part) => part[0]).take(2).join();
  return initials.toUpperCase(); // Ensure the initials are uppercase
}