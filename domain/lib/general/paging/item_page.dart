sealed class ItemPage<T> {}

class ItemPageSuccess<T> extends ItemPage<T> {
  final List<T> items;
  final dynamic nextKey;

  ItemPageSuccess({required this.items, required this.nextKey});
}

class ItemPageError<T> extends ItemPage<T> {
  final Exception error;

  ItemPageError({required this.error});
}

class ItemPageEmpty<T> extends ItemPage<T> {}
