abstract interface class RemoteModel<D> {
  // Map<String, dynamic> toJson();
  D toDomain();
}
