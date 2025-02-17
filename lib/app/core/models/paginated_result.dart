final class PaginatedResult<T> {
  final int page;
  final int pageSize;
  final List<T> elements;
  final bool hasReachedMax;

  const PaginatedResult._({
    required this.page,
    required this.elements,
    required this.pageSize,
    required this.hasReachedMax,
  });

  factory PaginatedResult.empty() => const PaginatedResult._(
        page: 0,
        elements: [],
        pageSize: 15,
        hasReachedMax: false,
      );

  factory PaginatedResult.firstPage(List<T> elements) => PaginatedResult._(
        page: 0,
        pageSize: 15,
        elements: elements,
        hasReachedMax: elements.length < 15,
      );

  PaginatedResult<T> appendResult(Iterable<T> newElements) {
    return PaginatedResult._(
      page: page + 1,
      pageSize: pageSize,
      elements: elements..addAll(newElements),
      hasReachedMax: newElements.length < pageSize,
    );
  }
}
