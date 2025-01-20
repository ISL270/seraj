abstract interface class RemoteModel<D> {
  String get id;
  D toDomain();
}
