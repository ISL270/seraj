final class PaginatedResult<T> {
  final List<T> result;
  final int page;
  final int pageSize;
  final bool hasReachedMax;

  const PaginatedResult({
    this.result = const [],
    this.page = 0,
    this.pageSize = 15,
    this.hasReachedMax = false,
  });

  PaginatedResult<T> copyWith({
    int? page,
    bool? hasReachedMax,
  }) {
    return PaginatedResult<T>(
      result: result,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageSize: pageSize,
    );
  }

  PaginatedResult<T> appendResult(Iterable<T> result, {required bool hasReachedMax}) {
    this.result.addAll(result);
    return copyWith(
      page: page + 1,
      hasReachedMax: hasReachedMax,
    );
  }
}
