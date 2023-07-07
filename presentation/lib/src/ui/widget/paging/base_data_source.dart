import 'dart:developer';

import 'package:domain/generic.dart';
import 'package:paging_view/paging_view.dart';

abstract base class BaseDataSource<S, D>
    extends DataSource<ItemPageSuccess<S>, D> {
  @override
  Future<LoadResult<ItemPageSuccess<S>, D>> load(
          LoadAction<ItemPageSuccess<S>> action) async =>
      switch (action) {
        Refresh() => await _fetch(null),
        Prepend(key: final _) => const None(),
        Append(key: final key) => await _fetch(key)
      };

  Future<LoadResult<ItemPageSuccess<S>, D>> _fetch(
      ItemPageSuccess<S>? previousPage) async {
    try {
      final ItemPage<S> page = await getItems(previousPage: previousPage);

      switch (page) {
        case ItemPageEmpty():
          // Although None() feels like the right thing to return here, it causes the PagingView to infinitely load more
          // pages. I assume this will cause problems on the server side. Looking at the source code, setting the
          // appendKey to null causes our parent DataSource to stop loading more pages.
          return const Success(page: PageData(data: [], appendKey: null));
        case ItemPageError():
          return Failure(e: page.error);
        case ItemPageSuccess():
          return Success(
              page: PageData(
                  data: page.items.map((item) => map(item)).toList(),
                  appendKey: page));
        default:
          throw Exception("Unknown ItemPage type");
      }
    } on Exception catch (e) {
      log("Something went wrong", error: e);
      return Failure(e: e);
    }
  }

  Future<ItemPage<S>> getItems({ItemPageSuccess<S>? previousPage});

  D map(S item);
}
